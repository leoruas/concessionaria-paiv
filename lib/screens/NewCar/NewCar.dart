import 'package:concessionaria_paiv/screens/NewCar/Steps/Image.dart';
import 'package:concessionaria_paiv/screens/NewCar/Steps/Description.dart';
import 'package:concessionaria_paiv/screens/NewCar/Steps/Information.dart';
import 'package:flutter/material.dart';

class NewCar extends StatefulWidget {
  @override
  _NewCarState createState() => _NewCarState();
}

class _NewCarState extends State<NewCar> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        data: ThemeData(primaryColor: Colors.red),
        child: Stepper(
          steps: [
            Step(
              title: Text('Informações'),
              content: TextInputs(),
              isActive: true,
            ),
            Step(
              title: Text('Características'),
              content: Description(),
              isActive: true,
            ),
            Step(
              title: Text('Imagem'),
              content: ImagePicker(),
              isActive: true,
            ),
          ],
          currentStep: _currentStep,
          onStepTapped: (step) {
            setState(() {
              _currentStep = step;
            });
          },
          onStepContinue: () {
            if (_currentStep < 2) {
              setState(() {
                _currentStep++;
              });
            } else {
              Navigator.pop(context);
            }
          },
          onStepCancel: () {
            if (_currentStep != 0) {
              setState(() {
                _currentStep--;
              });
            } else {
              Navigator.pop(context);
            }
          },
        ),
      ),
    );
  }
}
