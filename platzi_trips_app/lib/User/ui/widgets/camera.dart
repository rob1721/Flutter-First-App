import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraPickToFile {

  final PickedFile pickedFile;
  // constructor
  CameraPickToFile(this.pickedFile);
  // ignore: unused_field
  var _image;
  final picker = ImagePicker();

  Future getImage() async {
    final asdpicked = await picker.getImage(source: ImageSource.camera);
    _image = File(asdpicked.path);
  }
  
}