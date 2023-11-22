import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarmad_task/modules/home/controllers/users_controller.dart';
import 'package:sarmad_task/modules/home/controllers/home_view_controller.dart';
import 'package:sarmad_task/shared/controllers/connectivity_controller.dart';
import 'package:sarmad_task/shared/controllers/error_cubit.dart';

class AppBloc {
  static final errorCubit = ErrorCubit();
  static final connectivityCubit = ConnectivityCubit();
  static final usersCubit = UsersCubit();
  static final homeViewCubit = HomeViewCubit();

  static final List<BlocProvider> providers = [
    BlocProvider<ErrorCubit>(create: (context) => errorCubit),
    BlocProvider<ConnectivityCubit>(create: (context) => connectivityCubit),
    BlocProvider<UsersCubit>(create: (context) => usersCubit),
    BlocProvider<HomeViewCubit>(create: (context) => homeViewCubit),
  ];

  static void dispose() {
    errorCubit.close();
    connectivityCubit.close();
    usersCubit.close();
    homeViewCubit.close();
  }

  ///Singleton factory
  static final AppBloc _instance = AppBloc._internal();

  factory AppBloc() {
    return _instance;
  }

  AppBloc._internal();
}
