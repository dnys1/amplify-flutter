$version: "2"
namespace com.amazonaws.amplify.codegen

structure SchemaDefinition {
    typeDefinitions: SchemaTypeDefinitionMap
    modelGraph: ModelGraph
}

@documentation(
    """
    The adjacency list representation of the model graph, indexed by
    model name with the values representing the dependent model types.

    ## Example

    For the Blog, Post, Comment schema:

    ```graphql
    type Blog @model {
        posts: [Post] @hasMany
    }

    type Post @model {
        blog: Blog @belongsTo
        comments: [Comment] @hasMany
    }

    type Comment @model {
        post: Post @belongsTo
    }
    ```

    The model graph would look like:
    
    ```json
    {
        "Blog": ["Post", "Comment"],
        "Post": ["Comment"],
        "Comment": []
    }
    """
)
map ModelGraph {
    key: String
    value: StringSet
}

union SchemaTypeDefinition {
    model: ModelTypeDefinition,
    nonModel: NonModelTypeDefinition,
    enum: EnumTypeDefinition,
}

map SchemaTypeDefinitionMap {
    key: String
    value: SchemaTypeDefinition
}

@documentation(
    """
    A reference to an Amplify schema type.
    
    An Amplify schema type is either a scalar, model, non-model, enum, or a collection of one of these.
    """
)
union SchemaType {
    scalar: ScalarType,
    enum: EnumType,
    model: ModelType,
    nonModel: NonModelType,
    list: ListType
}

@mixin
structure SchemaTypeBase {
    @required
    @documentation("Whether the type is required (non-nullable) in this context.")
    isRequired: Boolean
}

@documentation(
    """
    A primitive GraphQL type used in an AppSync schema.

    Supported scalar types are defined [here](https://docs.aws.amazon.com/appsync/latest/devguide/scalars.html):
    - `ID`
    - `String`
    - `Int`
    - `Float`
    - `Boolean`
    - `AWSDate`
    - `AWSTime`
    - `AWSDateTime`
    - `AWSTimestamp`
    - `AWSEmail`
    - `AWSJSON`
    - `AWSPhone`
    - `AWSURL`
    - `AWSIPAddress`
    """
)
enum AppSyncScalar {
    @documentation(
        """
        A unique identifier for an object. This scalar is serialized like a
        `String` but isn't meant to be human-readable.
        """
    )
    ID

    @documentation(
        """
        A UTF-8 character sequence.
        """
    )
    STRING = "String"
    
    @documentation(
        """
        A signed 32-bit integer, e.g. an integer value between -(2^31) and 2^31-1.
        """
    )
    INT = "Int"

    @documentation(
        """
        An IEEE 754 double-precision floating-point value.
        """
    )
    FLOAT = "Float"
    
    @documentation(
        """
        A boolean value, either `true` or `false`.
        """
    )
    BOOLEAN = "Boolean"

    @documentation(
        """
        An extended [ISO 8601 date](https://en.wikipedia.org/wiki/ISO_8601#Calendar_dates)
        string in the format `YYYY-MM-DD`.

        > **Note**: The `AWSDate`, `AWSTime`, and `AWSDateTime` scalars can
        optionally include a [time zone offset](https://en.wikipedia.org/wiki/ISO_8601#Time_zone_designators).
        For example, the values `1970-01-01Z`, `1970-01-01-07:00`, and
        `1970-01-01+05:30` are all valid for `AWSDate`. The time zone offset must
        be either `Z` (UTC) or an offset in hours and minutes (and, optionally,
        seconds). For example, `±hh:mm:ss`. The seconds field in the time zone
        offset is considered valid even though it's not part of the ISO 8601
        standard.
        """
    )
    AWS_DATE = "AWSDate"

    @documentation(
        """
        An extended [ISO 8601 time](https://en.wikipedia.org/wiki/ISO_8601#Times)
        string in the format `hh:mm:ss.sss`.
        
        > **Note**: The `AWSDate`, `AWSTime`, and `AWSDateTime` scalars can
        optionally include a [time zone offset](https://en.wikipedia.org/wiki/ISO_8601#Time_zone_designators).
        For example, the values `1970-01-01Z`, `1970-01-01-07:00`, and
        `1970-01-01+05:30` are all valid for `AWSDate`. The time zone offset must
        be either `Z` (UTC) or an offset in hours and minutes (and, optionally,
        seconds). For example, `±hh:mm:ss`. The seconds field in the time zone
        offset is considered valid even though it's not part of the ISO 8601
        standard.
        """
    )
    AWS_TIME = "AWSTime"

