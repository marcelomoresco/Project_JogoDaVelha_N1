import 'package:flutter/material.dart';
import 'package:tic_tac_project/src/presentator/views/jogo_da_velha/home_page.dart';
import 'package:tic_tac_project/src/presentator/views/splash_page/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
