import 'package:qr_code/widgets/custom_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> customUrlLauncher(context, String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    if (context.mounted) {
      errorSnackBar(context, 'Could not open link. Please try again.');
    }
  }
}
