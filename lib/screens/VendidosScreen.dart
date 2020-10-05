import 'package:concessionaria_paiv/widgets/HorizontalCardWidget.dart';
import 'package:flutter/material.dart';

class VendidosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> lastAdded = <Widget>[
      HorizontalCard(),
      HorizontalCard(),
      HorizontalCard(),
      HorizontalCard(),
      HorizontalCard(),
      HorizontalCard(),
    ];
    return SingleChildScrollView(
     child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 3000,
                  child: ListView(
                    children: lastAdded,
                    scrollDirection: Axis.vertical,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
