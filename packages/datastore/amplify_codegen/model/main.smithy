$version: "2"
namespace com.amazonaws.amplify.codegen

use aws.protocols#restJson1

@restJson1
service CodegenPluginService {
  version: "1.0"
  operations: [Codegen]
}

@http(code: 200, method: "POST", uri: "/codegen")
operation Codegen {
    input: CodegenRequest
    errors: [CodegenError]
}

@httpError(500)
@error("server")
structure CodegenError {
    message: String
}

structure CodegenRequest {
    @required
    @documentation("The path to the project root")
    projectRoot: String

    @required
    @documentation("All type definitions in the schema.")
    schemaDefinition: SchemaDefinition
}
