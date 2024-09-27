import 'package:flutter/material.dart';
import 'package:qr_code/widgets/custom_app_bar.dart';
import 'package:qr_code/widgets/qr_code_logo.dart';

class QrCodePatternGeneratedView extends StatelessWidget {
  const QrCodePatternGeneratedView({
    super.key,
    required this.text,
    required this.color,
    required this.isCirleShape, required this.colorShade,
  });
  final String text;
  final Color color;
  final Color colorShade;
  final bool isCirleShape;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('QR Code'),
      body: Center(
        child: QrCodeLogo(
          data: text,
          size: 250,
          color: color,
          isCirleShape: isCirleShape,
          colorShade : colorShade,
        ),
      ),
    );
  }
}
