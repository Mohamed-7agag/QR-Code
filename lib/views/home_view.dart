import 'package:flutter/material.dart';
import 'package:qr_code/views/bar_code_scanner_view.dart';
import 'package:qr_code/views/generate_qr_code_view.dart';
import 'package:qr_code/widgets/custom_app_bar.dart';
import 'package:qr_code/widgets/custom_icon_button.dart';
import 'package:qr_code/widgets/qr_code_logo.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        'QR Code App',
        leading: const Padding(
          padding: EdgeInsets.only(top: 6),
          child: Icon(Icons.qr_code_rounded),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const QrCodeLogo(
              data: 'Welcome', 
              isCirleShape: false,
            ),
            const SizedBox(height: 120),
            CustomIconButton(
                text: 'Scan Code',
                icon: Icons.qr_code_scanner,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BarcodeScanner(),
                    ),
                  );
                }),
            const SizedBox(height: 20),
            CustomIconButton(
              text: 'Generate QR Code',
              icon: Icons.qr_code_rounded,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GenerateQrCodeView(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
