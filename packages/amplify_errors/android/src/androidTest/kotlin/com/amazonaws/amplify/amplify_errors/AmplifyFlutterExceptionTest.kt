package com.amazonaws.amplify.amplify_errors

import androidx.benchmark.junit4.BenchmarkRule
import androidx.benchmark.junit4.measureRepeated
import androidx.test.ext.junit.runners.AndroidJUnit4
import com.amazonaws.AmazonClientException
import com.amplifyframework.AmplifyException
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Rule
import org.junit.Test
import org.junit.runner.RunWith

private class DummyAmplifyException : AmplifyException {
    constructor(
        message: String,
        cause: Throwable,
        recoverySuggestion: String
    ) : super(message, cause, recoverySuggestion)

    constructor(message: String, recoverySuggestion: String) : super(message, recoverySuggestion)
}

private class DummyAmazonClientException(message: String) : AmazonClientException(message)

class AmplifyFlutterExceptionTest {
    private companion object {
        const val dummyMessage = "Dummy message"
        const val dummyRecoverySuggestion = "Dummy recovery suggestion"

        val dummyException = Exception(dummyMessage)
        val dummyAmplifyException = DummyAmplifyException(dummyMessage, dummyRecoverySuggestion)
        val dummyAmazonException = DummyAmazonClientException(dummyMessage)
    }

    @RunWith(AndroidJUnit4::class)
    class PerformanceTest {
        @get:Rule
        val benchmarkRule = BenchmarkRule()

        @Test
        fun test_reflection_performance() = benchmarkRule.measureRepeated {
            for (i in 0..1000) {
                AmplifyFlutterException.errorCode(dummyAmplifyException)
            }
        }
    }

    @Test
    fun test_amplify_exception() {
        val flutterException = AmplifyFlutterException(dummyAmplifyException)
        assertEquals(
            flutterException.code,
            "com.amazonaws.amplify.amplify_errors.DummyAmplifyException"
        )
        assertEquals(flutterException.message, dummyMessage)
        assertEquals(flutterException.recoverySuggestion, dummyRecoverySuggestion)
        assertNull(flutterException.cause)
    }

    @Test
    fun test_non_amplify_exception() {
        val flutterException = AmplifyFlutterException(dummyException)
        assertEquals(flutterException.code, AmplifyFlutterException.unknown)
        assertEquals(flutterException.message, dummyMessage)
        assertNull(flutterException.recoverySuggestion)
        assertEquals(flutterException.cause, dummyException)
    }

    @Test
    fun test_nested_amplify_amplify_exception() {
        val nativeException =
            DummyAmplifyException(dummyMessage, dummyAmplifyException, dummyRecoverySuggestion)
        val flutterException = AmplifyFlutterException(nativeException)
        assertEquals(
            flutterException.code,
            "com.amazonaws.amplify.amplify_errors.DummyAmplifyException_com.amazonaws.amplify.amplify_errors.DummyAmplifyException"
        )
        assertEquals(flutterException.message, dummyMessage)
        assertEquals(flutterException.recoverySuggestion, dummyRecoverySuggestion)
        assertEquals(flutterException.cause, dummyAmplifyException)
    }

    @Test
    fun test_nested_amplify_amazon_exception() {
        val nativeException =
            DummyAmplifyException(dummyMessage, dummyAmazonException, dummyRecoverySuggestion)
        val flutterException = AmplifyFlutterException(nativeException)
        assertEquals(
            flutterException.code,
            "com.amazonaws.amplify.amplify_errors.DummyAmplifyException_com.amazonaws.amplify.amplify_errors.DummyAmazonClientException"
        )
        assertEquals(flutterException.message, dummyMessage)
        assertEquals(flutterException.recoverySuggestion, dummyRecoverySuggestion)
        assertEquals(flutterException.cause, dummyAmazonException)
    }

    @Test
    fun test_nested_amplify_non_amplify_exception() {
        val nativeException =
            DummyAmplifyException(dummyMessage, dummyException, dummyRecoverySuggestion)
        val flutterException = AmplifyFlutterException(nativeException)
        assertEquals(
            flutterException.code,
            "com.amazonaws.amplify.amplify_errors.DummyAmplifyException"
        )
        assertEquals(flutterException.message, dummyMessage)
        assertEquals(flutterException.recoverySuggestion, dummyRecoverySuggestion)
        assertEquals(flutterException.cause, dummyException)
    }

    @Test
    fun test_nested_non_amplify_non_amplify_exception() {
        val nestedException = Exception(dummyMessage, dummyException)
        val flutterException = AmplifyFlutterException(nestedException)
        assertEquals(flutterException.code, AmplifyFlutterException.unknown)
        assertEquals(flutterException.message, dummyMessage)
        assertNull(flutterException.recoverySuggestion)
        assertEquals(flutterException.cause, nestedException)
    }
}