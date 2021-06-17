//
//  AmplifyFlutterError.swift
//  amplify_errors_flutter
//
//  Created by Nys, Dillon on 6/16/21.
//

import Amplify
import Flutter

extension Mirror {
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
    
    public init(_ error: Error) {
        if !(error is AmplifyError) {
            self.code = AmplifyFlutterError.unknown
            self.message = error.localizedDescription
            self.recoverySuggestion = nil
            self.underlyingError = error
            return
        }
        
        let amplifyError = error as! AmplifyError
        self.code = AmplifyFlutterError.codeFor(error: amplifyError)
        self.message = amplifyError.errorDescription
        self.recoverySuggestion = amplifyError.recoverySuggestion
        self.underlyingError = amplifyError.underlyingError
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
