$version: "2"
namespace com.amazonaws.amplify.codegen

union ModelIndex {
    primaryKey: ModelPrimaryKey
    secondaryKey: ModelSecondaryKey
    foreignKey: ModelForeignKey
}

@mixin
structure ModelIndexBase {
    @required
    @documentation(
        """
        The primary field for the index.

        This is the field to which the `@index` or `@primaryKey` directive is
        attached. For foreign keys, this is the field with the relational
        directive.
        """
    )
    primaryField: String

    @documentation(
        """
        The list of field names which, combined with [field], form a composite key or index.

        This is the list of fields specified by the `sortKeyFields` argument
        to the `@index` or `@primaryKey` directive. For foreign keys, this is
        the list of target fields in this model.
        """
    )
    sortKeyFields: StringList = []
}

@documentation(
    """
    An `@primaryKey` model index.
    """
)
structure ModelPrimaryKey with [ModelIndexBase] {}

@documentation(
    """
    An `@index` model index.
    """
)
structure ModelSecondaryKey with [ModelIndexBase] {
    @required
    @documentation(
        """
        The index's name that is defined by the `name` parameter of `@index` 
        directive in the model schema.
        """
    )
    name: String

    @required
    @documentation(
        """
        The index's query field that is defined by the `queryField` parameter of `@index`
        directive in the model schema.
        """
    )
    queryField: String
}

@documentation(
    """
    A foreign key model index, which is a special case of a secondary key.
    """
)
structure ModelForeignKey with [ModelIndexBase] {
    @required
    @documentation(
        """
        The name of the the foreign key to use in the generated code.
        """
    )
    name: String

    @required
    sortKeyFields: StringList
}

list ModelIndexList {
    member: ModelIndex
}
