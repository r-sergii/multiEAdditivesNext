import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'spacing.dart';

class TextBody extends StatelessWidget {
  final String text;

  const TextBody({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle bodyTextStyle =
        GoogleFonts.openSans(textStyle: TextStyle(fontSize: 14, color: Theme.of(context).primaryColor));

    return Container(
      margin: marginBottom24,
      child: Text(
        text,
        style: bodyTextStyle,
      ),
    );
  }
}

class TextBodySecondary extends StatelessWidget {
  final String text;

  const TextBodySecondary({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle subtitleTextStyle = GoogleFonts.openSans(
        textStyle: TextStyle(fontSize: 14, color: Theme.of(context).secondaryHeaderColor, letterSpacing: 1));

    return Container(
      margin: marginBottom24,
      child: Text(
        text,
        style: subtitleTextStyle,
      ),
    );
  }
}

class TextHeadlineSecondary extends StatelessWidget {
  final String text;

  const TextHeadlineSecondary({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle headlineSecondaryTextStyle = GoogleFonts.montserrat(
        textStyle: TextStyle(fontSize: 20, color: Theme.of(context).primaryColor, fontWeight: FontWeight.w300));

    return Container(
      margin: marginBottom12,
      child: Text(text, style: headlineSecondaryTextStyle, softWrap: true),
    );
  }
}

class TextBlockquote extends StatelessWidget {
  final String text;

  const TextBlockquote({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle bodyTextStyle =
        GoogleFonts.openSans(textStyle: TextStyle(fontSize: 14, color: Theme.of(context).primaryColor));

    return Container(
      margin: marginBottom24,
      // decoration: const BoxDecoration(border: Border(left: BorderSide(width: 2, color: Color(0xFF333333)))),
      // decoration:
      //     BoxDecoration(border: Border(left: BorderSide(width: 2, color: Theme.of(context).secondaryHeaderColor))),
      decoration:
          BoxDecoration(border: Border(left: BorderSide(width: 2, color: Theme.of(context).secondaryHeaderColor))),
      // BoxDecoration(
      //     image:
      //         DecorationImage(image: IconImageProvider(Icons.circle, size: 100, color: Theme.of(context).primaryColor))),
      // BoxDecoration(border: Border(left: BorderSide(width: 2, color: Theme.of(context).secondaryHeaderColor))),
      padding: const EdgeInsets.only(left: 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: bodyTextStyle,
        ),
      ),
    );
  }
}

// ButtonStyle? menuButtonStyle = TextButton.styleFrom(
//     backgroundColor: Colors.transparent,
//     onSurface: null,
//     primary: textSecondary,
//     textStyle: buttonTextStyle,
//     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16));

// ButtonStyle? menuButtonStyle = TextButton.styleFrom(
//     backgroundColor: Theme.of(Get.context!).scaffoldBackgroundColor,
//     onSurface: null,
//     primary: Theme.of(Get.context!).secondaryHeaderColor,
//     textStyle: buttonTextStyle,
//     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16));

