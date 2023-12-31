import 'package:sarmad_task/utils/logger.dart';

class TypeChecker {
  static int? isInt(dynamic number, {String? className, String? varName}) {
    if (number is int) {
      return number;
    } else {
      notifyAboutTypeConflict(number, "int", className: className, varName: varName);
      return null;
    }
  }

  static String? isString(dynamic text, {String? className, String? varName}) {
    if (text is String) {
      return text;
    } else {
      notifyAboutTypeConflict(text, "String", className: className, varName: varName);
      return null;
    }
  }

  static notifyAboutTypeConflict(dynamic value, String mainType,
          {String? className, String? varName}) =>
      Logger.log("${varName ?? ""} is ${value.runtimeType} which is not subtype of type $mainType",
          tag: "Handled Type conflict in $className");
}
