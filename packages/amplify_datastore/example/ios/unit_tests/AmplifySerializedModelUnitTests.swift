/*
 * Copyright 2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */


import XCTest
import Amplify
@testable import AmplifyPlugins
@testable import amplify_datastore

class AmplifySerializedModelUnitTests: XCTestCase {
    
    override class func setUp() {
        let models = FlutterModels()
        models.addModelSchema(modelName: "Blog", modelSchema: SchemaData.BlogSchema)
        models.addModelSchema(modelName: "Post", modelSchema: SchemaData.PostSchema)
        models.addModelSchema(modelName: "Comment", modelSchema: SchemaData.CommentSchema)
        models.registerModels(registry: ModelRegistry.self)
    }
    
    let serializedModelMaps: [String: Any] = try! readJsonMap(filePath: "serialized_model_maps")

     func test_blog_hasMany_serialization() throws {
        let ourMap = FlutterSerializedModelData.BlogSerializedModel.toMap(modelSchema: SchemaData.BlogSchema);
        let refMap = serializedModelMaps["BlogSerializedMap"] as! [String : Any];
        
        XCTAssertEqual(ourMap["id"] as! String , refMap["id"] as! String);
        XCTAssertEqual(ourMap["modelName"] as! String , refMap["modelName"] as! String);
        
        let ourSd : [String: Any] = ourMap["serializedData"] as! [String: Any];
        let refSd : [String: Any]  = refMap["serializedData"] as! [String: Any];
        
        XCTAssertEqual(ourSd["id"] as! String , refSd["id"] as! String);
        XCTAssertEqual(ourSd["name"] as! String , refSd["name"] as! String);
    }
    
    func test_comment_belongs_serialization() throws {
        let ourMap = FlutterSerializedModelData.CommentSerializedModel.toMap(modelSchema: SchemaData.CommentSchema);
        let refMap = serializedModelMaps["CommentSerializedMap"] as! [String : Any];
        
        XCTAssertEqual(ourMap["id"] as! String , refMap["id"] as! String);
        XCTAssertEqual(ourMap["modelName"] as! String , refMap["modelName"] as! String);
        
        let ourSd : [String: Any] = ourMap["serializedData"] as! [String: Any];
        let refSd : [String: Any]  = refMap["serializedData"] as! [String: Any];

        XCTAssertEqual(ourSd["id"] as! String , refSd["id"] as! String);
        XCTAssertEqual(ourSd["content"] as! String , refSd["content"] as! String);
        
        let ourNs : [String: Any] = ourSd["post"] as! [String: Any];
        let refNs : [String: Any] = refSd["post"] as! [String: Any];
        
        XCTAssertEqual(ourNs["id"] as! String , refNs["id"] as! String);
   }
    
    func test_post_with_datetime_int_hasMany__serialization() throws {
        let ourMap = FlutterSerializedModelData.PostSerializedModel.toMap(modelSchema: SchemaData.PostSchema);
        let refMap = serializedModelMaps["PostSerializedMap"] as! [String : Any];
        
        XCTAssertEqual(ourMap["id"] as! String , refMap["id"] as! String);
        XCTAssertEqual(ourMap["modelName"] as! String , refMap["modelName"] as! String);
        
        let ourSd : [String: Any] = ourMap["serializedData"] as! [String: Any];
        let refSd : [String: Any]  = refMap["serializedData"] as! [String: Any];

        XCTAssertEqual(ourSd["id"] as! String , refSd["id"] as! String);
        XCTAssertEqual(ourSd["title"] as! String , refSd["title"] as! String);
        XCTAssertEqual(ourSd["created"] as! String , refSd["created"] as! String);

        let ourNs : [String: Any] = ourSd["blog"] as! [String: Any];
        let refNs : [String: Any] = refSd["blog"] as! [String: Any];
        
        XCTAssertEqual(ourNs["id"] as! String , refNs["id"] as! String);
   }
    
    
    func test_allTypeModel_serialization() throws {
        let ourMap = FlutterSerializedModelData.AllTypeModelSerializedModel.toMap(modelSchema: SchemaData.AllTypeModelSchema);
        let refMap = serializedModelMaps["AllTypeModelSerializedMap"] as! [String : Any];
        
        XCTAssertEqual(ourMap["id"] as! String , refMap["id"] as! String);
        XCTAssertEqual(ourMap["modelName"] as! String , refMap["modelName"] as! String);
        
        let ourSd : [String: Any] = ourMap["serializedData"] as! [String: Any];
        let refSd : [String: Any]  = refMap["serializedData"] as! [String: Any];
        
        XCTAssertEqual(ourSd["id"] as! String , refSd["id"] as! String);
        XCTAssertEqual(ourSd["stringType"] as! String , refSd["stringType"] as! String);
        XCTAssertEqual(ourSd["intType"] as! NSNumber , refSd["intType"] as! NSNumber);
        XCTAssertEqual(ourSd["floatType"] as! NSNumber , refSd["floatType"]  as! NSNumber);
        XCTAssertEqual(ourSd["boolType"] as! Bool , refSd["boolType"]  as! Bool);
        XCTAssertEqual(ourSd["dateType"] as! String , refSd["dateType"] as! String);
        XCTAssertEqual(ourSd["dateTimeType"] as! String , refSd["dateTimeType"] as! String);
        XCTAssertEqual(ourSd["timeType"] as! String , refSd["timeType"] as! String);
        XCTAssertEqual(ourSd["enumType"] as! String , refSd["enumType"] as! String);
    }
    
