import 'package:flutter/material.dart';
import 'package:qr_code/views/qr_code_pattern_generated_view.dart';
import 'package:qr_code/widgets/custom_app_bar.dart';
import 'package:qr_code/widgets/custom_button.dart';
import 'package:qr_code/widgets/qr_code_color.dart';
import 'package:qr_code/widgets/qr_code_shape.dart';

class QrCodeCustomizationView extends StatefulWidget {
  const QrCodeCustomizationView({super.key, required this.text});
  final String text;

  @override
  State<QrCodeCustomizationView> createState() =>
      _QrCodeCustomizationViewState();
}

class _QrCodeCustomizationViewState extends State<QrCodeCustomizationView> {
  static List<List<Color>> colors = [
    [Colors.black, Colors.grey.shade700],
    [Colors.purple, Colors.purple.shade200],
    [Colors.green, Colors.green.shade200],
    [Colors.blue, Colors.blue.shade200],
    [Colors.orange, Colors.orange.shade200],
    [Colors.pink, Colors.pink.shade200],
    [Colors.teal, Colors.teal.shade200],
    [Colors.indigo, Colors.indigo.shade300],
    [Colors.cyan, Colors.cyan.shade200],
    [Colors.brown, Colors.brown.shade300],
    [Colors.red, Colors.red.shade300],
  ];

  int selectedColorIndex = 0;
  int selectedCircleShapeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('QR Code Customization'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Text('QR Code Color', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 25),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: colors
                    .map(
                      (color) => GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedColorIndex = colors.indexOf(color);
                          });
                        },
                        child: QrCodeColor(
                          color: color[0],
                          isSelected:
                              selectedColorIndex == colors.indexOf(color),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: 70),
            const Text('QR Code Shape', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 30),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCircleShapeIndex = 0;
                    });
                  },
                  child: QrCodeShape(
                    isCirleShape: selectedCircleShapeIndex == 0,
                    shape: false,
                    colors: colors[selectedColorIndex],
                  ),
                ),
                const SizedBox(width: 30),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCircleShapeIndex = 1;
                    });
                  },
                  child: QrCodeShape(
                    isCirleShape: selectedCircleShapeIndex == 1,
                    shape: true,
                    colors: colors[selectedColorIndex],
                  ),
                )
              ],
            ),
            const Expanded(child: SizedBox(height: 20)),
            CustomButton(
                text: 'Generate',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return QrCodePatternGeneratedView(
                      text: widget.text,
                      color: colors[selectedColorIndex][0],
                      colorShade: colors[selectedColorIndex][1],
                      isCirleShape: selectedCircleShapeIndex == 1,
                    );
                  }));
                }),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
