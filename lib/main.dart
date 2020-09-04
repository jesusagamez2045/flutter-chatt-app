import 'package:flutter/material.dart';
import 'package:chatt_app/routes/routes.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chatt App',
      initialRoute: 'login',
      routes: appRoutes,
    );
  }
}