import 'package:flutter_bloc/flutter_bloc.dart';

class AppBloc {
  //static final applicationBloc = ApplicationBloc();

  static final List<BlocProvider> providers = [];

  static void dispose() {
   // applicationBloc.close();
  }

  ///Singleton factory
  static final AppBloc _instance = AppBloc._internal();

  factory AppBloc() {
    return _instance;
  }

  AppBloc._internal();
}
