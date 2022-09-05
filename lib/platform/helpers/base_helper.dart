import 'package:app_boilerplate/platform/firebase/remote_config.dart';
import 'package:package_info_plus/package_info_plus.dart';

Future<bool> isUpdateTarget() async {
  dynamic remoteAppVersion = getConfig(dataType: ConfigType.string, configKey: 'minimum_app_version');
  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  List<int> splitVersionString(String versionString) {
    return versionString.split('.').map((element) => int.parse(element)).toList();
  }

  List<int> minAppVersion = splitVersionString(remoteAppVersion);
  List<int> deviceAppVersion = splitVersionString(packageInfo.version);

  bool isUnderMinVersion = false;

  for (int i = 0; i < minAppVersion.length; i++) {
    if (minAppVersion[i] > deviceAppVersion[i]) {
      isUnderMinVersion = true;
      break;
    } else if (minAppVersion[i] < deviceAppVersion[i]) {
      break;
    }
  }
  return isUnderMinVersion;
}
