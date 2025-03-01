import 'package:flutter/material.dart';
import 'package:todo/src/core/routes/rouetes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App ToDo',
      debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: 'Urbanist'),

      initialRoute: 'login',
      routes: routes(),
    );
  }
}
