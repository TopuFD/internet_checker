import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  late ConnectivityResult connectivityResult;
  late StreamSubscription<List<ConnectivityResult>> _streamSubscription;

  @override
  void onInit() async {
    super.onInit();
    _initConnectivity();
    _streamSubscription =
        _connectivity.onConnectivityChanged.listen((connectivityResults) {
      _updateConnectionStatus(connectivityResults.first);
    });
  }

  Future<void> _initConnectivity() async {
  List<ConnectivityResult> connectivityResults = await _connectivity.checkConnectivity();
  connectivityResult = connectivityResults.first;
}

  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    if (kDebugMode) print("STATUS : $connectivityResult");

    if (connectivityResult == ConnectivityResult.none) {
      Get.rawSnackbar(
          messageText: Text('PLEASE CONNECT TO THE INTERNET',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600)),
          isDismissible: false,
          duration: const Duration(days: 1),
          backgroundColor: Colors.red[400]!,
          icon: Icon(
            Icons.wifi_off,
            color: Colors.white,
            size: 35.sp,
          ),
          margin: EdgeInsets.zero,
          snackStyle: SnackStyle.GROUNDED);
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }

  @override
  void onClose() {
    _streamSubscription.cancel();
  }
}
