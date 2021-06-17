package com.amazonaws.amplify.amplify_errors_example

import com.amazonaws.amplify.amplify_errors.AmplifyFlutterException
import com.amplifyframework.core.Amplify
import com.amplifyframework.core.AmplifyConfiguration
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import org.json.JSONObject

class MainActivity: FlutterActivity() {
    private companion object {
        const val channel = "amplify_errors_example"
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channel).setMethodCallHandler {
            call, result ->
            try {
                when(call.method) {
                    "configure" -> {
                        configure(call.arguments as String)
                        result.success(null)
                    }
                    else -> result.notImplemented()
                }
            } catch (e: Exception) {
                AmplifyFlutterException(e).postTo(result)
            }
        }
    }

    private fun configure(configuration: String) {
        val config = AmplifyConfiguration.fromJson(JSONObject(configuration))
        Amplify.configure(config, context)
    }
}
