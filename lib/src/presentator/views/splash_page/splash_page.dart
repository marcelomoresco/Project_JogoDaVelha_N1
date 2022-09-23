import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../jogo_da_velha/home_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        GestureDetector(
          child: Lottie.asset("assets/play.json"),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const HomePage(),
              ),
            );
          },
        ),
      ]),
    );
  }
}
