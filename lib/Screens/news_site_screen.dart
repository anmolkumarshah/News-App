import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class NewsSiteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final url = ModalRoute.of(context).settings.arguments as String;
    return WebviewScaffold(
      url: url,
      appBar: AppBar(
        title: Text("More Information"),
      ),
    );
  }
}
