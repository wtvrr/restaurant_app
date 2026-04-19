import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 97, 50),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //OBEN (Logo mittig)
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Center(
              child: Image.asset(
                'assets/pizzalogo.png',
                width: 400,
              ),
            ),
          ),

          // UNTEN (Button mittig)
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/menupage');
                },
                child: const Text("Zum Menü"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}