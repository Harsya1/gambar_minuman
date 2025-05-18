import 'package:flutter/material.dart';
import 'screen/routes/routes.dart';
// import 'screen/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Menu',
      theme: ThemeData(
        fontFamily: 'Sans-serif',
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/register', // Rute awal
      onGenerateRoute: RouteGenerator.generateRoute, // Gunakan RouteGenerator
    );
  }
}
