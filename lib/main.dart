import 'package:app_routes/app_routes.dart';
import 'package:app_routes/home/home_arguments.dart';
import 'package:app_routes/login/login_arguments.dart';
import 'package:app_routes/home/home_page.dart';
import 'package:app_routes/login/login_page.dart';
import 'package:app_routes/page/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  static const String title = 'Navigator 1.0';
  const MyApp({super.key});

    @override
  Widget build(BuildContext context) {
    
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      initialRoute: getInitialRoute(),
      onGenerateRoute: (route) {
        return getRoute(route);
      },
    );

  }

  String getInitialRoute() {
    return AppRoutes.splash;
  }

   Route? getRoute(RouteSettings settings) {

    switch (settings.name) {
      case AppRoutes.splash:
        return buildRoute(SplashPage(), settings: settings); 
      case AppRoutes.login:

          LoginArguments args = settings.arguments as LoginArguments;

        return args == null ? throw Exception('Error: No loginn Arguments') : buildRoute(LoginPage(arguments: args), settings: settings);
      case AppRoutes.home:
          const defaultArgs = HomeArguments(userToken: null);
           HomeArguments args = (settings.arguments ?? defaultArgs) as HomeArguments;
        return buildRoute(HomePage(arguments: args), settings: settings);

      default:
         return null;
    }
  }

  MaterialPageRoute buildRoute(Widget child, {required RouteSettings settings}) {
    return MaterialPageRoute(settings: settings, builder: (BuildContext context) => child);
  }

}
