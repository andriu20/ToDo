import 'package:flutter/material.dart';
import 'package:todo/src/presentation/pages/home/home_page.dart';
import 'package:todo/src/presentation/pages/login/login_page.dart';

import '../../presentation/pages/register/register_page.dart';

Map<String, WidgetBuilder> routes() => {
      'login': (_) => LoginPage(),
      'register': (_) => RegisterPage(),
      'home': (_) => HomePage(),
    };
