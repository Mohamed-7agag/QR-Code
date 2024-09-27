// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:linkfy_text/linkfy_text.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_code/views/bar_code_scanner_view.dart';
import 'package:qr_code/widgets/custom_app_bar.dart';
import 'package:qr_code/widgets/custom_icon_button.dart';
import 'package:qr_code/widgets/custom_snack_bar.dart';
import 'package:qr_code/widgets/custom_url_launcher.dart';

class BarCodeResultView extends StatelessWidget {
  const BarCodeResultView({super.key, required this.barcodeCapture});
  final BarcodeCapture? barcodeCapture;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const BarcodeScanner()));
        return Future.value(true);
      },
      child: Scaffold(
        appBar: buildAppBar('QR Code Result'),
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Text',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 18),
                    LinkifyText(
                      barcodeCapture == null
                          ? 'No QR Code found'
                          : barcodeCapture?.barcodes.first.rawValue ??
                              'No Data Found in QR Code',
                      textStyle: const TextStyle(fontSize: 18),
                      linkStyle: const TextStyle(
                          fontSize: 18, color: Colors.purple, height: 2.5),
                      onTap: (link) async {
                        await customUrlLauncher(context, link.value ?? '');
                      },
                    ),
                    const Expanded(child: SizedBox(height: 20)),
                    CustomIconButton(
                      text: 'Copy Text',
                      icon: Icons.copy_outlined,
                      onPressed: () {
                        if (barcodeCapture == null) {
                          errorSnackBar(
                            context,
                            'There is no Text in QR Code to Copy',
                          );
                        } else {
                          copyText(context);
                        }
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void copyText(BuildContext context) {
    Clipboard.setData(
      ClipboardData(
        text: barcodeCapture?.barcodes.first.rawValue ?? '',
      ),
    );
    successSnackBar(context, 'Text copied to clipboard');
  }
}
