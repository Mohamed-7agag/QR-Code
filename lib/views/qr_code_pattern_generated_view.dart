import 'dart:developer';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:qr_code/widgets/custom_app_bar.dart';
import 'package:qr_code/widgets/custom_button.dart';
import 'package:qr_code/widgets/custom_snack_bar.dart';
import 'package:qr_code/widgets/qr_code_logo.dart';

class QrCodePatternGeneratedView extends StatefulWidget {
  const QrCodePatternGeneratedView({
    super.key,
    required this.text,
    required this.color,
    required this.isCirleShape,
    required this.colorShade,
  });
  final String text;
  final Color color;
  final Color colorShade;
  final bool isCirleShape;

  @override
  State<QrCodePatternGeneratedView> createState() =>
      _QrCodePatternGeneratedViewState();
}

class _QrCodePatternGeneratedViewState
    extends State<QrCodePatternGeneratedView> {
  final GlobalKey _globalKey = GlobalKey();

  Future<void> _capturePng() async {
    try {
      RenderRepaintBoundary boundary = _globalKey.currentContext
          ?.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage();
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData != null) {
        Uint8List pngBytes = byteData.buffer.asUint8List();
        await _saveImage(pngBytes);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> _saveImage(Uint8List bytes) async {
    final result = await ImageGallerySaverPlus.saveImage(bytes, quality: 100);
    log(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('QR Code'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            RepaintBoundary(
              key: _globalKey,
              child: Container(
                color: Colors.white,
                child: QrCodeLogo(
                  data: widget.text,
                  size: 250,
                  color: widget.color,
                  isCirleShape: widget.isCirleShape,
                  colorShade: widget.colorShade,
                ),
              ),
            ),
            const Spacer(),
            CustomButton(
                text: 'Save QR Code to Gallery',
                onPressed: () async {
                  await _capturePng().then((value) {
                    if (context.mounted) {
                      successSnackBar(context, 'QR Code saved to Gallery');
                    }
                  });
                }),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
