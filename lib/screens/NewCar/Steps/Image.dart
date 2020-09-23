import 'package:flutter/material.dart';

class ImagePicker extends StatefulWidget {
  @override
  _ImagePickerState createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          height: size.height * 0.19,
          width: size.height * 0.19,
          child: Stack(
            children: <Widget>[
              CircleAvatar(
                radius: size.width * 0.20,
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: size.width * 0.18,
                ),
              ),
              /*image == null
                  ? CircleAvatar(
                      radius: size.width * 0.20,
                      backgroundColor: Colors.amber,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: size.width * 0.20,
                      ),
                    )
                  : CircleAvatar(
                      radius: size.width * 0.20,
                      backgroundColor: Colors.amber,
                      backgroundImage: FileImage(image),
                    ),*/
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: size.height * 0.04,
                  width: size.height * 0.04,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () => print('image'),
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
