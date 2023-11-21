import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarmad_task/app_bloc.dart';
import 'package:sarmad_task/home/view/screens/home_screen.dart';
import 'package:sarmad_task/utils/logger.dart';
import 'package:sarmad_task/utils/routes.dart';
import 'package:sarmad_task/utils/sailor.dart';


class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    Logger.log(event, tag: 'BLOC EVENT');
    super.onEvent(bloc, event);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    Logger.log(error, tag: 'BLOC ERROR');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    Logger.log(transition, tag: 'BLOC TRANSITION');
    super.onTransition(bloc, transition);
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBloc.providers,
      child: MaterialApp(
        navigatorKey: Sailor.navigatorKey,
        onGenerateRoute: AppRouter.generateRoute,
        home: const HomeScreen(),
      ),
    );
  }
}
