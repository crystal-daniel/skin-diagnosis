import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsPage extends StatelessWidget {
  final String disease;
  const ResultsPage({super.key, required this.disease});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Results'),
        backgroundColor: const Color.fromARGB(255, 5, 26, 107),
      ),
      body: Container(
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Predicted Skin Disease:',
                style: GoogleFonts.mukta(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                disease,
                style: GoogleFonts.mukta(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
