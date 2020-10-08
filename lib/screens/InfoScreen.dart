import 'package:concessionaria_paiv/utils/Magic.dart';
import 'package:concessionaria_paiv/widgets/AtributoInfo.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: Text('Informações'),
          actions: [
            IconButton(icon: Icon(Icons.edit), onPressed: () => Navigator.pushNamed(context, newCarRouteName)),
            IconButton(icon: Icon(Icons.delete), onPressed: () => _mostrarDialogoDeletar(context))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                child: Image.network(
                    'https://s2.glbimg.com/JMEgHotm57qsaD3uBVjDHPJdyno=/620x413/e.glbimg.com/og/ed/f/original/2020/03/20/novo_tracker_1.jpg'),
              ),
              Padding(
                  padding: EdgeInsets.all(10.00),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AtributoInfo('Nome', 'Tracker'),
                      Divider(
                          color: Colors.grey
                      ),
                      AtributoInfo('Modelo', '1.0T'),
                      Divider(
                          color: Colors.grey
                      ),
                      AtributoInfo('Preço', 'R\$ 87.490,00'),
                      Divider(
                          color: Colors.grey
                      ),
                      AtributoInfo('Ano', '2020'),
                      Divider(
                          color: Colors.grey
                      ),
                      AtributoInfo('Marca', 'volkswagen'),
                      Divider(
                          color: Colors.grey
                      ),
                      AtributoInfo('Km', '0'),
                      Divider(
                          color: Colors.grey
                      ),
                      AtributoInfo('Carro Novo', 'Sim'),
                      Divider(
                          color: Colors.grey
                      ),
                      AtributoInfo('Câmbio', 'Automático'),
                      Divider(
                          color: Colors.grey
                      ),
                      AtributoInfo('Cor', 'Azul')
                    ],
                  )),
            ],
          ),
        ));
  }

  Future<void> _mostrarDialogoDeletar(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Deletar Veículo Tracker'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Deseja deletar o veículo?'),
                Text('Essa ação é irreversível'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Sim'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
