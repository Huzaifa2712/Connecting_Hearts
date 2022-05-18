import 'dart:html';

import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';

class uploadpage extends StatefulWidget {
  const uploadpage({Key? key}) : super(key: key);

  @override
  State<uploadpage> createState() => _uploadpageState();
}

class _uploadpageState extends State<uploadpage> {
  var file;

  photoFromCamera() async {
    Navigator.pop(context);
    var file = (await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1000,
      maxHeight: 1000,
    ));
    setState(() {
      this.file = file;
    });
  }

  photoFromGallery() async {
    Navigator.pop(context);
    var file = (await ImagePicker()
        .pickImage(source: ImageSource.gallery, maxHeight: 500, maxWidth: 400));
    setState(() {
      this.file = file;
    });
  }

  selectImage(parentContext) {
    return showDialog(
      context: parentContext,
      builder: (context) {
        return SimpleDialog(
          title: const Text('create post'),
          children: <Widget>[
            SimpleDialogOption(
              child: const Text('photo from camera'),
              onPressed: () => photoFromCamera(),
            ),
            SimpleDialogOption(
              child: const Text('photo from gallery'),
              onPressed: () => photoFromGallery(),
            ),
            SimpleDialogOption(
              child: const Text('cancel'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  Widget uploadScreen() {
    return Scaffold(
      body: Container(
        color: Colors.black87,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                selectImage(context);
              },
              child: const Text(
                'upload photo',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.white60,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Scaffold uploadForm() {
    return const Scaffold(
      body: Center(
        child: Text(
          'photo uploaded',
          style: TextStyle(
            fontSize: 40,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return file == null ? uploadScreen() : uploadForm();
  }
}
