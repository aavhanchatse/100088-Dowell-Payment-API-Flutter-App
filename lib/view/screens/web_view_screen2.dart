import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewScreen2 extends StatefulWidget {
  // final MyInAppBrowser browser = MyInAppBrowser();
  final String url;

  const WebViewScreen2({super.key, required this.url});

  @override
  State<WebViewScreen2> createState() => _WebViewScreen2State();
}

class _WebViewScreen2State extends State<WebViewScreen2> {
  // late PlatformWebViewController controller;

  late InAppWebViewController _webViewController;

  @override
  void initState() {
    super.initState();

    // final del = PlatformNavigationDelegate(
    //   const PlatformNavigationDelegateCreationParams(),
    // )..setOnUrlChange((change) {
    //     if (change.url == ('https://100088.pythonanywhere.com/api/success')) {
    //       debugPrint('blocking navigation to ${change.url}');
    //       Get.back(result: true);
    //     }
    //     debugPrint('allowing navigation to ${change.url}');
    //   });

    // controller = PlatformWebViewController(
    //   const PlatformWebViewControllerCreationParams(),
    // )
    //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
    //   ..setPlatformNavigationDelegate(del)
    //   ..loadRequest(
    //     LoadRequestParams(
    //       uri: Uri.parse(widget.url),
    //     ),
    //   );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: PlatformWebViewWidget(
      //   PlatformWebViewWidgetCreationParams(controller: controller),
      // ).build(context),
      // body: ElevatedButton(
      //     onPressed: () async {
      //       await widget.browser.openUrlRequest(
      //         urlRequest: URLRequest(url: Uri.parse(widget.url)),
      //         // settings: InAppBrowserClassSettings(
      //         //   browserSettings: InAppBrowserSettings(
      //         //       toolbarTopBackgroundColor: Colors.blue,
      //         //       presentationStyle: ModalPresentationStyle.POPOVER),
      //         //   webViewSettings: InAppWebViewSettings(
      //         //     isInspectable: kDebugMode,
      //         //     useShouldOverrideUrlLoading: true,
      //         //     useOnLoadResource: true,
      //         //   ),
      //         // ),
      //       );
      //     },
      //     child: const Text("Open In-App Browser")),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
        onWebViewCreated: (controller) {
          _webViewController = controller;
        },
        onLoadStart: (controller, url) {
          debugPrint("printing url: ${url.toString()}");
        },
      ),
    );
  }
}

// class MyInAppBrowser extends InAppBrowser {
//   MyInAppBrowser(
//       {int? windowId, UnmodifiableListView<UserScript>? initialUserScripts})
//       : super(windowId: windowId, initialUserScripts: initialUserScripts);

//   @override
//   Future onBrowserCreated() async {
//     print("\n\nBrowser Created!\n\n");
//   }

//   @override
//   Future onLoadStart(url) async {}

//   @override
//   Future onLoadStop(url) async {
//     pullToRefreshController?.endRefreshing();
//   }

//   @override
//   Future<PermissionRequestResponse> onPermissionRequest(request) async {
//     return PermissionRequestResponse(
//         resources: request.resources,
//         action: PermissionRequestResponseAction.GRANT);
//   }

//   @override
//   void onLoadError(url, code, message) {
//     pullToRefreshController?.endRefreshing();
//   }

//   @override
//   void onProgressChanged(progress) {
//     if (progress == 100) {
//       pullToRefreshController?.endRefreshing();
//     }
//   }

//   @override
//   void onExit() {
//     print("\n\nBrowser closed!\n\n");
//   }

//   @override
//   Future<NavigationActionPolicy> shouldOverrideUrlLoading(
//       navigationAction) async {
//     print("\n\nOverride ${navigationAction.request.url}\n\n");
//     return NavigationActionPolicy.ALLOW;
//   }
// }
