import 'package:sarmad_task/api/api.dart';
import 'package:sarmad_task/modules/home/models/user.dart';
import 'package:sarmad_task/utils/logger.dart';

class HomeRepository {
  final API _api;

  HomeRepository({API? api}) : _api = api ?? API();

  Future<List<User>> searchForUsers({
    required String firstName,
    required String midName,
    required String nationality,
  }) async {
    final res = await _api.searchForUsers(body: {
      "fname": firstName,
      "mname": midName,
      "nat": nationality,
    });
    Logger.log(res.data, tag: 'Repository Data');
    if (res.success) {
      return ((res.data as List<dynamic>?) ?? []).map((user) => User.fromJson(user)).toList();
    } else {
      return [];
    }
  }
}