    @documentation(
        """
        An extended [ISO 8601 date and time](https://en.wikipedia.org/wiki/ISO_8601#Combined_date_and_time_representations)
        string in the format `YYYY-MM-DDThh:mm:ss.sssZ`.
        
        > **Note**: The `AWSDate`, `AWSTime`, and `AWSDateTime` scalars can
        optionally include a [time zone offset](https://en.wikipedia.org/wiki/ISO_8601#Time_zone_designators).
        For example, the values `1970-01-01Z`, `1970-01-01-07:00`, and
        `1970-01-01+05:30` are all valid for `AWSDate`. The time zone offset must
        be either `Z` (UTC) or an offset in hours and minutes (and, optionally,
        seconds). For example, `±hh:mm:ss`. The seconds field in the time zone
        offset is considered valid even though it's not part of the ISO 8601
        standard.
        """
    )
    AWS_DATE_TIME = "AWSDateTime"

    @documentation(
        """
        An integer value representing the number of seconds before or after
        `1970-01-01-T00:00Z`.
        """
    )
    AWS_TIMESTAMP = "AWSTimestamp"

    @documentation(
        """
        An email address in the format local-part@domain-part as defined by
        [RFC 822](https://tools.ietf.org/html/rfc822).
        """
    )
    AWS_EMAIL = "AWSEmail"

    @documentation(
        """
        A JSON string.

        Any valid JSON construct is automatically parsed and loaded in the
        resolver mapping templates as maps, lists, or scalar values rather than
        as the literal input strings. Unquoted strings or otherwise invalid JSON
        result in a GraphQL validation error.
        """
    )
    AWS_JSON = "AWSJSON"

    @documentation(
        """
        A phone number.

        This value is stored as a string. Phone numbers can contain either spaces
        or hyphens to separate digit groups. Phone numbers without a country code
        are assumed to be US/North American numbers adhering to the
        [North American Numbering Plan (NANP)](https://en.wikipedia.org/wiki/North_American_Numbering_Plan).
        """
    )
    AWS_PHONE = "AWSPhone"

    @documentation(
        """
        A URL as defined by [RFC 1738](https://tools.ietf.org/html/rfc1738).

        For example, `https://www.amazon.com/dp/B000NZW3KC/` or `mailto:example@example.com`.
        URLs must contain a schema (`http`, `mailto`) and can't contain two
        forward slashes (`//`) in the path part.
        """
    )
    AWS_URL = "AWSURL"

    @documentation(
        """
        A valid IPv4 or IPv6 address.

        IPv4 addresses are expected in quad-dotted notation (`123.12.34.56`).
        IPv6 addresses are expected in non-bracketed, colon-separated format
        (`1a2b:3c4b::1234:4567`). You can include an optional CIDR suffix
        (`123.45.67.89/16`) to indicate subnet mask.
        """
    )
    AWS_IP_ADDRESS = "AWSIPAddress"
}

@documentation(
    """
    A scalar (primitive) type, e.g. `ID`, `String`, `AWSDateTime`.

    AppSync defines 9 [scalar types](https://docs.aws.amazon.com/appsync/latest/devguide/scalars.html)
    on top of the default 5 GraphQL scalar types (`ID`, `String`, `Int`, `Float`, `Boolean`):

    - `AWSDate`
    - `AWSTime`
    - `AWSDateTime`
    - `AWSTimestamp`
    - `AWSEmail`
    - `AWSJSON`
    - `AWSURL`
    - `AWSPhone`
    - `AWSIPAddress`
    """
)
structure ScalarType with [SchemaTypeBase] {
    @required
    @documentation("The AppSync scalar type, as defined in the schema.")
    scalar: AppSyncScalar
}

@documentation(
    """
    A custom structure with an `@model` directive.

    ```graphql
    # `MyModel` is a model type.
    type MyModel @model {
      id: ID!
    }
    ```
    """
)
structure ModelType with [SchemaTypeBase] {
    @required
    @documentation("The name of the model type, as defined in the schema.")
    model: String
}

@documentation(
    """
    A custom structure without an `@model` directive.

    ```graphql
    # `MyNonModel` is a non-model type.
    type MyNonModel {
      name: String!
    }
    ```
    """
)
structure NonModelType with [SchemaTypeBase] {
    @required
    @documentation("The name of the non-model type, as defined in the schema.")
    nonModel: String
}

@documentation(
    """
    A custom enumeration.

    ```graphql
    # `MyEnum` is an enum type.
    enum MyEnum {
      VALUE1
      VALUE2
    }
    ```
    """
)
structure EnumType with [SchemaTypeBase] {
    @required
    @documentation("The name of the enum type, as defined in the schema.")
    enum: String
}

@documentation(
    """
    A list of another [SchemaType].

    ```graphql
    type MyNonModel {
        name: String!
    }

    # `nonModels` is a list type of `MyNonModel` types
    type MyModel @model {
        id: ID!
        nonModels: [MyNonModel]
    }
    ```
    """
)
structure ListType with [SchemaTypeBase] {
    @required
    @documentation("The type of the list's elements.")
    ofType: SchemaType
}
