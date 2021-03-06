import 'package:concessionaria_paiv/utils/RouterView.dart';
import 'package:flutter/material.dart';
import 'package:concessionaria_paiv/widgets/AppBarWidget.dart';
import 'package:concessionaria_paiv/screens/VendidosScreen.dart';
import 'package:concessionaria_paiv/screens/HomeScreen.dart';
import 'package:concessionaria_paiv/screens/EstoqueScreen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.red.shade900
      ),
      onGenerateRoute: RouterView.generateRoute,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 1;
  Icon btnIcon = Icon(Icons.search);
  Widget appBar = Text('Concessionária Paiv');

  final tabs = <Widget>[EstoqueScreen(), HomeScreen(), VendidosScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarWidget(),
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.red.shade900,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'Estoque',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Vendidos',
          )
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
