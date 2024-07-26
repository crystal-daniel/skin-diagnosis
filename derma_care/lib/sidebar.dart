import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      backgroundColor: const Color.fromARGB(255, 51, 229, 214),
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 53, 50, 50),
                  Color.fromARGB(255, 51, 229, 214)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Text(
              'DERMA CARE',
              style: GoogleFonts.anton(color: Colors.white, fontSize: 50),
            ),
          ),
          ListTile(
            title: const Text('Skin Care Routines'),
            onTap: () {
              Navigator.pushNamed(context, '/SkinCareRoutines');
            },
          ),
          ListTile(
            title: const Text('Connect to a Dermatologist'),
            onTap: () {
              Navigator.pushNamed(context, '/nearby_dermatologists');
            },
          ),
          ListTile(
            title: const Text('Donate!'),
            onTap: () {
              Navigator.pushNamed(context, '/donate');
            },
          ),
        ],
      ),
    );
  }
}
