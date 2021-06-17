//
//  amplify_errors_tests.swift
//  amplify_errors_tests
//
//  Created by Nys, Dillon on 6/16/21.
//

import XCTest

import Amplify
import amplify_errors

enum DummyAmplifyError {
    case caseA(ErrorDescription, RecoverySuggestion, Error? = nil)
    case caseB(ErrorDescription, RecoverySuggestion, Error? = nil)
    case unknown(ErrorDescription, RecoverySuggestion, Error? = nil)
}

extension DummyAmplifyError: AmplifyError {
    var errorDescription: ErrorDescription {
        switch self {
        case .caseA(let errorDescription, _, _),
             .caseB(let errorDescription, _, _),
             .unknown(let errorDescription, _, _):
            return errorDescription
        }
    }
    
    var recoverySuggestion: RecoverySuggestion {
        switch self {
        case .caseA(_, let recoverySuggestion, _),
             .caseB(_, let recoverySuggestion, _),
             .unknown(_, let recoverySuggestion, _):
            return recoverySuggestion
        }
    }
    
    var underlyingError: Error? {
        switch self {
        case .caseA(_, _, let underlyingError),
             .caseB(_, _, let underlyingError),
             .unknown(_, _, let underlyingError):
            return underlyingError
        }
    }
    
    init(
        errorDescription: ErrorDescription = "An unknown error occurred",
        recoverySuggestion: RecoverySuggestion = "See `underlyingError` for more details",
        error: Error
    ) {
        if let error = error as? Self {
            self = error
        } else {
            self = .unknown(errorDescription, recoverySuggestion, error)
        }
    }
}

struct DummyError: LocalizedError, Equatable {
    let message: String
    
    var errorDescription: String? { message }
}

class TestAmplifyFlutterError: XCTestCase {
    private let dummyMessage = "Dummy message"
    private let nestedMessage = "Nested message"
    private let dummyRecoverySuggestion = "Dummy recovery suggestion"
    private let nestedRecoverySuggestion = "Nested recovery suggestion"
    private var dummyError: DummyError { DummyError(message: dummyMessage) }
    private var dummyAmplifyError: DummyAmplifyError {
        DummyAmplifyError.caseA(dummyMessage, dummyRecoverySuggestion, nil)
    }
    
    func testAmplifyError() {
        let flutterError = AmplifyFlutterError(dummyAmplifyError)
        XCTAssertEqual(flutterError.code, "DummyAmplifyError.caseA")
        XCTAssertEqual(flutterError.message, dummyMessage)
        XCTAssertEqual(flutterError.recoverySuggestion, dummyRecoverySuggestion)
        XCTAssertNil(flutterError.underlyingError)
    }
    
    func testSelfAmplifyError() {
        let amplifyError = DummyAmplifyError(error: dummyAmplifyError)
        let flutterError = AmplifyFlutterError(amplifyError)
        XCTAssertEqual(flutterError.code, "DummyAmplifyError.caseA")
        XCTAssertEqual(flutterError.message, dummyMessage)
        XCTAssertEqual(flutterError.recoverySuggestion, dummyRecoverySuggestion)
        XCTAssertNil(flutterError.underlyingError)
    }
    
    func testNonAmplifyError() {
        let flutterError = AmplifyFlutterError(dummyError)
        XCTAssertEqual(flutterError.code, AmplifyFlutterError.unknown)
        XCTAssertEqual(flutterError.message, dummyMessage)
        XCTAssertNil(flutterError.recoverySuggestion)
        XCTAssertNotNil(flutterError.underlyingError)
    }
    
    func testNestedAmplifyAmplifyError() {
        let nestedError = DummyAmplifyError.caseB(nestedMessage, nestedRecoverySuggestion, dummyAmplifyError)
        let flutterError = AmplifyFlutterError(nestedError)
        XCTAssertEqual(flutterError.code, "DummyAmplifyError.caseB_DummyAmplifyError.caseA")
        XCTAssertEqual(flutterError.message, nestedMessage)
        XCTAssertEqual(flutterError.recoverySuggestion, nestedRecoverySuggestion)
        XCTAssertNotNil(flutterError.underlyingError)
        XCTAssertTrue(flutterError.underlyingError is DummyAmplifyError)
    }
    
    func testNestedAmplifyNonAmplifyError() {
        let nestedError = DummyAmplifyError.caseB(nestedMessage, nestedRecoverySuggestion, dummyError)
        let flutterError = AmplifyFlutterError(nestedError)
        XCTAssertEqual(flutterError.code, "DummyAmplifyError.caseB")
        XCTAssertEqual(flutterError.message, nestedMessage)
        XCTAssertEqual(flutterError.recoverySuggestion, nestedRecoverySuggestion)
        XCTAssertNotNil(flutterError.underlyingError)
    }

    func testMirrorPerformance() throws {
        let nestedError = DummyAmplifyError.caseB(nestedMessage, nestedRecoverySuggestion, dummyAmplifyError)
        measure {
            for _ in 0..<1000 {
                _ = AmplifyFlutterError.codeFor(error: nestedError)
            }
        }
    }
}
