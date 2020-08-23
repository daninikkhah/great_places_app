import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class ImageInput extends StatefulWidget {
  ImageInput(this.sendImage);
  final Function sendImage;
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;

  Future<void> _takePicture() async {
    final _imagePicker = ImagePicker();
    final _pickedImage =
        await _imagePicker.getImage(source: ImageSource.camera, maxWidth: 600);
    if (_pickedImage == null) return;
    setState(() {
      _storedImage = File(_pickedImage.path);
    });

    final appDirectory = await getApplicationDocumentsDirectory();
    final imageName = basename(_pickedImage.path);
    _storedImage.copy('${appDirectory.path}/$imageName');
    widget.sendImage(_storedImage);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          width: size.width / 2,
          height: size.width / 2 * 3 / 4,
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
                  width: double.infinity,
                ),
        ),
        Expanded(
          child: FlatButton.icon(
            onPressed: _takePicture,
            icon: Icon(
              Icons.camera_alt,
              color: Theme.of(context).primaryColor,
            ),
            label: Text(
              'Take Photo',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ),
        ),
      ],
    );
  }
}
