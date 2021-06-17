//
//  AmplifyFlutterError.swift
//  amplify_errors
//
//  Created by Nys, Dillon on 6/16/21.
//

import Amplify
import Flutter

extension Mirror {
    /// Retrieve's an enum's `case` name.
    var enumCase: String? {
        guard displayStyle == .enum else { return nil }
        return children.first?.label
    }
}

public struct AmplifyFlutterError: Error {
    public static let unknown = "unknown"
    
    public static func codeFor(error: AmplifyError) -> String {
        let mirror = Mirror(reflecting: error)
        guard mirror.displayStyle == .enum else {
            return unknown
        }
        let enumClass = mirror.subjectType
        guard let enumCase = mirror.enumCase else {
            return unknown
        }
        let type = "\(enumClass).\(enumCase)"
        guard let underlyingError = error.underlyingError else {
            return type
        }
        let underlyingMirror = Mirror(reflecting: underlyingError)
        let underlyingClass = underlyingMirror.subjectType
        guard let underlyingCase = underlyingMirror.enumCase else {
            return type
        }
        return "\(type)_\(underlyingClass).\(underlyingCase)"
    }
    
    public let code: String
    public let message: String
    public let recoverySuggestion: String?
    public let underlyingError: Error?
    
    public init(code: String, message: String, recoverySuggestion: String, underlyingError: Error? = nil) {
        self.code = code
        self.message = message
        self.recoverySuggestion = recoverySuggestion
        self.underlyingError = underlyingError
    }
    
    public init(_ error: Error) {
        switch error {
        case let error as AmplifyFlutterError:
            self = error
        case let error as AmplifyError:
            self.code = AmplifyFlutterError.codeFor(error: error)
            self.message = error.errorDescription
            self.recoverySuggestion = error.recoverySuggestion
            self.underlyingError = error.underlyingError
        default:
            self.code = AmplifyFlutterError.unknown
            self.message = error.localizedDescription
            self.recoverySuggestion = nil
            self.underlyingError = error
        }
    }
    
    public func post(to result: FlutterResult) {
        let flutterError = FlutterError(code: code, message: message, details: [
            "message": message,
            "recoverySuggestion": recoverySuggestion,
            "underlyingError": underlyingError?.localizedDescription
        ])
        result(flutterError)
    }
}
