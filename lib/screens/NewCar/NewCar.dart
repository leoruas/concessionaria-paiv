import 'package:concessionaria_paiv/models/Car.dart';
import 'package:concessionaria_paiv/screens/NewCar/Steps/Image.dart';
import 'package:concessionaria_paiv/screens/NewCar/Steps/Description.dart';
import 'package:concessionaria_paiv/screens/NewCar/Steps/Information.dart';
import 'package:concessionaria_paiv/utils/DatabaseHelper.dart';
import 'package:flutter/material.dart';

class NewCar extends StatefulWidget {
  final Car car;
  NewCar(args) : this.car = args;

  @override
  _NewCarState createState() => _NewCarState();
}

class _NewCarState extends State<NewCar> {
  int _currentStep = 0;
  DatabaseHelper db = DatabaseHelper();
  Car baseCar;
  bool isNewCar = true;

  _NewCarState();

  void initState() {
    if (widget.car != null) {
      setState(() {
        isNewCar = false;
        baseCar = widget.car;
      });
    } else {
      setState(() {
        baseCar = Car();
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        data: ThemeData(primaryColor: Colors.red),
        child: Stepper(
          steps: [
            Step(
              title: Text('Informações'),
              content: TextInputs(
                baseCar,
                updateInfo: updateInfo,
              ),
              isActive: true,
            ),
            Step(
              title: Text('Características'),
              content: Description(
                baseCar,
                updateDescription: updateDescription,
              ),
              isActive: true,
            ),
            Step(
              title: Text('Imagem'),
              content: ImageStep(
                baseCar,
                updateImage: updateImage,
              ),
              isActive: true,
            ),
          ],
          currentStep: _currentStep,
          onStepTapped: (step) {
            setState(() {
              _currentStep = step;
            });
          },
          onStepContinue: () async {
            if (_currentStep < 2) {
              setState(() {
                _currentStep++;
              });
            } else {
              Navigator.pop(context);
              //add new car
              baseCar.inStock = 1; //true

              if(isNewCar) {
                db.addItem(baseCar);
              } else {
                db.updateCar(baseCar);
                Navigator.pop(context);
              }
              
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

  void updateInfo(name, model, brand, price, year, km) {
    baseCar.name = name;
    baseCar.model = model;
    baseCar.brand = brand;
    baseCar.price = double.parse(price);
    baseCar.year = int.parse(year);
    baseCar.km = int.parse(km);
  }

  void updateDescription(isNew, isAuto, color) {
    baseCar.isNew = isNew ? 1 : 0;
    baseCar.isAuto = isAuto ? 1 : 0;
    baseCar.color = color.value;
  }

  void updateImage(image) {
    print("image");
    print(image);
    baseCar.image = image;
  }
}
