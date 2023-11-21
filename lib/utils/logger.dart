import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';


class Logger {
  static const String tag = "SM-Mobile:";

  static log(dynamic msg, {String tag = tag}) {
    if (!kReleaseMode) {
      developer.log('$msg', name: tag);
    }
  }

  ///Singleton factory
  static final Logger _instance = Logger._internal();

  factory Logger() {
    return _instance;
  }

  Logger._internal();
}
