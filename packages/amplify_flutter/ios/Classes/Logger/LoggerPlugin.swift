//
//  LoggerPlugin.swift
//  amplify_flutter
//
//  Created by Nys, Dillon on 7/8/21.
//

import Foundation
import Amplify

class AmplifyFlutterLoggingPlugin: LoggingCategoryPlugin {
    static private var categoryLoggers: [CategoryType: CategoryLogger] = [:]
    
    let key: PluginKey = "AmplifyFlutterLoggingPlugin"
    
    func configure(using configuration: Any?) throws {
        // No-op
    }
    
    lazy var `default`: Logger = {
        CategoryLogger(category: nil)
    }()
    
    private func parseCategoryString(_ categoryString: String) -> CategoryType? {
        return CategoryType.allCases.first {
            $0.displayName.lowercased() == categoryString.lowercased()
        }
    }
    
    func logger(forCategory category: String, logLevel: LogLevel) -> Logger {
        guard let categoryType = parseCategoryString(category) else {
            return `default`
        }
        return CategoryLogger(category: categoryType, logLevel: logLevel)
    }
    
    func logger(forCategory category: String) -> Logger {
        guard let categoryType = parseCategoryString(category) else {
            return `default`
        }
        var categoryLogger = AmplifyFlutterLoggingPlugin.categoryLoggers[categoryType]
        if categoryLogger == nil {
            categoryLogger = CategoryLogger(category: categoryType)
            AmplifyFlutterLoggingPlugin.categoryLoggers[categoryType] = categoryLogger
        }
        return categoryLogger!
    }
    
    func reset(onComplete: @escaping BasicClosure) {
        onComplete()
    }
}
