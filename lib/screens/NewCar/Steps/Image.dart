import 'dart:io';

import 'package:concessionaria_paiv/models/Car.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageStep extends StatefulWidget {
  final updateImage;
  final Car car;

  ImageStep(this.car, {this.updateImage});

  @override
  _ImageStepState createState() => _ImageStepState();
}

class _ImageStepState extends State<ImageStep> {
  final picker = ImagePicker();
  File image;

  void initState() {
    if (widget.car.id != null) {
      setState(() {
        image = File(widget.car.image);
      });
    }
    super.initState();
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });

    widget.updateImage(image.path);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: Padding(
        padding: EdgeInsets.only(
            top: size.height * 0.08,
            bottom: size.height * 0.08,
            right: size.width * 0.05),
        child: Container(
          height: size.height * 0.19,
          width: size.height * 0.19,
          child: Stack(
            children: <Widget>[
              image == null
                  ? CircleAvatar(
                      radius: size.width * 0.20,
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: size.width * 0.18,
                      ),
                    )
                  : CircleAvatar(
                      radius: size.width * 0.20,
                      backgroundColor: Colors.amber,
                      backgroundImage: FileImage(image),
                    ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: size.height * 0.055,
                  width: size.height * 0.055,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () async {
                      try {
                        getImage();
                      } catch (e) {
                        print(e);
                      }
                    },
                    icon: Icon(
                      Icons.edit,
                      color: Colors.black54,
                    ),
                    iconSize: 15.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
