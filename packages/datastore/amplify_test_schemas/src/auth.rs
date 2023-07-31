pub enum AuthStrategy {
    Owner,
    Group,
    Public,
    Private,
    Custom,
}

pub enum AuthProvider {
    APIKey,
    IAM,
    OIDC,
    UserPools,
    Function,
}

pub enum AuthOperation {
    Create,
    Read,
    Update,
    Delete,

    Get,
    List,
    Sync,
    Listen,
    Search,
}

pub enum AuthRule {
    Owner(OwnerAuthRule),
    Group(GroupAuthRule),
    Public,
    Private,
    Custom,
}

pub struct OwnerAuthRule {
    pub owner_field: String,
    pub identity_claim: String,
    pub operations: Vec<AuthOperation>,
}

impl Default for OwnerAuthRule {
    fn default() -> Self {
        Self {
            owner_field: "owner".to_string(),
            identity_claim: "sub::username".to_string(),
            operations: vec![
                AuthOperation::Create,
                AuthOperation::Read,
                AuthOperation::Update,
                AuthOperation::Delete,
            ],
        }
    }
}

pub struct GroupAuthRule {
    pub groups: Option<Vec<String>>,
    pub groups_field: String,
    pub group_claim: String,
    pub operations: Vec<AuthOperation>,
}

impl Default for GroupAuthRule {
    fn default() -> Self {
        Self {
            groups: None,
            groups_field: "groups".to_string(),
            group_claim: "cognito:groups".to_string(),
            operations: vec![
                AuthOperation::Create,
                AuthOperation::Read,
                AuthOperation::Update,
                AuthOperation::Delete,
            ],
        }
    }
}
