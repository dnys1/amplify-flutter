$version: "2"
namespace com.amazonaws.amplify.codegen

list AuthRuleList {
    member: AuthRule
}

structure AuthRule {
    @required
    authStrategy: AuthStrategy

    ownerField: String
    identityClaim: String
    groupClaim: String
    groups: StringList
    groupsField: String
    provider: AuthProvider
    operations: AuthModelOperationList
}

enum AuthStrategy {
    OWNER = "owner"
    GROUPS = "groups"
    PRIVATE = "private"
    PUBLIC = "public"
    CUSTOM = "custom"
}

enum AuthProvider {
    API_KEY = "apiKey"
    AWS_IAM = "iam"
    OPENID_CONNECT = "oidc"
    AMAZON_COGNITO_USER_POOLS = "userPools"
    FUNCTION = "function"
}

list AuthModelOperationList {
    member: AuthModelOperation
}

enum AuthModelOperation {
    CREATE = "create"
    UPDATE = "update"
    DELETE = "delete"
    READ = "read"

    GET = "get"
    LIST = "list"
    SYNC = "sync"
    LISTEN = "listen"
    SEARCH = "search"
}
