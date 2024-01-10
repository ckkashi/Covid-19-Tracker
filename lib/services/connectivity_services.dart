import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityServices {
  Future<bool> checkConnectivity() async {
    final result = await (Connectivity().checkConnectivity());
    if (result != ConnectivityResult.none) {
      return true;
    } else {
      return false;
    }
  }
}
