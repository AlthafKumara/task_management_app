import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkChecker {
  final Connectivity _connectivity = Connectivity();

  Stream<bool> get onStatusChange {
    return _connectivity.onConnectivityChanged.map((
      List<ConnectivityResult> results,
    ) {
      return results.any((result) => result != ConnectivityResult.none);
    });
  }

  
  Future<bool> get isConnected async {
    final results = await _connectivity.checkConnectivity();
    return results.any((result) => result != ConnectivityResult.none);
  }
}
