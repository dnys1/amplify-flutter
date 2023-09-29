.PHONY: build
build: .dart_tool/model.json
	dart tool/generate.dart

.dart_tool/model.json: model/*
	./gradlew run --args=".dart_tool/model.json"
