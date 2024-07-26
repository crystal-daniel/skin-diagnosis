import 'package:derma_care/skin_types.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

//import '../skin_types.dart';

class SkinCare extends StatefulWidget {
  const SkinCare({super.key});

  @override
  State<SkinCare> createState() => _SkinCareState();
}

class _SkinCareState extends State<SkinCare> {
  List<String> items = ['Normal', 'Oily', 'Dry', 'Sensitive'];
  String selectedItem = 'Normal';
  Widget? content;
  SkinTypes skinTypes = SkinTypes();
  late YoutubePlayerController _controller;

  @override
  void initState() {
    final videoID =
        YoutubePlayer.convertUrlToId(skinTypes.types[selectedItem]![1]);
    _controller = YoutubePlayerController(
        initialVideoId: videoID!,
        flags: const YoutubePlayerFlags(autoPlay: false));
    super.initState();
  }

  void getSkinCare() {
    setState(
      () {
        final videoID =
            YoutubePlayer.convertUrlToId(skinTypes.types[selectedItem]![1]);
        _controller = YoutubePlayerController(
            initialVideoId: videoID!,
            flags: const YoutubePlayerFlags(autoPlay: false));
        content = Container(
          margin: const EdgeInsets.all(15),
          child: ListView(
            children: [
              Text(
                "Skin Care Routine for $selectedItem Skin",
                style: GoogleFonts.skranji(color: Colors.white, fontSize: 30),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                skinTypes.types[selectedItem]![0],
                style: GoogleFonts.mukta(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(height: 20),
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.white)),
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  bottomActions: [
                    CurrentPosition(),
                    ProgressBar(
                      isExpanded: true,
                      colors: const ProgressBarColors(
                        backgroundColor: Colors.white,
                        playedColor: Colors.red,
                        handleColor: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    content ??= Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Choose your Skin Type:',
          style: GoogleFonts.cabin(color: Colors.white, fontSize: 20),
        ),
        const SizedBox(height: 15),
        SizedBox(
          width: 200,
          child: DropdownButtonFormField<String>(
            dropdownColor: const Color.fromARGB(255, 42, 38, 38),
            value: selectedItem,
            items: items
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: GoogleFonts.cabin(
                            color: Colors.white, fontSize: 15),
                      ),
                    ))
                .toList(),
            onChanged: (item) => setState(() => selectedItem = item!),
          ),
        ),
        const SizedBox(height: 15),
        ElevatedButton.icon(
          onPressed: getSkinCare,
          icon: const Icon(Icons.arrow_right_alt_rounded),
          label: const Text('Get Skin Care Routines'),
        )
      ],
    );
    return content!;
  }
}
