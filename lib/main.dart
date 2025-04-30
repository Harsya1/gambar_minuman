import 'package:flutter/material.dart';
import 'screen/dashboard.dart';

void main() {
  runApp(const MyApp()); // Memanggil runApp untuk menjalankan aplikasi
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Menu', // Judul aplikasi
      theme: ThemeData(
        fontFamily: 'Sans-serif', // Tema aplikasi
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const DashboardMinum(), // Halaman utama aplikasi
    );
  }
}
