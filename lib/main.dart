import 'package:flutter/material.dart';
import 'package:todo/get_it.dart';
import 'package:todo/src/core/routes/routes.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
await init();
  runApp(MyApp());
}

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
