import 'package:flutter/material.dart';

class TelaDois extends StatefulWidget {
  const TelaDois({super.key});

  @override
  State<TelaDois> createState() => _TelaDoisState();
}

class _TelaDoisState extends State<TelaDois> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          "Pedra, Papel, Tesoura  ",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 40,bottom: 10),
            child: Image.asset(
                "assets/papel.png",
              width: 120,
              height: 120,
            fit: BoxFit.contain,
            ),
            ),

            const Text(
              "Escolha do APP",
              style: TextStyle(
                fontSize: 22,
                fontFamily: 'inter',
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 30,bottom: 10),
            child: Image.asset(
              "assets/pedra.png",
              width: 120,
              height: 120,
              fit: BoxFit.contain,
            ),
            ),

            const Text(
            "Sua escolha",
            style: TextStyle(
              fontSize: 22,
              fontFamily: 'inter',
              fontWeight: FontWeight.bold
            ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: Image.asset(
              "assets/perder.png",
              width: 100,
              height: 100,
            ),
            ),

            const Text(
              "Voce Perde/Venceu",
              style: TextStyle(
                fontSize: 24 ,
                fontFamily: 'inter',
                fontWeight: FontWeight.bold
              ),
            ),

            Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 40),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              onPressed: (){

              },
              child: const Text(
                "Jogar novamente",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
     ),
    );
  }
}