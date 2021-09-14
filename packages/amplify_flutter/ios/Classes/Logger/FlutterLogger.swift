//
//  NativeLogger.swift
//  amplify_flutter
//
//  Created by Nys, Dillon on 7/8/21.
//

import Amplify
import Foundation
import Flutter
import class os.log.OSLog
import struct os.log.OSLogType
import func os.os_log

/// Default log level within Amplify Flutter.
public let defaultLogLevel = LogLevel.warn

/// Subsystem used by Amplify Flutter [os_log] statements. Console logs can be filtered using this string.
public let osLogSubsystem = "com.amazonaws.amplify.flutter"

extension LogLevel {
    static var none: LogLevel? = nil
}

extension LogLevel: Codable {}

extension LogLevel: CaseIterable {
    public static var allCases: [LogLevel] = [
        .error,
        .warn,
        .info,
        .debug,
        .verbose
    ]
}

/// The levels for logging.
extension LogLevel {
    /// The equivalent [OSLogType] for use with [os_log].
    var osLogType: OSLogType {
        switch self {
        case .verbose, .debug:
            return .debug
        case .info:
            return .info
        case .warn:
            return .default
        case .error:
            return .error
        }
    }
    
    /// The string used to identify log levels.
    var displayString: String {
        switch self {
        case .verbose, .debug:
            return "DEBUG"
        case .info:
            return "INFO"
        case .warn:
            return "WARN"
        case .error:
            return "ERROR"
        }
    }
}

extension CategoryType: Codable {}

/// A record for encoding and passing to the Dart layer.
struct LogRecord: Codable {
    var buffered: Bool = false
    let level: LogLevel
    let category: CategoryType?
    let message: String
}

/// Logger for handling Flutter-Native communication of logs.
class FlutterLogger: NSObject, FlutterStreamHandler {
    static let shared = FlutterLogger()
    
    /// The log level for this logger.
    var logLevel: LogLevel? = defaultLogLevel
    
    /// Event channel used for communicating with Dart layer.
    private var eventSink: FlutterEventSink?
    
    /// Buffer of log records while Dart sets up stream handlers.
    private var buffer: [LogRecord] = []
    
    /// Whether or not the logger has been configured and connected to the Dart layer.
    private var configured: Bool { eventSink != nil }
    
    private override init() {
        super.init()
    }
    
    /// Sends the record to the Dart layer, if possible.
    private func sendMessage(_ logRecord: LogRecord) {
        guard let eventSink = eventSink else { return }
        
        
        DispatchQueue.main.async {
            eventSink(logRecord)
        }
    }
    
    /// Buffers a log message until we've received a listener.
    private func bufferMessage(_ logRecord: LogRecord) {
        // Prevents the need for a lock
        DispatchQueue.main.async {
            self.buffer.append(logRecord)
        }
    }
    
    /// Logs a message by either sending it to the Dart layer or buffering it until later.
    func logMessage(_ message: String, level: LogLevel, category: CategoryType?, osLog: OSLog) {
        var logRecord = LogRecord(level: level, category: category, message: message)
        
        guard configured else {
            logRecord.buffered = true
            bufferMessage(logRecord)
            return
        }
        
        let osLogType = level.osLogType
        let displayString = level.displayString
        
        os_log("[%{public}@]: %{private}@", log: osLog, type: osLogType, displayString, message)
        sendMessage(logRecord)
    }
    
    public func configureLogLevel(level: Any?) -> FlutterError? {
        guard let logLevelInt = level as? Int? else {
            return FlutterError(
                code: "INVALID_ARGUMENTS",
                message: """
                    Invalid log level passed. Expected \"Int\"
                    (\(LogLevel.allCases.first!.rawValue) - \(LogLevel.allCases.last!.rawValue)),
                    got \(String(describing: level))
                    """,
                details: nil)
        }
        self.logLevel = logLevelInt == nil ? nil : LogLevel(rawValue: logLevelInt!)
        return nil
    }
    
    public func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        if let error = configureLogLevel(level: arguments) {
            return error
        }
        self.eventSink = events
        
        // Send buffered events
        DispatchQueue.main.async { [self] in
            for record in buffer {
                sendMessage(record)
            }
            buffer = []
        }
        return nil
    }
    
    public func onCancel(withArguments arguments: Any?) -> FlutterError? {
        eventSink = nil
        return nil
    }
}

/// Thread-safe logger for use in Amplify Flutter categories.
public struct CategoryLogger: Logger {
    /// By default, our loggers will not control their own level. Instead they will default to the global Flutter setting. Internally, we
    /// can adjust the category's log level, if needed, though.
    private var categoryLogLevel: LogLevel?
    
    /// The log level, as configued in Flutter or overridden by the native user.
    private var flutterLogLevel: LogLevel? {
        get { categoryLogLevel ?? FlutterLogger.shared.logLevel }
    }
    
    /// Provides conformance to [Logger.logLevel].
    public var logLevel: LogLevel {
        get { flutterLogLevel ?? defaultLogLevel }
        set { categoryLogLevel = newValue }
    }
    
    /// OSLog used for integrating with platform-specific flows.
    private let osLog: OSLog
    
    /// The category this logger records for.
    private let category: CategoryType?
    
    public init(category: CategoryType?, logLevel: LogLevel? = nil) {
        self.osLog = OSLog(subsystem: osLogSubsystem, category: category?.displayName ?? "Amplify")
        self.category = category
        self.categoryLogLevel = logLevel
    }
    
    private func logMessage(_ message: @autoclosure () -> String, level: LogLevel) {
        guard let flutterLogLevel = flutterLogLevel, flutterLogLevel <= logLevel else { return }
        
        FlutterLogger.shared.logMessage(
            message(),
            level: level,
            category: category,
            osLog: osLog)
    }
    
    /// Logs a message at [LogLevel.verbost].
    public func verbose(_ message: @autoclosure () -> String) {
        logMessage(message(), level: .verbose)
    }
    
    /// Logs a message at [LogLevel.debug].
    public func debug(_ message: @autoclosure () -> String) {
        logMessage(message(), level: .debug)
    }
    
    /// Logs a message at [LogLevel.info].
    public func info(_ message: @autoclosure () -> String) {
        logMessage(message(), level: .info)
    }
    
    /// Logs a message at [LogLevel.warn].
    public func warn(_ message: @autoclosure () -> String) {
        logMessage(message(), level: .warn)
    }
    
    /// Logs a message at [LogLevel.error].
    public func error(_ message: @autoclosure () -> String) {
        logMessage(message(), level: .error)
    }
    
    /// Logs an error at [LogLevel.error].
    public func error(error: Error) {
        logMessage("\(error)", level: .error)
    }
}
