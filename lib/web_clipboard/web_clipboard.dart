import 'dart:js_interop';

import 'package:flutter/foundation.dart';

import '../js/js_types.dart';

abstract class WebClipboard {
  static Future setData(Uint8List bytes, String mediaType) async =>
      await _setJSData(bytes.toJS, mediaType);

  static Future _setJSData(JSUint8Array bytes, String mediaType) async {
    final blobData = [bytes].toJS;
    final blobOptions = {"type": mediaType}.jsify();
    if (blobOptions != null) {
      final blob = JSBlob.data(blobData, blobOptions);
      final clipboardItemData = {mediaType: blob}.jsify();
      if (clipboardItemData != null) {
        final clipboardItem = JSClipboardItem.data(clipboardItemData);
        final clipboardItems = [clipboardItem].toJS;
        final promise = navigator.clipboard.write(clipboardItems);
        return promise.toDart;
      }
    }
  }
}
