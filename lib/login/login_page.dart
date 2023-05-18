import 'package:app_routes/app_routes.dart';
import 'package:app_routes/login/login_arguments.dart';
import 'package:app_routes/main.dart';
import 'package:flutter/material.dart';

import '../home/home_arguments.dart';

class LoginPage extends StatelessWidget {

final LoginArguments arguments;

 LoginPage({super.key, required this.arguments});

  final scaffoldKey = GlobalKey<ScaffoldState>();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyApp.title),
      ),
      body:  Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           const Text('Login page', style: TextStyle(fontSize: 50)),
           const SizedBox(height: 16,),
          Text('username: ${arguments.username}',),
            const SizedBox(height: 16,),
            Text('password: ${arguments.password}',),
             const SizedBox(height: 16,),

          ElevatedButton(onPressed: () {
            const args = HomeArguments(userToken: 'MyUserToken');
            Navigator.pushNamedAndRemoveUntil(context, 
            AppRoutes.home, 
            ModalRoute.withName('/'),
             arguments: args);
          }, 

          child: const Text('Replace: Home (Login)')),

          ElevatedButton(onPressed: () {
            Navigator.pop(context);
          }, 
          child: const Text('Pop: splash')),


        ],
      ),),
    );
  }
}
