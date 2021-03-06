import 'package:concessionaria_paiv/models/Car.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class Description extends StatefulWidget {
  final Car car;
  final updateDescription;
  Description(this.car, {this.updateDescription});

  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  bool _automaticGearshift = false;
  bool _brandNew = false;
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);

  void initState() {
    if (widget.car.id != null) {
      setState(() {
        widget.car.isNew == 1 ? _brandNew = true : _brandNew = false;
        widget.car.isAuto == 1 ? _automaticGearshift = true : _automaticGearshift = false;
        currentColor = Color(widget.car.color);
        pickerColor = Color(widget.car.color);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Carro novo'),
                Switch(
                  value: _brandNew,
                  onChanged: (value) {
                    setState(() {
                      _brandNew = value;
                    });
                    widget.updateDescription(
                        _brandNew, _automaticGearshift, currentColor);
                  },
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Câmbio automático'),
                Switch(
                  value: _automaticGearshift,
                  onChanged: (value) {
                    setState(() {
                      _automaticGearshift = value;
                    });
                    widget.updateDescription(
                        _brandNew, _automaticGearshift, currentColor);
                  },
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Cor'),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Container(
                    width: size.width * 0.08,
                    child: RawMaterialButton(
                      onPressed: () => showDialog(
                        context: context,
                        child: AlertDialog(
                          content: SingleChildScrollView(
                            child: ColorPicker(
                              pickerColor: pickerColor,
                              onColorChanged: (color) =>
                                  setState(() => pickerColor = color),
                              showLabel: true,
                              pickerAreaHeightPercent: 0.8,
                            ),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child: const Text('Concluído'),
                              onPressed: () {
                                setState(() => currentColor = pickerColor);
                                Navigator.of(context).pop();
                                widget.updateDescription(_brandNew,
                                    _automaticGearshift, currentColor);
                              },
                            ),
                          ],
                        ),
                      ),
                      shape: CircleBorder(),
                      fillColor: pickerColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
