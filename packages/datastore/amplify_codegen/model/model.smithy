$version: "2"
namespace com.amazonaws.amplify.codegen

structure ModelTypeDefinition {
    @required
    name: String

    @required
    pluralName: String

    @required
    fields: ModelFieldMap

    @required
    indexes: ModelIndexList

    authRules: AuthRuleList = []
}

list ModelFieldList {
    member: ModelField
}

map ModelFieldMap {
    key: String
    value: ModelField
}

structure ModelField {
    @required
    name: String

    @required
    type: SchemaType

    isReadOnly: Boolean = false
    
    association: ModelAssociation

    authRules: AuthRuleList = []
}

union ModelAssociation {
    belongsTo: ModelAssociationBelongsTo
    hasMany: ModelAssociationHasMany
    hasOne: ModelAssociationHasOne
}

@mixin
structure ModelAssociationBase {
    @required
    @documentation("The name of the associated model.")
    connectedModel: String
}

structure ModelAssociationBelongsTo with [ModelAssociationBase] {
    @required
    @deprecated(message: "Use targetNames instead.")
    targetName: String

    @required
    targetNames: StringList
}

structure ModelAssociationHasMany with [ModelAssociationBase] {
    @required
    @deprecated(message: "Use associatedWithFields instead.")
    associatedWith: ModelField

    @required
    associatedWithFields: ModelFieldList
}

structure ModelAssociationHasOne with [ModelAssociationBase] {
    @required
    @deprecated(message: "Use targetNames instead.")
    targetName: String

    @required
    targetNames: StringList

    @required
    @deprecated(message: "Use associatedWithFields instead.")
    associatedWith: ModelField

    @required
    associatedWithFields: ModelFieldList
}
