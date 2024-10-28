  import 'package:url_launcher/url_launcher.dart';

Future<void> openUrl({required String url}) async {
    final Uri launchedurl = Uri.parse(url);
  if (!await launchUrl(launchedurl)) {
    throw Exception('Could not launch $launchedurl');
  }
}