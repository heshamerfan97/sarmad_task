import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sarmad_task/app_bloc.dart';
import 'package:sarmad_task/modules/home/view/screens/home_screen.dart';
import 'package:sarmad_task/shared/controllers/connectivity_controller.dart';
import 'package:sarmad_task/shared/controllers/error_cubit.dart';
import 'package:sarmad_task/utils/logger.dart';
import 'package:sarmad_task/utils/routes.dart';
import 'package:sarmad_task/utils/sailor.dart';
import 'package:sarmad_task/utils/toast_utils.dart';


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
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});


  bool isConnectivityDialogShown = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBloc.providers,
      child: MaterialApp(
        navigatorKey: Sailor.navigatorKey,
        onGenerateRoute: AppRouter.generateRoute,
        home: BlocListener<ErrorCubit, String>(
            listener: (context, errorMessage) {
              if(errorMessage.isNotEmpty){
                ToastUtils.showToast(errorMessage, toastLength: Toast.LENGTH_LONG);
              }
            },
          child: BlocListener<ConnectivityCubit, ConnectivityResult>(
              listenWhen: (oldState, newState) => oldState != newState,
              listener: (context, connectivityState) {
                if (connectivityState != ConnectivityResult.wifi &&
                    connectivityState != ConnectivityResult.mobile && !isConnectivityDialogShown) {
                  isConnectivityDialogShown = true;
                  showDialog(
                      context: context,
                      builder: (ctx) =>
                          AlertDialog(
                            title: Text("No Internet Connection"),
                          )).then((value) => isConnectivityDialogShown = false);
                }
              },
            child: const HomeScreen()
          )
        ),
      ),
    );
  }
}
