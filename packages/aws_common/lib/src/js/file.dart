import 'dart:js_interop';

import 'package:aws_common/src/js/common.dart';
import 'package:aws_common/src/js/readable_stream.dart';

/// {@template aws_common.js.blob}
/// Represents a blob, which is a file-like object of immutable, raw data;
/// they can be read as text or binary data, or converted into a [ReadableStream]
/// so its methods can be used for processing the data.
/// {@endtemplate}
@JS()
@staticInterop
class Blob implements JSObject {
  /// {@macro aws_common.js.blob}
  external factory Blob([
    JSArray blobParts,
    BlobOptions options,
  ]);
}

/// {@macro aws_common.js.blob}
extension BlobProps on Blob {
  /// Returns a new [Blob] object containing the data in the specified range of
  /// bytes of the blob on which it's called.
  external Blob slice([
    JSNumber start,
    JSNumber end,
    JSString contentType,
  ]);

  /// Returns a [ReadableStream] that can be used to read the contents of the [Blob].
  external ReadableStream stream();

  /// Returns a promise that resolves with a string containing the entire contents
  /// of the [Blob] interpreted as UTF-8 text.
  external JSPromise text();

  /// Returns a promise that resolves with an [JSArrayBuffer] containing the entire
  /// contents of the [Blob] as binary data.
  external JSPromise arrayBuffer();

  /// The size, in bytes, of the data contained in the [Blob] object.
  external JSNumber get size;

  /// A string indicating the MIME type of the data contained in the [Blob]. If the type is
  /// unknown, this string is empty.
  external JSString get type;
}

/// {@template aws_common.js.blob_options}
/// Options to instantiate a [Blob].
/// {@endtemplate}
@JS()
@staticInterop
@anonymous
class BlobOptions {
  /// {@macro aws_common.js.blob_options}
  external factory BlobOptions({
    JSString? type,
  });
}

/// {@template aws_common.js.file}
/// The File interface provides information about files and allows JavaScript in a web
/// page to access their content.
/// {@endtemplate}
@JS()
@staticInterop
class File implements Blob {
  /// {@macro aws_common.js.file}
  external factory File(
    JSArray fileBits,
    JSString fileName, [
    FileOptions options,
  ]);
}

/// {@macro aws_common.js.file}
extension FileProps on File {
  /// Returns the name of the file referenced by the [File] object.
  external JSString get name;

  /// Returns the last modified time of the file, in millisecond since the UNIX epoch
  /// (January 1st, 1970 at Midnight).
  external JSNumber get lastModified;

  /// Returns the path the URL of the [File] is relative to.
  external JSString get webkitRelativePath;
}

/// {@template aws_common.js.file_options}
/// Options to instantiate a [File].
/// {@endtemplate}
@JS()
@staticInterop
@anonymous
class FileOptions implements BlobOptions {
  /// {@macro aws_common.js.file_options}
  external factory FileOptions({
    JSString? type,
    JSNumber? lastModified,
  });
}

@JS()
@staticInterop
class FileReader implements EventTarget {
  external factory FileReader();

  external static JSNumber get EMPTY;
  external static JSNumber get LOADING;
  external static JSNumber get DONE;
}

extension FileReaderExtension on FileReader {
  external JSVoid readAsArrayBuffer(Blob blob);
  external JSVoid readAsBinaryString(Blob blob);
  external JSVoid readAsText(
    Blob blob, [
    JSString encoding,
  ]);
  external JSVoid readAsDataURL(Blob blob);
  external JSVoid abort();
  external JSNumber get readyState;
  external JSAny? get result;
  external set onloadstart(JSFunction value);
  external JSFunction get onloadstart;
  external set onprogress(JSFunction value);
  external JSFunction get onprogress;
  external set onload(JSFunction value);
  external JSFunction get onload;
  external set onabort(JSFunction value);
  external JSFunction get onabort;
  external set onerror(JSFunction value);
  external JSFunction get onerror;
  external set onloadend(JSFunction value);
  external JSFunction get onloadend;
}
