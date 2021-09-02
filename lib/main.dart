import 'package:app/pages/agreement.dart';
import 'package:app/pages/home.dart';
import 'package:app/pages/index.dart';
import 'package:app/pages/login.dart';
import 'package:app/pages/my.dart';
import 'package:app/pages/register.dart';
import 'package:app/states/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'common/http.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => Login())],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => IndexPage(),
        LoginPage.route: (context) => LoginPage(),
        RegisterPage.route: (context) => RegisterPage(),
        AgreementPage.route: (context) => AgreementPage(),
      },
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          String? routeName = settings.name;
          print(routeName);
          if (routeName == MyPage.route) {
            if (context.read<Login>().hasLogin) {
              return LoginPage();
            }
            return MyPage();
          }
          switch (settings.name) {
            default:
              return HomePage();
          }
        });
      },
    );
  }
}
