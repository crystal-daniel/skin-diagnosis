import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class DonatePage extends StatelessWidget {
  const DonatePage({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> webURL() async {
      final Uri url = Uri.parse("https://www.smilefoundationindia.org/");
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        throw "Cannot Launch url";
      }
    }

    Future<void> donateURL() async {
      final Uri url = Uri.parse(
          "https://donate.smilefoundationindia.org/donate-for-healthcare");
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        throw "Cannot Launch url";
      }
    }

    return Container(
      margin: const EdgeInsets.fromLTRB(10, 2, 10, 10),
      child: ListView(
        children: [
          const SizedBox(height: 10),
          Center(
            widthFactor: 250,
            child: Image.asset(
              'assets/smile.png',
              width: 250,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "\t\t\t\t\t\t\t\tSmile Foundation was initiated in 2002 when a group of friends came together with the intention of giving back to the society. They were inspired by the thought and philosophy of Peter Senge, the founder of the Society for Organizational Learning who has propagated that “sustainability, social equality and the environment are now business problems…” and corporate leaders can\u2019t expect governments to solve them alone.\n\n\t\t\t\t\t\t\t\tWhat triggered these thoughts was the liberalisation of the Indian economy in the 1990\u2019s which brought with it immense opportunities. Business revived, and India became not just a market, but also an investment prospect for the developed world. Disposable incomes and early settlements became a living reality for the working middle-class. For the first time in India, professionals could think beyond making a living, and contribute towards the society.",
            style: GoogleFonts.mooli(
              fontSize: 20,
              color: Colors.white,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: webURL,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                foregroundColor: Colors.black,
              ),
              child: const Text('Read More about SMILE Foundation'),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: donateURL,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.black,
              ),
              child: const Text('Donate Now!'),
            ),
          ),
        ],
      ),
    );
  }
}
