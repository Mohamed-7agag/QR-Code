import 'package:flutter/material.dart';
import 'package:qr_code/widgets/qr_code_logo.dart';

class QrCodeShape extends StatelessWidget {
  const QrCodeShape({
    super.key,
    required this.isCirleShape,
    required this.shape,
    required this.colors,
  });
  final bool isCirleShape;
  final bool shape;
  final List<Color> colors;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border:
            isCirleShape ? Border.all(color: colors[0], width: 1.5) : null,
      ),
      child: QrCodeLogo(
        data: 'QR Code',
        size: 150,
        color: colors[0],
        isCirleShape: shape,
        colorShade: colors[1],
      ),
    );
  }
}
