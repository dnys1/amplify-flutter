import software.amazon.smithy.model.Model
import software.amazon.smithy.model.node.Node
import software.amazon.smithy.model.shapes.ModelSerializer
import software.amazon.smithy.model.transform.ModelTransformer
import java.io.File
import java.io.IOException

fun main(args: Array<String>) {
    val outputPath = args[0]
    val converter = ModelConverter()
    write(outputPath, converter.toJson())
}

fun write(path: String, contents: String) {
    val file = File(path)
    if (file.exists() && file.delete()) {
        val created = file.createNewFile()
        if (!created) {
            throw IOException("Could not create file: $path")
        }
    }
    file.writeText(contents)
}

class ModelConverter {
    fun toJson(): String {
        var model = Model.assembler()
            .discoverModels(ModelConverter::class.java.classLoader)
            .addImport("model")
            .assemble()
            .unwrap()

        val transformer = ModelTransformer.create()
        transformer.apply {
            model = changeStringEnumsToEnumShapes(model)
            model = flattenAndRemoveMixins(model)
            model = copyServiceErrorsToOperations(model, model.serviceShapes.single())
        }

        val serializer = ModelSerializer.builder()
            .includePrelude(false)
            .build()

        return Node.prettyPrintJson(serializer.serialize(model))
    }
}

