// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names,require_trailing_commas

/// A REST JSON service that sends JSON requests and responses.
library rest_json1_v1.rest_json_protocol;

export 'package:rest_json1_v1/src/rest_json_protocol/model/all_query_string_types_input.dart'
    hide AllQueryStringTypesInputPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/aws_config.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/client_config.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/complex_error.dart'
    hide ComplexErrorPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/complex_nested_error_data.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/constant_and_variable_query_string_input.dart'
    hide ConstantAndVariableQueryStringInputPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/constant_query_string_input.dart'
    hide ConstantQueryStringInputPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/datetime_offsets_output.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/document_type_as_payload_input_output.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/document_type_input_output.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/empty_input_and_empty_output_input.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/empty_input_and_empty_output_output.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/enum_payload_input.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/environment_config.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/file_config_settings.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/foo_enum.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/foo_error.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/fractional_seconds_output.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/greeting_struct.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/greeting_with_errors_output.dart'
    hide GreetingWithErrorsOutputPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/host_label_input.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/http_checksum_required_input_output.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/http_payload_traits_input_output.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/http_payload_traits_with_media_type_input_output.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/http_payload_with_structure_input_output.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/http_prefix_headers_in_response_input.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/http_prefix_headers_in_response_output.dart'
    hide HttpPrefixHeadersInResponseOutputPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/http_prefix_headers_input.dart'
    hide HttpPrefixHeadersInputPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/http_prefix_headers_output.dart'
    hide HttpPrefixHeadersOutputPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/http_request_with_float_labels_input.dart'
    hide HttpRequestWithFloatLabelsInputPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/http_request_with_greedy_label_in_path_input.dart'
    hide HttpRequestWithGreedyLabelInPathInputPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/http_request_with_labels_and_timestamp_format_input.dart'
    hide HttpRequestWithLabelsAndTimestampFormatInputPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/http_request_with_labels_input.dart'
    hide HttpRequestWithLabelsInputPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/http_request_with_regex_literal_input.dart'
    hide HttpRequestWithRegexLiteralInputPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/http_response_code_output.dart'
    hide HttpResponseCodeOutputPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/ignore_query_params_in_response_output.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/input_and_output_with_headers_io.dart'
    hide InputAndOutputWithHeadersIoPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/invalid_greeting.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/json_blobs_input_output.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/json_enums_input_output.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/json_int_enums_input_output.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/json_lists_input_output.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/json_maps_input_output.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/json_timestamps_input_output.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/malformed_accept_with_generic_string_output.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/malformed_accept_with_payload_output.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/malformed_blob_input.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/malformed_boolean_input.dart'
    hide MalformedBooleanInputPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/malformed_byte_input.dart'
    hide MalformedByteInputPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/malformed_content_type_with_generic_string_input.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/malformed_content_type_with_payload_input.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/malformed_content_type_without_body_empty_input_input.dart'
    hide MalformedContentTypeWithoutBodyEmptyInputInputPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/malformed_double_input.dart'
    hide MalformedDoubleInputPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/malformed_float_input.dart'
    hide MalformedFloatInputPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/malformed_integer_input.dart'
    hide MalformedIntegerInputPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/malformed_list_input.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/malformed_long_input.dart'
    hide MalformedLongInputPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/malformed_map_input.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/malformed_request_body_input.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/malformed_short_input.dart'
    hide MalformedShortInputPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/malformed_string_input.dart'
    hide MalformedStringInputPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/malformed_timestamp_body_date_time_input.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/malformed_timestamp_body_default_input.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/malformed_timestamp_body_http_date_input.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/malformed_timestamp_header_date_time_input.dart'
    hide MalformedTimestampHeaderDateTimeInputPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/malformed_timestamp_header_default_input.dart'
    hide MalformedTimestampHeaderDefaultInputPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/malformed_timestamp_header_epoch_input.dart'
    hide MalformedTimestampHeaderEpochInputPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/malformed_timestamp_path_default_input.dart'
    hide MalformedTimestampPathDefaultInputPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/malformed_timestamp_path_epoch_input.dart'
    hide MalformedTimestampPathEpochInputPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/malformed_timestamp_path_http_date_input.dart'
    hide MalformedTimestampPathHttpDateInputPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/malformed_timestamp_query_default_input.dart'
    hide MalformedTimestampQueryDefaultInputPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/malformed_timestamp_query_epoch_input.dart'
    hide MalformedTimestampQueryEpochInputPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/malformed_timestamp_query_http_date_input.dart'
    hide MalformedTimestampQueryHttpDateInputPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/malformed_union_input.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/media_type_header_input.dart'
    hide MediaTypeHeaderInputPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/media_type_header_output.dart'
    hide MediaTypeHeaderOutputPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/my_union.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/nested_payload.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/no_input_and_output_output.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/null_and_empty_headers_io.dart'
    hide NullAndEmptyHeadersIoPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/omits_null_serializes_empty_string_input.dart'
    hide OmitsNullSerializesEmptyStringInputPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/omits_serializing_empty_lists_input.dart'
    hide OmitsSerializingEmptyListsInputPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/operation_config.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/payload_config.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/player_action.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/post_player_action_input.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/post_player_action_output.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/post_union_with_json_name_input.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/post_union_with_json_name_output.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/put_with_content_encoding_input.dart'
    hide PutWithContentEncodingInputPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/query_idempotency_token_auto_fill_input.dart'
    hide QueryIdempotencyTokenAutoFillInputPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/query_params_as_string_list_map_input.dart'
    hide QueryParamsAsStringListMapInputPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/query_precedence_input.dart'
    hide QueryPrecedenceInputPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/recursive_shapes_input_output.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/recursive_shapes_input_output_nested1.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/recursive_shapes_input_output_nested2.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/renamed_greeting.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/response_code_http_fallback_input_output.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/response_code_required_output.dart'
    hide ResponseCodeRequiredOutputPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/retry_config.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/retry_mode.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/s3_addressing_style.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/s3_config.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/scoped_config.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/simple_scalar_properties_input_output.dart'
    hide SimpleScalarPropertiesInputOutputPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/simple_union.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/streaming_traits_input_output.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/streaming_traits_require_length_input.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/streaming_traits_with_media_type_input_output.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/string_enum.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/string_payload_input.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/structure_list_member.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/test_body_structure_input_output.dart'
    hide TestBodyStructureInputOutputPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/test_config.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/test_no_payload_input_output.dart'
    hide TestNoPayloadInputOutputPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/test_payload_blob_input_output.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/test_payload_structure_input_output.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/timestamp_format_headers_io.dart'
    hide TimestampFormatHeadersIoPayload;
export 'package:rest_json1_v1/src/rest_json_protocol/model/union_input_output.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/model/union_with_json_name.dart';
export 'package:rest_json1_v1/src/rest_json_protocol/rest_json_protocol_client.dart';
