import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'dart:convert';

class HtmlCompilerScreen extends StatefulWidget {
  const HtmlCompilerScreen({super.key});

  @override
  _HtmlCompilerScreenState createState() => _HtmlCompilerScreenState();
}

class _HtmlCompilerScreenState extends State<HtmlCompilerScreen> {
  final TextEditingController _htmlController = TextEditingController();
  InAppWebViewController? webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HTML Compiler"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (webViewController != null) {
            String htmlData = _htmlController.text;
            webViewController!.loadData(
              data: '''<html><body>${htmlData}</body></html>''',
              mimeType: 'text/html',
              encoding: 'utf-8',
            );
          }
        },
        child: const Icon(Icons.play_arrow),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _htmlController,
              maxLines: 10,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                hintText: 'Enter HTML Code',
              ),
            ),
          ),
          Expanded(
            child: InAppWebView(
              initialUrlRequest: URLRequest(
                url: WebUri.uri(
                  Uri.dataFromString(
                    "<html><body></body></html>",
                    mimeType: 'text/html',
                    encoding: Encoding.getByName('utf-8'),
                  ),
                ),
              ),
              onWebViewCreated: (controller) {
                webViewController = controller;
              },
            ),
          ),
        ],
      ),
    );
  }
}
