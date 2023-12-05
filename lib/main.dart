import 'package:flutter/material.dart';
// import 'package:shop_ui/features/employee/presentation/employee.dart';
import 'package:shop_ui/features/presentation/pages/login.dart';
// import 'package:shop_ui/features/presentation/pages/home.dart';
// import 'package:shop_ui/features/presentation/pages/home.dart';
// import 'package:shop_ui/features/presentation/pages/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final DIContainer diContainer = DIContainer();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
