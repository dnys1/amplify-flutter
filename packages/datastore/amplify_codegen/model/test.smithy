$version: "2"

namespace com.amazonaws.amplify.codegen

@http(code: 200, method: "POST", uri: "/codegen-tests")
operation GenerateTestSchemas {
    input: TestSchemaMatrix
    output: TestSchemas
}

structure TestSchemaMatrix {
    @documentation("The dimensions for which to generate the schema matrix")
    @required
    dimensions: SchemaDimensionList

    @documentation("Optional list of manually-written schema descriptions to include")
    include: SchemaDescriptionList = []
}

structure TestSchemas {
    @required
    generatedSchemas: GeneratedSchemas
}

structure GeneratedSchema {
    @documentation("The dimensional description of the generated schema")
    @required
    description: SchemaDescription

    @documentation("The schema MIPR")
    @required
    mipr: SchemaDefinition
}

list GeneratedSchemas {
    member: GeneratedSchema
}

union SchemaDimension {
    globals: Globals
    type: TypeDescription
}

list SchemaDimensionList {
    member: SchemaDimension
}

structure SchemaDescription {
    @documentation("A unique name for the schema (generated based on dimensions if not provided)")
    @required
    name: String

    globals: Globals

    @required
    types: TypeDescriptionList
}

list SchemaDescriptionList {
    member: SchemaDescription
}

structure TypeDescription {
    @required
    typeDimension: TypeDimension

    fieldDimensions: FieldDimensionList = []
}

list TypeDescriptionList {
    member: TypeDescription
}

structure Globals {
    globalAuthRule: AuthRule
}

union TypeDimension {
    unannotated: Unit
    model: ModelTypeDimension
}

union ModelTypeDimension {
    casing: NameCasing
    auth: ModelAuth
}

union ModelAuth {
    global: Unit
    singleAuth: AuthRule
    multiAuth: AuthRuleList
}

union FieldDimension {
    casing: NameCasing
    auth: FieldAuth
}

list FieldDimensionList {
    member: FieldDimension
}

enum NameCasing {
    SNAKE_CASE = "snake_case"
    SCREAMING_CASE = "SCREAMING_CASE"
    PASCAL_CASE = "PascalCase"
    CAMEL_CASE = "camelCase"
}

union FieldAuth {
    noAuth: Unit
    singleAuth: AuthRule
    multiAuth: AuthRuleList
}
