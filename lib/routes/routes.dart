import 'package:flutter/material.dart';

import 'package:chatt_app/pages/chatt_page.dart';
import 'package:chatt_app/pages/loading_page.dart';
import 'package:chatt_app/pages/login_page.dart';
import 'package:chatt_app/pages/register_page.dart';
import 'package:chatt_app/pages/usuarios_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'usuarios': (_) => UsuariosPage(),
  'chat'    : (_) => ChattPage(),
  'login'   : (_) => LoginPage(),
  'register': (_) => RegisterPage(),
  'loading' : (_) => LoadingPage(),
};