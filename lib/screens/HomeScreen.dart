import 'package:concessionaria_paiv/models/Car.dart';
import 'package:concessionaria_paiv/utils/DatabaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:concessionaria_paiv/widgets/VerticalCardWidget.dart';
import 'package:concessionaria_paiv/widgets/HorizontalCardWidget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Car lastSold = Car(
    id: null,
    // image: "https://www.cstatic-images.com/stock/400x500/123919.jpg&height=369&autotrim=1"
  );
  List<Widget> lastAdded = [];
  List<Car> lastAddedCars = [];
  DatabaseHelper db = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    getCars();

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: 12.0,
              bottom: 40.0,
              top: 30.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Text(
                    'Última venda',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ),
                lastSold.name != null
                    ? HorizontalCard(car: lastSold)
                    : HorizontalCard(car: new Car(id: null)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Text(
                    'Carros adicionados recentemente',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ),
                Container(
                  height: 300,
                  child: ListView(
                    // This next line does the trick.
                    scrollDirection: Axis.horizontal,
                    children: lastAdded.length == 0
                        ? <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Nenhum carro adicionado",
                                  style: TextStyle(fontSize: screenSize.height * 0.023),
                                ),
                              ],
                            ),
                          ]
                        : lastAdded,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void getCars() async {
    Car last = await db.getLastSold();
    lastAddedCars = await db.getLastAdded();
    List<Widget> list = [];

    lastAddedCars.forEach((car) {
      list.add(VerticalCard(car: car));
    });

    if (mounted)
      setState(() {
        lastSold = last;
        lastAdded = list;
      });
  }
}
