import 'package:flutter/material.dart';
import 'dart:io';

class ImageInput extends StatefulWidget {
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          width: size.width / 2,
          height: size.width / 2,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          alignment: Alignment.center,
          child: _storedImage == null
              ? const Text(
                  'No Image Available',
                  textAlign: TextAlign.center,
                )
              : Image.file(
                  _storedImage,
                  fit: BoxFit.cover,
                ),
        ),
        Expanded(
          child: FlatButton.icon(
            onPressed: null,
            icon: const Icon(Icons.camera_alt),
            label: const Text('Take Photo'),
          ),
        ),
      ],
    );
  }
}
