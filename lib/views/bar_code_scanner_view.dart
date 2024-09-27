import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_code/views/bar_code_result_view.dart';

class BarcodeScanner extends StatefulWidget {
  const BarcodeScanner({super.key});

  @override
  State<BarcodeScanner> createState() => _BarcodeScannerState();
}

class _BarcodeScannerState extends State<BarcodeScanner> {
  final MobileScannerController controller = MobileScannerController();

  final ImagePicker _picker = ImagePicker();
  BarcodeCapture? barcode;
  Future<void> _scanQRCodeFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      barcode = await controller.analyzeImage(image.path);
    }
  }

  @override
  void initState() {
    super.initState();
    controller.start();
  }

  @override
  void dispose() {
    controller.stop();
    controller.dispose();
    super.dispose();
  }

  bool _isNavigating = false;

  @override
  Widget build(BuildContext context) {
    final double topBottomBorderWidth =
        (MediaQuery.sizeOf(context).height - 235) / 2;
    final double leftRightBorderWidth =
        (MediaQuery.sizeOf(context).width - 235) / 2;

    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          MobileScanner(
            controller: controller,
            overlayBuilder: (context, constraints) {
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border:
                      buildBorder(topBottomBorderWidth, leftRightBorderWidth),
                ),
                child: Container(
                  width: 235,
                  height: 235,
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.white70,
                  )),
                ),
              );
            },
            scanWindow: Rect.fromCenter(
              center: MediaQuery.of(context).size.center(Offset.zero),
              width: 235,
              height: 235,
            ),
            onDetect: (barcode) {
              if (!_isNavigating) {
                _isNavigating = true;
                controller.stop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        BarCodeResultView(barcodeCapture: barcode),
                  ),
                );
              }
            },
          ),
          Positioned(
            bottom: 30,
            child: Row(
              children: [
                IconButton(
                  onPressed: () async {
                    await _scanQRCodeFromGallery();

                    if (context.mounted) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return BarCodeResultView(barcodeCapture: barcode);
                          },
                        ),
                      );
                    }
                  },
                  icon: const Icon(
                    Icons.photo,
                    color: Colors.white,
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.15),
                    padding: const EdgeInsets.all(14),
                    iconSize: 28,
                  ),
                ),
                const SizedBox(width: 25),
                IconButton(
                  onPressed: () async {
                    await controller.toggleTorch();
                  },
                  icon: const Icon(
                    Icons.flash_on,
                    color: Colors.white,
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.15),
                    padding: const EdgeInsets.all(14),
                    iconSize: 28,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Border buildBorder(double topBottomBorderWidth, double leftRightBorderWidth) {
    return Border(
      top: buildBorderSide(topBottomBorderWidth),
      left: buildBorderSide(leftRightBorderWidth),
      right: buildBorderSide(leftRightBorderWidth),
      bottom: buildBorderSide(topBottomBorderWidth),
    );
  }

  BorderSide buildBorderSide(double topBottomBorderWidth) {
    return BorderSide(
      color: Colors.black.withOpacity(0.65),
      width: topBottomBorderWidth,
    );
  }
}
