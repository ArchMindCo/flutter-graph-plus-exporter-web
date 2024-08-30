import 'dart:js_interop';

@JS("Blob")
extension type JSBlob(JSObject _) implements JSAny {
  external JSBlob.data(JSAny blobParts, JSAny options);
}

@JS("navigator")
extension type JSNavigator(JSObject _) implements JSObject {
  external static JSClipboard get clipboard;
}

@JS("Clipboard")
extension type JSClipboard(JSObject _) implements JSObject {
  external JSPromise write(JSArray<JSClipboardItem> data);
}

@JS("ClipboardItem")
extension type JSClipboardItem(JSObject _) implements JSAny {
  external JSClipboardItem.data(JSAny data);
  external JSArray<JSString> get types;
}

// ignore: camel_case_types
typedef navigator = JSNavigator;
