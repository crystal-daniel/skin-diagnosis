import 'dart:convert';

import 'package:derma_care/pages/result_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() {
    return _ImageInputState();
  }
}

class _ImageInputState extends State<ImageInput> {
  File? _selectedImage;
  Widget? content, mainPicture;
  String? filePath;

  String? _result;

  Future<String> _uploadImage() async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://0387-202-122-19-146.ngrok.io/'));
    var image = await http.MultipartFile.fromPath(
      'file',
      _selectedImage!.path,
    );
    request.files.add(image);
    try {
      print('before response');
      var response = await request.send();
      print('after response');
      if (response.statusCode == 200) {
        var responseData = await response.stream.toBytes();
        var responseString = String.fromCharCodes(responseData);
        Map<String, dynamic> resultMap = json.decode(responseString);
        setState(() {
          _result = resultMap['result'];
          print(_result);
        });
      } else {
        throw Exception('Failed to load result');
      }
    } catch (e) {
      print(e);
    }
    return _result!;
  }

  void _takePicture() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );

    if (pickedImage == null) {
      return;
    }
    setState(() {
      _selectedImage = File(pickedImage.path);
    });
  }

  void _selectPicture() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
    );
    if (pickedImage == null) {
      return;
    }
    setState(() {
      _selectedImage = File(pickedImage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    content = const Text(
      'No picture taken/selected',
      style: TextStyle(color: Color.fromARGB(255, 236, 223, 223)),
    );
    mainPicture ??= Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Upload Image/Take Picture to get Preliminary Diagnosis',
          style: GoogleFonts.robotoMono(color: Colors.white, fontSize: 25),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Container(
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(
                width: 1, color: const Color.fromARGB(255, 185, 181, 181)),
          ),
          height: 250,
          width: double.infinity,
          alignment: Alignment.center,
          child: content,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton.icon(
              icon: const Icon(Icons.camera),
              label: const Text('Take Picture'),
              onPressed: _takePicture,
            ),
            const SizedBox(
              width: 10,
            ),
            TextButton.icon(
              icon: const Icon(Icons.add_photo_alternate),
              label: const Text('Open Galery'),
              onPressed: _selectPicture,
            ),
          ],
        ),
      ],
    );
    if (_selectedImage != null) {
      content = Image.file(
        _selectedImage!,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
      mainPicture = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Upload Image/Take Picture to get Preliminary Diagnosis',
            style: GoogleFonts.robotoMono(color: Colors.white, fontSize: 25),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black),
            ),
            height: 250,
            width: double.infinity,
            alignment: Alignment.center,
            child: content,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton.icon(
                icon: const Icon(Icons.camera),
                label: const Text('Retake Picture'),
                onPressed: _takePicture,
              ),
              const SizedBox(
                width: 10,
              ),
              TextButton.icon(
                icon: const Icon(Icons.add_photo_alternate),
                label: const Text('Select Different Image'),
                onPressed: _selectPicture,
              ),
            ],
          ),
          TextButton.icon(
            onPressed: () {
              String? result;
              _uploadImage().then((res) {
                setState(() {
                  result = res;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultsPage(
                        disease: result!,
                      ),
                    ),
                  );
                });
              });
            },
            icon: const Icon(Icons.arrow_right),
            label: const Text('Get Prediction'),
          ),
        ],
      );
    }
    return mainPicture!;
  }
}
