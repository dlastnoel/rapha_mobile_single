import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../api/api_endpoints.dart';

class NumberRegistrationScreen extends StatefulWidget {
  const NumberRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<NumberRegistrationScreen> createState() =>
      _NumberRegistrationScreenState();
}

class _NumberRegistrationScreenState extends State<NumberRegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Registration'),
      ),
      body: WebView(
        initialUrl:
            'http://developer.globelabs.com.ph/dialog/oauth/aoxpSMBBaetq5cddAbTBnLtKGo87S7nB',
        onPageFinished: (String url) {
          if (url.startsWith(ApiEndpoints.saveContactUrl)) {
            Navigator.pop(context, true);
          }
        },
      ),
    );
  }
}
