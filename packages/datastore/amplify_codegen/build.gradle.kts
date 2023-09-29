plugins {
    kotlin("jvm") version "1.8.0"
    application
}

group = "com.amazonaws.amplify"
version = "1.0-SNAPSHOT"

repositories {
    mavenCentral()
}

kotlin {
   jvmToolchain(17)
}

application {
    mainClass.set("ModelConverterKt")
}

dependencies {
    implementation("software.amazon.smithy:smithy-model:1.34.0")
    implementation("software.amazon.smithy:smithy-aws-traits:1.34.0")
}
