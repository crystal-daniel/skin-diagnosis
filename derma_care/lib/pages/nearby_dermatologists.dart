import 'package:derma_care/widgets/location_input.dart';
import 'package:flutter/material.dart';

class NearbyDermatologists extends StatelessWidget {
  const NearbyDermatologists({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Connect to a Doctor')),
      body: const Center(child: LocationInput()),
    );
  }
}
