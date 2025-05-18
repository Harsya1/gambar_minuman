import 'package:flutter/material.dart';
import '../dashboard.dart';
import '../about.dart';
import '../register.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Jika ingin mengirim argument
    // final args = settings.arguments;
    switch (settings.name) {
      case '/register':
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      case '/':
        return MaterialPageRoute(builder: (_) => const DashboardMinum());
      case '/about':
        return MaterialPageRoute(builder: (_) => const AboutPage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: const Text("Error")),
        body: const Center(child: Text('Error page')),
      );
    });
  }
}