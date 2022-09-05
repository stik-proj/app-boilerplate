import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:logger/logger.dart';

enum ConfigType { bool, double, int, string }

Map<String, dynamic> _defaultConfigs = {"testVal": 'test'};

Future<void> initRemoteConfig() async {
  await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(fetchTimeout: const Duration(minutes: 1), minimumFetchInterval: const Duration(hours: 6)));
  await _setDefaultConfigs(_defaultConfigs);
  await FirebaseRemoteConfig.instance.fetchAndActivate();
}

//리모트 컨피그에서 값을 받아오기 전에 세팅할 기본값을 넣기 위한 메소드
Future<void> _setDefaultConfigs(Map<String, dynamic> defaultConfigs) async {
  await FirebaseRemoteConfig.instance.setDefaults(defaultConfigs);
}

dynamic getConfig({required ConfigType dataType, required String configKey}) {
  dynamic remoteData;
  switch (dataType) {
    case ConfigType.bool:
      remoteData = FirebaseRemoteConfig.instance.getBool(configKey);
      break;
    case ConfigType.double:
      remoteData = FirebaseRemoteConfig.instance.getDouble(configKey);
      break;
    case ConfigType.int:
      remoteData = FirebaseRemoteConfig.instance.getInt(configKey);
      break;
    case ConfigType.string:
      remoteData = FirebaseRemoteConfig.instance.getString(configKey);
      break;
  }

  return remoteData;
}

void remoteConfigHealthCheck({String? configKey}) {
  if (configKey != null) {
    Logger().d(FirebaseRemoteConfig.instance.getValue(configKey).source);
  }
  Logger().d(FirebaseRemoteConfig.instance.lastFetchTime);
  Logger().d(FirebaseRemoteConfig.instance.lastFetchStatus);
}
