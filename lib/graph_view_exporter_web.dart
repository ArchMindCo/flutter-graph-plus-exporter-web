import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:graph_plus_exporter_web/web_clipboard/web_clipboard.dart';

class GraphViewExporterPlugin {
  static void registerWith(Registrar registrar) {
    final channel = MethodChannel("archmind.io/graph_view_exporter",
        const StandardMethodCodec(), registrar);

    channel.setMethodCallHandler(GraphViewExporterPlugin().handleMethodCall);
  }

  Future<dynamic> handleMethodCall(MethodCall call) async =>
      switch (call.method) {
        "exportContentToClipboard" => exportContentToClipboard(
            call.arguments["bytes"],
            call.arguments["mediaType"],
          ),
        _ => throw PlatformException(
            code: "Unimplemented",
            details:
                "The method '${call.method}' is not implemented in this graph_view_exporter (web) plugin.")
      };

  Future exportContentToClipboard(Uint8List bytes, String mediaType) async {
    await WebClipboard.setData(bytes, mediaType);
  }
}
