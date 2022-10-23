import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset("assets/lottie/circular_loading.json"),
          ),
          const Center(
              child: Text(
            "Carregando ...",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ))
        ],
      ),
    );
  }
}
