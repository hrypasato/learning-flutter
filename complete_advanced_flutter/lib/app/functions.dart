import 'dart:io';

import 'package:complete_advanced_flutter/domain/models/devide_info.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';

Future<DeviceInfo> getDeviceDetails() async {
  String name = "unknown";
  String identifier = "unknown";
  String version = "unknown";

  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  try {
    if (Platform.isAndroid) {
      var build = await deviceInfoPlugin.androidInfo;
      name = build.brand + " " + build.model;
      identifier = build.id;
      version = build.version.codename;
    }
  } on PlatformException {
    return DeviceInfo(name, identifier, version);
  }
  return DeviceInfo(name, identifier, version);
}
