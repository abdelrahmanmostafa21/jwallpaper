import 'package:jwallpaper/src/app/shared/pexels/domain/index.dart';
import 'package:jwallpaper/src/core/di/service_locator.dart';
import 'package:jwallpaper/src/core/storage/index.dart';

enum _PexelsPrefsKeys { liked }

class PexelsPrefsDatasourceImpl implements PexelsDatasource {
  const PexelsPrefsDatasourceImpl();

  @override
  List<int> get likedPhotos => di<AppPreferences>().getStringList(_PexelsPrefsKeys.liked.name).map(int.parse).toList();

  @override
  set likedPhotos(List<int> value) =>
      di<AppPreferences>().setStringList(_PexelsPrefsKeys.liked.name, value.map((e) => e.toString()).toList());
}
