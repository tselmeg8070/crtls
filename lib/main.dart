import 'package:banker/screens/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:banker/screens/tabview/tabview.dart';
import 'package:banker/screens/splash.dart';
import 'package:banker/screens/auth/register.dart';
import 'package:banker/screens/auth/login.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: Colors.green,
        accentColor: Colors.cyan[600],
      ),
      initialRoute: '/',
        routes: {
          '/': (context) => MainTabView(),
          '/splash': (context) => SplashScreen(),
          '/login': (context) => SplashScreen(),
          '/auth': (context) => AuthScreen(),
          '/login': (context) => LoginScreen(),
          '/register': (context) => Register(),
//          '/login': (context) => TabView(),
//          '/register': (context) => TabView(),
//          '/intro': (context) => TabView(),
        },

    );
  }
}



