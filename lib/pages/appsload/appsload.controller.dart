import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:platform_device_id/platform_device_id.dart';
//comment out for building for Android - begin
import 'package:device_info_plus/device_info_plus.dart';
//comment out for building for Android - end
import '../../services/translator/translator.service.dart';
import './appsload.model.dart';
import './appsload.provider.dart';

class AppsLoadController extends GetxController {
  late AppsLoadModel loadModel;
  final LocaleService localController = Get.find<LocaleService>();
  // AppsLoadController() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  Future<void> writeLoadApp() async {
    String? deviceId;
    if (GetPlatform.isLinux == true) {
      //comment out for building for Android - begin
      try {
        DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
        final LinuxDeviceInfo linuxInfo = await deviceInfo.linuxInfo;
        deviceId = linuxInfo.machineId;
      } on PlatformException {
        deviceId = 'Failed to get platform version.';
      }
      //comment out for building for Android - end
    } else {
      try {
        deviceId = await PlatformDeviceId.getDeviceId;
      } on PlatformException {
        deviceId = 'Failed to get deviceId.';
      }
    }
    String platform;
    if (GetPlatform.isWeb == true) {
      platform = 'web';
    } else if (GetPlatform.isMobile == true) {
      if (GetPlatform.isAndroid == true) {
        platform = 'android';
      } else {
        platform = 'ios';
      }
    } else //GetPlatform.isDesktop
    {
      if (GetPlatform.isWindows == true) {
        platform = 'windows';
      } else if (GetPlatform.isLinux == true) {
        platform = 'linux';
      } else {
        platform = 'macos';
      }
    }

    loadModel = AppsLoadModel(
      application: 'mEAdditives',
      platform: platform,
      email: '',
      uid: '',
      device: deviceId!,
      locale: localController.codeLang,
      datetime: dateToUnix(
        DateTime.now(),
      ),
    );
    debugPrint(loadModel.toString());
    // await AppsLoadProvider().insertItem(loadModel);
  }


  // Future<void> writeWindowsLoadApp() async {
  //   String? deviceId;
  //   try {
  //     deviceId = await PlatformDeviceId.getDeviceId;
  //   } on PlatformException {
  //     deviceId = 'Failed to get deviceId.';
  //   }
  //   print(deviceId!);
  //   final model = AppsLoadModel(
  //       application: 'mEAdditives',
  //       platform: 'windows',
  //       email: '',
  //       uid: '',
  //       device: deviceId,
  //       datetime: dateToUnix(DateTime.now()));
  //   await AppsLoadProvider().insertItem(model);
  // }

  // Future<void> writeLinuxLoadApp() async {
  //   String? deviceId;
  //   try {
  //     deviceId = await PlatformDeviceId.getDeviceId;
  //   } on PlatformException {
  //     deviceId = 'Failed to get deviceId.';
  //   }
  //   print(deviceId!);
  //   final model = AppsLoadModel(
  //       application: 'mEAdditives',
  //       platform: 'linux',
  //       email: '',
  //       uid: '',
  //       device: deviceId,
  //       datetime: dateToUnix(DateTime.now()));
  //   await AppsLoadProvider().insertItem(model);
  // }

  int dateToUnix(DateTime date) {
    return date.microsecondsSinceEpoch ~/ 1000000;
    // return int.parse('${(date.microsecondsSinceEpoch / 1000 / 1000)}');
  }
}
