import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarmad_task/utils/logger.dart';

class ConnectivityCubit extends Cubit<ConnectivityResult> {
  ConnectivityCubit() : super(ConnectivityResult.none);

  bool isConnected = false;

  initConnectivity() {
    Connectivity().onConnectivityChanged.listen((connectionStatus) {
      isConnected = (connectionStatus == ConnectivityResult.wifi || connectionStatus == ConnectivityResult.mobile);
      Logger.log(connectionStatus, tag: '🛜 Connection Status 🛜');
      emit(connectionStatus);
    });
  }
}
