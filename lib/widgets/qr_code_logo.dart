import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeLogo extends StatelessWidget {
  const QrCodeLogo({
    super.key,
    required this.data,
    this.size,
    this.color,
    this.isCirleShape = false, this.colorShade,
  });
  final String data;
  final double? size;
  final Color? color;
  final Color? colorShade;
  final bool isCirleShape;
  @override
  Widget build(BuildContext context) {
    return QrImageView(
      data: data,
      version: QrVersions.auto,
      size: size ?? 200,
      eyeStyle: QrEyeStyle(
        eyeShape: isCirleShape ? QrEyeShape.circle : QrEyeShape.square,
        color: color ?? Colors.purple,
      ),
      dataModuleStyle: QrDataModuleStyle(
        dataModuleShape: isCirleShape ? QrDataModuleShape.circle : QrDataModuleShape.square,
        color: colorShade ?? Colors.purple.shade200,
      ),
      errorStateBuilder: (cxt, err) {
        return const Center(
          child: Text(
            'Uh oh! Something went wrong...',
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
