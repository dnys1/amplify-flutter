package com.amazonaws.amplify.amplify_errors

import com.amazonaws.AmazonClientException
import com.amplifyframework.AmplifyException
import io.flutter.plugin.common.MethodChannel

class AmplifyFlutterException : Exception {
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

    constructor(e: Exception) : super(
        e.message,
        if (e is AmplifyException || e is AmplifyFlutterException) e.cause else e
    ) {
        when (e) {
            is AmplifyFlutterException -> {
                code = e.code
                recoverySuggestion = e.recoverySuggestion
            }
            is AmplifyException -> {
                code = errorCode(e)
                recoverySuggestion = e.recoverySuggestion
            }
            else -> {
                code = unknown
                recoverySuggestion = null
            }
        }
    }

    constructor(
        code: String,
        message: String,
        recoverySuggestion: String?,
        cause: Throwable? = null
    ) : super(message, cause) {
        this.code = code
        this.recoverySuggestion = recoverySuggestion
    }

    fun postTo(result: MethodChannel.Result) {
        result.error(
            code, message, mapOf(
                "message" to message,
                "recoverySuggestion" to recoverySuggestion,
                "underlyingException" to cause?.message
            )
        )
    }
}