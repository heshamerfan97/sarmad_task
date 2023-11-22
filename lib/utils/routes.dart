import 'package:flutter/cupertino.dart';
import 'package:sarmad_task/modules/home/view/screens/home_screen.dart';
import 'package:sarmad_task/utils/logger.dart';



// this class contains all routes names
class AppRouter {
 static Route<dynamic> generateRoute(RouteSettings settings) {

   PageRouteBuilder  pageRouteBuilder(Widget page) {

     return PageRouteBuilder(
         settings: settings,
         pageBuilder: (_, __, ___) => page,
         transitionsBuilder: (_, a, __, c) =>
             FadeTransition(opacity: a,child: c,)
     );
   }
   Logger.log(settings.name, tag: 'Route');
     switch (settings.name){
       case Routes.homeScreen:
         return pageRouteBuilder(const HomeScreen());
       default:
            return pageRouteBuilder(const HomeScreen());



     }
   }
  }




class Routes {
  static const String homeScreen = "/home_screen";
}
