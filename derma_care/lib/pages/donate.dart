import 'package:derma_care/widgets/donate_page.dart';
import 'package:flutter/material.dart';

class Donate extends StatelessWidget {
  const Donate({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donate to Charity!'),
        backgroundColor: const Color.fromARGB(255, 5, 26, 107),
      ),
      body: Center(
        child: SizedBox.expand(
          child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 8, 40, 157),
                    Color.fromARGB(221, 0, 0, 0)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const DonatePage()),
        ),
      ),
    );
  }
}
