use arbitrary::Arbitrary;

pub struct PrimaryKey {
    pub sort_key_fields: Option<Vec<String>>,
}

pub struct Index {
    pub name: String,
    pub fields: Option<Vec<String>>,
    pub query_field: Option<String>, 
}

pub trait Feature<'a>: Arbitrary<'a> {}
