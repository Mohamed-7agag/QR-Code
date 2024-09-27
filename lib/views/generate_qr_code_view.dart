import 'package:flutter/material.dart';
import 'package:qr_code/views/qr_code_customization_view.dart';
import 'package:qr_code/widgets/custom_app_bar.dart';
import 'package:qr_code/widgets/custom_button.dart';
import 'package:qr_code/widgets/custom_snack_bar.dart';
import 'package:qr_code/widgets/custom_text_field.dart';

class GenerateQrCodeView extends StatefulWidget {
  const GenerateQrCodeView({super.key});

  @override
  State<GenerateQrCodeView> createState() => _GenerateQrCodeViewState();
}

class _GenerateQrCodeViewState extends State<GenerateQrCodeView> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Generate QR Code'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  CustomTextField(controller: controller),
                  const Expanded(child: SizedBox(height: 20)),
                  CustomButton(
                    text: 'Next',
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      if (controller.text.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QrCodeCustomizationView(
                              text: controller.text,
                            ),
                          ),
                        );
                      } else {
                        errorSnackBar(
                            context, 'Enter text to generate QR code');
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
