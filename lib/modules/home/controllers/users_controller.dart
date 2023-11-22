import 'package:bloc/bloc.dart';
import 'package:sarmad_task/modules/home/models/user.dart';
import 'package:sarmad_task/modules/home/repositories/home_repository.dart';
import 'package:sarmad_task/utils/logger.dart';

class UsersCubit extends Cubit<List<User>?> {
  UsersCubit({HomeRepository? homeRepository})
      : _homeRepository = homeRepository ?? HomeRepository(),
        super([]);

  final HomeRepository _homeRepository;

  List<User> _users = [];

  searchForUsers({
    required String firstName,
    required String midName,
    required String nationality,
  }) async {
    emit(null);
    _users = await _homeRepository.searchForUsers(
      firstName: firstName,
      midName: midName,
      nationality: nationality,
    );
    emit([..._users]);
  }


  @override
  void onChange(Change<List<User>?> change) {
    Logger.logCubit(change, "Home");
    super.onChange(change);
  }
}
