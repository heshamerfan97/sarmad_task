import 'package:dio/dio.dart';
import 'package:sarmad_task/utils/logger.dart';

class APIResultModel {
  final bool success;
  final String? message;
  final dynamic data;

  static String tag = 'API Result Model';

  APIResultModel({
    required this.success,
    this.message,
    this.data,
  });

  factory APIResultModel.fromResponse({Response? response, String? data}) {
    if (response != null) {
      try {
        Logger.log(response.data, tag: tag);
        Logger.log(response.statusCode, tag: tag);
        final Map<String, dynamic> responseBody = response.data as Map<String, dynamic>;
        return APIResultModel(
          success: (response.statusCode == 200 || response.statusCode == 201) &&
              ((responseBody['success_key'] == 1) ||
                  responseBody['status_code'] == 'OK' ||
                  responseBody['status_code'] == 200),
          message: responseBody['query_status'],
          data: data == null ? responseBody : responseBody[data],
        );
      } catch (error) {
        Logger.log('Error in getting result from response:\n $error', tag: tag);
        return APIResultModel(
          success: false,
          data: null,
          message: "cannot init result api",
        );
      }
    } else {
      Logger.log('Response is null', tag: tag);
      return APIResultModel(
        success: false,
        data: null,
        message: "Response is null",
      );
    }
  }
}
