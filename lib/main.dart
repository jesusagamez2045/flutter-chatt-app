import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chatt_app/services/chatt_service.dart';
import 'package:chatt_app/services/socket_service.dart';
import 'package:chatt_app/routes/routes.dart';
import 'package:chatt_app/services/auth_service.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService(),),
        ChangeNotifierProvider(create: (_) => SocketService(),),
        ChangeNotifierProvider(create: (_) => ChattService(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chatt App',
        initialRoute: 'loading',
        routes: appRoutes,
      ),
    );
  }
}