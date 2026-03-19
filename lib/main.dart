import 'package:flutter/material.dart';
import 'telaDois.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Pedra, Papel, Tesoura'),
    );
  }
}

/*class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TelaDois(),
    );
  }
}*/


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'inter',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

        Padding(
        padding: const EdgeInsets.only(top: 50, bottom: 20),
        child: Image.asset(
          "assets/padrao.png",
          width: 140,
          height: 140,
          fit: BoxFit.contain,
        ),
      ),

      const Text(
        'Escolha do APP',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 100,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/pedra.png", height: 100),
                  Image.asset("assets/papel.png", height: 100),
                  Image.asset("assets/tesoura.png", height: 100),
                ],
              ),
          ],
        ),
      ),
    );
  }
}