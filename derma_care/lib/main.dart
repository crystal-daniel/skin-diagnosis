import 'package:derma_care/pages/prediction.dart';
import 'package:flutter/material.dart';
import 'sidebar.dart';
import 'pages/skin_care_routines.dart';
import 'pages/nearby_dermatologists.dart';
import 'pages/donate.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Derma Care',
      home: const MainPage(),
      routes: {
        '/SkinCareRoutines': (context) => const SkinCareRoutines(),
        '/nearby_dermatologists': (context) => const NearbyDermatologists(),
        '/donate': (context) => const Donate(),
      },
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preliminary Diagnosis'),
        backgroundColor: const Color.fromARGB(255, 5, 26, 107),
      ),
      drawer: const Sidebar(),
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
          child: const PredictionPage()),
    );
  }
}
