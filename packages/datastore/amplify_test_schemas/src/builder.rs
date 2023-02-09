use apollo_smith::{EnumTypeDef, ObjectTypeDef};
use arbitrary::{Result, Unstructured};
use std::fmt::Debug;

pub struct DocumentBuilder<'a> {
    pub u: &'a mut Unstructured<'a>,
    builder: apollo_smith::DocumentBuilder<'a>,
    pub model_type_defs: Vec<ObjectTypeDef>,
    pub non_model_type_defs: Vec<ObjectTypeDef>,
    pub enum_type_defs: Vec<EnumTypeDef>,
}

impl<'a> Debug for DocumentBuilder<'a> {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        f.debug_struct("DocumentBuilder")
            .field("model_type_defs", &self.model_type_defs)
            .field("non_model_type_defs", &self.non_model_type_defs)
            .field("enum_type_defs", &self.enum_type_defs)
            .finish()
    }
}

impl<'a> DocumentBuilder<'a> {
    pub fn new(u: &'a mut Unstructured<'a>) -> Result<Self> {
        let mut builder = Self {
            u,
            builder: apollo_smith::DocumentBuilder::new(u),
            model_type_defs: Vec::new(),
            non_model_type_defs: Vec::new(),
            enum_type_defs: Vec::new(),
        };

        Ok(builder)
    }
}
