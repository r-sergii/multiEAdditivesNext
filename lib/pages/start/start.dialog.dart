import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app.dart';
// import '../../routes.dart';
import '/services/translator/translator.controller.dart';

class NoConnectDialogShowcase extends StatelessWidget {
  const NoConnectDialogShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final TranslatorController translator = Get.find<TranslatorController>();

    return AlertDialog(
      title: Text(translator.noConnect),
      content: Text(translator.noAccess),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              exit(0);
              // Get.back();
            },
            child: Text(translator.cancel)),
        // TextButton(onPressed: () {}, child: const Text('ALLOW')),
      ],
    );
  }
}

const sEULA =
    'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.';

class LicenseDialogShowcase extends StatelessWidget {
  final String app;
  final TextStyle appStyle;
  final String version;
  final TextStyle style;
  const LicenseDialogShowcase(
      {super.key, required this.app, required this.appStyle, required this.version, required this.style});

  @override
  Widget build(BuildContext context) {
    final TranslatorController translator = Get.find<TranslatorController>();

    return AlertDialog(
      title: Column(children: [Text(app), Text(version, style: appStyle)]),
      content: const Text(sEULA),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              App.isEULA = true;
              App.storage.write('EULA', true);
              Get.back();
            },
            child: Text(
              translator.confirm,
              style: style,
            )),
      ],
    );
  }
}

class ButtonTextSpan extends TextSpan {
  final VoidCallback callback;
  ButtonTextSpan({super.style, required Uri uri, required String super.text, required this.callback})
      : super(
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              callback();
            },
        );
}
