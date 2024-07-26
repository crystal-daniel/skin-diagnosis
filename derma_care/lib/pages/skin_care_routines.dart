import 'package:derma_care/pages/skin_care.dart';
import 'package:flutter/material.dart';

class SkinCareRoutines extends StatelessWidget {
  const SkinCareRoutines({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skin Care Routines'),
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
              child: const SkinCare()),
        ),
      ),
    );
  }
}
