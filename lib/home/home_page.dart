import 'package:app_routes/app_routes.dart';
import 'package:app_routes/home/home_arguments.dart';
import 'package:app_routes/main.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
final HomeArguments arguments;

  final scaffoldKey = GlobalKey<ScaffoldState>();
   HomePage({required this.arguments, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyApp.title),
      ),
      body:  Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
           const Text('Home page', style: TextStyle(fontSize: 50)),
            const SizedBox(height: 16,),
           Text('Usertoken: ${arguments.userToken}'),
          const SizedBox(height: 16,),
          ElevatedButton(onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context,
             AppRoutes.splash, 
             ModalRoute.withName('/'),
             );
          }, child: const Text('Replace: Splash (Logout)')),

        ],
      ),),
    );
  }
}
