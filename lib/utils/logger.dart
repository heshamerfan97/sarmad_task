import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class Logger {
  static const String tag = "Logger:";

  static log(dynamic msg, {String tag = tag}) {
    if (!kReleaseMode) {
      developer.log('$msg', name: tag);
    }
  }

  static logCubit(Change change, String cubitName) {
    if (!kReleaseMode) {
      developer.log('${change.currentState} => ${change.nextState}', name: '📦 Cubit $cubitName Change 📦');
    }
  }

  ///Singleton factory
  static final Logger _instance = Logger._internal();

  factory Logger() {
    return _instance;
  }

  Logger._internal();
}
