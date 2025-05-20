import 'dart:core';
import 'dart:async';
import 'dart:developer' as developer;
// import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '/pages/appsload/appsload.controller.dart';
// import '/app.dart';
import '/routes.dart';
// import '/services/config/config.controller.dart';
import 'start.dialog.dart';

class StartController extends GetxController {
  final RxBool _isInet = false.obs;
  bool get isInet {
    return _isInet.value;
  }

  set isInet(bool value) {
    _isInet.value = value;
  }

  final RxBool _isBackend = false.obs;
  bool get isBackend {
    return _isBackend.value;
  }

  set isBackend(bool value) {
    _isBackend.value = value;
  }

  final RxBool _isUser = false.obs;
  bool get isUser {
    return _isUser.value;
  }

  set isUser(bool value) {
    _isUser.value = value;
  }

  @override
  void onInit() async {
    final AppsLoadController controller = Get.find<AppsLoadController>();
    super.onInit();
    Timer(const Duration(seconds: 3), () async {
      isInet = await _isInternet();

      if (isInet) {
        // // if (GetPlatform.isWeb == true) {
        // final configController = Get.find<ConfigController>();
        // // sleep(const Duration(seconds: 3));
        // isBackend = await configController.loadItem();
        // // sleep(const Duration(seconds: 3));
        // isUser = await _iAuthsUser(configController);
        // // sleep(const Duration(seconds: 5));
        await controller.writeLoadApp();

        Get.offAllNamed(Routes.danger);

        // if (isUser) {
        //   Get.offAllNamed(Routes.danger);
        // } else {
        //   if (GetPlatform.isWeb == true) {
        //     Get.offAllNamed(Routes.web);
        //   } else if (GetPlatform.isMobile == true) {
        //     Get.offAllNamed(Routes.mobile);
        //   } else if (GetPlatform.isLinux == true) //GetPlatform.isDesktop
        //   {
        //     Get.offAllNamed(Routes.linux);
        //   } else //GetPlatform.isDesktop
        //   {
        //     Get.offAllNamed(Routes.desktop);
        //   }
        // }
      } else {
        //alarm is not internet//no connect to host
// no connection to host,
// renovation work is underway
        Get.dialog(const NoConnectDialogShowcase());
      }
    });
  }

  Future<bool> _isInternet() async {
    // try {
    //   // final result = await InternetAddress.lookup('google.com');
    //   final result = await InternetAddress.lookup('${App.config.baseUrl}/api');
    //   if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
    //     return true;
    //   } else {
    //     false;
    //   }
    // } on SocketException catch (_) {
    //   return false;
    // } finally {
    //   return true;
    // }
    //////////////////////////
    // ConnectivityResult connectionStatus = ConnectivityResult.none;
    // final Connectivity connectivity = Connectivity();
    // late ConnectivityResult result;
    // // Platform messages may fail, so we use a try/catch PlatformException.
    // try {
    //   result = await connectivity.checkConnectivity();
    //   connectionStatus = result;
    //   print(connectionStatus);
    //   return true;
    //   // } on PlatformException catch (e) {
    // } on SocketException catch (e) {
    //   developer.log('Couldn\'t check connectivity status', error: e);
    //   return false;
    // }
    if (GetPlatform.isWeb) {
      return true;
    } else {
      if (GetPlatform.isAndroid) {
        bool result = await InternetConnectionChecker().hasConnection;
        if (result == true) {
          print('YAY! Free cute dog pics!');
        } else {
          print('No internet :( Reason:');
          // print(InternetConnectionChecker().lastTryResults);
        }
        return result;
      } else {
        //Desktop
        return true;
      }
    }
  }

  // // Future<bool>
  // Future<bool> _iAuthsUser(ConfigController con) async {
  //   final UserController userController = Get.find<UserController>();
  //   if (userController.uid != '') {
  //     return await userController.getUserByUid(uid: userController.uid);
  //   } else {
  //     return false;
  //   }
  // }
}
