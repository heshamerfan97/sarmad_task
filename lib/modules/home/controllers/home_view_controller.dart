import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewCubit extends Cubit<bool> {
  HomeViewCubit() : super(false);

  void toggleView() {
    emit(!state);
  }

}