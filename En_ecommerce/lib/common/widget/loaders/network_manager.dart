import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:en_ecommerce/common/widget/loaders/loaders.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetWorkManager extends GetxController {
  static NetWorkManager get insatnce => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  ////// Error /////////
  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionstatus);
  }

  Future<void> _updateConnectionstatus(ConnectivityResult result) async {
    _connectionStatus.value = result;
    if (_connectionStatus.value == ConnectivityResult.none) {
      Loaders.warningSnackBar(title: "No Internet Connection");
    }
  }

  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      if (result == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }

  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
