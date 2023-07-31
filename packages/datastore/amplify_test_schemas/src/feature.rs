use apollo_smith::DocumentBuilder;

pub trait FeatureSet<F: Feature> {
    fn describe(&self) -> Vec<F>;
    fn decorate(&self, builder: &mut DocumentBuilder<'_>);
}

pub trait Feature {
    fn name(&self) -> String;
}