    /// Tests that models initialized via a [Decoder], and not via [ModelRegistry], must include `__typename`.
    func test_model_deserialization_fails_without_typename() throws {
        let encodedBlog = """
        {
            "id": "abc",
            "name": "My Blog"
        }
        """.data(using: .utf8)!
        XCTAssertThrowsError(try JSONDecoder().decode(FlutterSerializedModel.self, from: encodedBlog))
    }
    
    /// Tests that models initialized via a [Decoder], and not via [ModelRegistry], must include `__typename`.
    func test_model_deserialization_succeeds_with_typename() throws {
        let encodedBlog = """
        {
            "__typename": "Blog",
            "id": "abc",
            "name": "My Blog"
        }
        """.data(using: .utf8)!
        XCTAssertNoThrow(try JSONDecoder().decode(FlutterSerializedModel.self, from: encodedBlog))
    }
    
    /// Tests that models initialized via [ModelRegistry] can be deserialized from an object.
    func test_model_registry_deserialization_succeeds_as_object() throws {
        let modelName = "Blog"
        let jsonWithTypename = """
        {
            "__typename": "Blog",
            "id": "abc",
            "name": "My Blog"
        }
        """
        let modelWithTypename: Model = try ModelRegistry.decode(modelName: modelName, from: jsonWithTypename)
        XCTAssertEqual(modelWithTypename.modelName, modelName)
        
        let jsonWithoutTypename = """
        {
            "id": "abc",
            "name": "My Blog"
        }
        """
        let modelWithoutTypename: Model = try ModelRegistry.decode(modelName: modelName, from: jsonWithoutTypename)
        XCTAssertEqual(modelWithoutTypename.modelName, modelName)
    }
    
    /// Tests that models initialized via [ModelRegistry] can be deserialized from an array.
    func test_model_registry_deserialization_succeeds_as_array() throws {
        let modelName = "Blog"
        let jsonWithTypename = """
        [
            {
                "__typename": "Blog",
                "id": "abc",
                "name": "My Blog"
            }
        ]
        """
        let modelWithTypename: Model = try ModelRegistry.decode(modelName: modelName, from: jsonWithTypename)
        XCTAssertEqual(modelWithTypename.modelName, modelName)
        
        let jsonWithoutTypename = """
        [
            {
                "id": "abc",
                "name": "My Blog"
            }
        ]
        """
        let modelWithoutTypename: Model = try ModelRegistry.decode(modelName: modelName, from: jsonWithoutTypename)
        XCTAssertEqual(modelWithoutTypename.modelName, modelName)
    }
    
    /// Verifies that all schema fields are included during SQLite encoding. In the case of `__typename`, this also
    /// verifies its persistence even if not present in [FlutterSerializedModel.values].
    func test_model_serialization_includes_all_schema_fields() throws {
        let blog = FlutterSerializedModelData.BlogSerializedModel
        let modelSchema = SchemaData.BlogSchema
        let jsonFields = modelSchema.jsonFields(for: blog)
        
        guard let typeName = jsonFields["__typename"] as? String,
              let id = jsonFields["id"] as? String,
              let name = jsonFields["name"] as? String else {
            XCTFail("Null values found in persisted dict: \(jsonFields)")
            return
        }
        
        let blogName = blog.values["name"]!.value as! String
        
        XCTAssertEqual(typeName, blog.modelName)
        XCTAssertEqual(id, blog.id)
        XCTAssertEqual(name, blogName)
    }
}

extension JSONValue {
    var value: Any? {
        switch self {
        case .array(let array):
            return array
        case .boolean(let boolean):
            return boolean
        case .number(let number):
            return number
        case .object(let object):
            return object
        case .string(let string):
            return string
        case .null:
            return nil
        }
    }
}

extension ModelSchema {
    /// Replicates logic in Model+SQLite.swift which is used to populate values in INSERT/UPDATE statements.
    ///
    /// Basically, this tests [FlutterSerializedModel.jsonValue]. If nested models are added later, the logic can be further
    /// aligned with Model+SQLite.swift to test for proper serialization of those models.
    func jsonFields(for model: FlutterSerializedModel) -> [String: Any?] {
        fields.mapValues { field -> Any? in
            guard let optionalJsonValue = model.jsonValue(for: field.name, modelSchema: self),
                  let jsonValue = optionalJsonValue else {
                return nil
            }
            
            let value: Any
            if case Optional<Any>.some(let unwrappedValue) = jsonValue {
                value = unwrappedValue
            } else {
                return nil
            }
            
            return value
        }
    }
}
