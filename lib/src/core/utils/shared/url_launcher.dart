import 'package:jwallpaper/src/core/di/service_locator.dart';
import 'package:jwallpaper/src/core/utils/services/index.dart';
import 'package:logging/logging.dart';
import 'package:url_launcher/url_launcher_string.dart';

final Logger _log = Logger('UrlLauncher');

Future<void> launchUrl(String url) async {
  try {
    await launchUrlString(url);
  } catch (e) {
    _log.warning('cant launch url $url', e);
    di<MessageService>().show('unable to launch $url');
  }
}
