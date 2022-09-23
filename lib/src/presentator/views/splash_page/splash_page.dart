import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../jogo_da_velha/home_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Column(
            children: const [
              Text(
                "Jogo da velha",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Desenvolva diversas habilidades relacionadas á noções matemáticas e ao movimento, como: lateralidade, noção espacial, raciocínio lógico e coordenação motora",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
          GestureDetector(
            child: Lottie.asset("assets/play.json", height: 300),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const HomePage(),
                ),
              );
            },
          ),
          Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 190,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shadowColor: Colors.yellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const HomePage(),
                    ),
                  );
                },
                child: const Text(
                  "Jogar",
                  style: TextStyle(color: Colors.black, fontSize: 22),
                ),
              ))
        ]),
      ),
    );
  }
}
