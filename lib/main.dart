import 'package:flutter/material.dart';
import 'package:bmr/pages/input_page.dart';

// Fungsi utama: runApp() menjalankan widget root (MyApp)
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Tema gelap dengan warna kustom
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0A0E21),
          centerTitle: true,
          elevation: 0.0,
        ),
      ),
      // Halaman pertama yang tampil adalah halaman input
      home: const InputPage(),
    );
  }
}