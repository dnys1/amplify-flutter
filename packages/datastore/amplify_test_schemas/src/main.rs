use std::error::Error;

use apollo_smith::DocumentBuilder;
use arbitrary::Unstructured;

mod amplify;
mod builder;

fn main() -> Result<(), Box<dyn Error>> {
    let data = &[1, 2, 3, 4, 5];
    let mut u = Unstructured::new(data);
    let doc = DocumentBuilder::new(&mut u)?;
    let doc: String = doc.finish().into();

    println!("{doc}");
    Ok(())
}
