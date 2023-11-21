import 'package:dio/dio.dart';
import 'package:sarmad_task/utils/logger.dart';

class DIOManger {
  static const String BaseUrl = 'http://193.122.86.183:8083/';

  static Options options = Options(
    headers: {
      "Content-Type": "application/json",
      'Accept': "application/json"
    },
    validateStatus: (int? code) => code ==200 || code == 201,
    contentType: "application/json",
    responseType: ResponseType.json,
    receiveTimeout: const Duration(seconds: 10),
    sendTimeout: const Duration(seconds: 10)
  );

  static Dio dio = Dio(BaseOptions(baseUrl: BaseUrl));


  ///POST Method
  static Future<Response?> post({
    required String path,
    required Map<String, dynamic>? body,
  }) async {
    try {
      Logger.log("Body posted to ${dio.options.baseUrl + path}: $body with headers: ${options.headers}");
      //print('Body: ${json.encode(body)}');
      final response = await dio.post(path, data: body, options: options);
      //final responseBody = json.decode(response.body);
      Logger.log('Response of posting to ${dio.options.baseUrl + path}:\n ${response.data}');
      return response;
    } catch (error) {
      Logger.log('Error in ${dio.options.baseUrl + path}:\n $error');
      return null;
    }
  }

  ///GET Method
  static Future<Response?> get({
    required String path,
    required Map<String, dynamic>? parameters,
  }) async {
    try {
      Logger.log('We are getting ${dio.options.baseUrl + path}:\n with headers: ${options.headers} and param $parameters');
      final response = await dio.get(path, queryParameters: parameters, options: options);
      //final responseBody = json.decode(response.body);
      Logger.log('Response of getting ${dio.options.baseUrl + path}:\n ${response.data}');
      return response;
    } catch (error) {
      Logger.log('Error in getting ${dio.options.baseUrl + path}:\n $error');
      return null;
    }
  }

}
