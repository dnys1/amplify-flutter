package com.amazonaws.amplify.amplify_errors_flutter

import com.amazonaws.AmazonClientException
import com.amplifyframework.AmplifyException
import io.flutter.plugin.common.MethodChannel

class AmplifyFlutterException(e: Exception): Exception(
    e.message,
    if (e is AmplifyException) e.cause else e
) {
    companion object {
        const val unknown = "unknown"

        fun errorCode(e: AmplifyException): String {
            var code = e::class.java.name
            var cause = e.cause
            while (cause is AmplifyException || cause is AmazonClientException) {
                code += "_${cause::class.java.name}"
                cause = cause.cause
            }
            return code
        }
    }

    val code: String
    val recoverySuggestion: String?

    init {
        if (e is AmplifyException) {
            code = errorCode(e)
            recoverySuggestion = e.recoverySuggestion
        } else {
            code = unknown
            recoverySuggestion = null
        }
    }

    fun postTo(result: MethodChannel.Result) {
        result.error(code, message, mapOf(
            "message" to message,
            "recoverySuggestion" to recoverySuggestion,
            "underlyingException" to cause?.message
        ))
    }
}