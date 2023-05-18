import 'package:app_routes/app_routes.dart';
import 'package:app_routes/home/home_page.dart';
import 'package:app_routes/login/login_arguments.dart';
import 'package:app_routes/main.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyApp.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Splash page', style: TextStyle(fontSize: 50)),
            ElevatedButton(
              onPressed: ()  {
                const args = LoginArguments(username: 'sachin', password: '200');
                 Navigator.pushNamed(context, AppRoutes.login, arguments: args);
              },
              child: const Text('Push: Login + data'),
            ),
            const SizedBox(height: 16),            
            ElevatedButton(
              onPressed: () async {
                await Navigator.pushNamed(context, AppRoutes.login);
              },
              child: const Text('Push: Login + no data'),
            ),
              const SizedBox(height: 16),         
              ElevatedButton(onPressed: () {

              // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
    // HomePage(arguments: null,)), (Route<dynamic> route) => false);
    
                Navigator.pushNamedAndRemoveUntil(context,
                 AppRoutes.home,
                 ModalRoute.withName('/'));
              }, 
              child: const Text('Replace: Home (Guest)'),),
          ],
        ),
      ),
    );
  }
}
