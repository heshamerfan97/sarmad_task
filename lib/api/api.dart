import 'package:sarmad_task/api/api_result_model.dart';
import 'package:sarmad_task/api/dio_manager.dart';

class API {

  static const String generalPath = 'api/v1/integration/focal';

  ///USERS APIs
  final String searchForUsersPath = "$generalPath/screen/individual";




  ///User APIs
   Future<APIResultModel> searchForUsers({Map<String, dynamic>? body}) async {
    return APIResultModel.fromResponse(
        response: await DIOManger.post(path: searchForUsersPath, body: body),
        data: "screen_result");
  }

}
