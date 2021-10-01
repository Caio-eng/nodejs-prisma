import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/views/detail.dart';
import 'package:http/http.dart' as http;

import 'views/addcarpage.dart';
import 'controllers/api.dart';
import 'models/carro.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Nodejs-Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var carros = <Carro>[];

  _getCarros()  {
    API.getCarros().then((response) {
      setState(() {
        Iterable lista = json.decode(response.body);
        carros = lista.map((model) => Carro.fromJson(model)).toList();
      });
    });
  }

  _navigateAddCarro(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AddCarPage()
        ));
    if (result) {
      setState(() {

      });
    }
  }

  @override
  void initState() {
    super.initState();
    this._getCarros();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Lista de Carros'),
        backgroundColor: Colors.indigo[900],
        leading: Icon(
            Icons.api,
          size: 40,
          color: Colors.orange,
        ),
        actions: [
          IconButton(onPressed: (){print('Olá');}, icon: Icon(Icons.more_vert))
        ],
      ),
      body: listaCarros(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _navigateAddCarro(context);
        },
        child: Icon(Icons.add, size: 30,),
        backgroundColor: Colors.indigo[900],
      ),
    );
  }

  listaCarros() {
    return ListView.builder(
        itemCount: carros.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Detail(
                          list: carros,
                          index: index
                      )
                    )
                  ),
                  child: Container(
                    height: 100.3,
                    child: Card(
                      color: Colors.white,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Container(
                                  child: Text(
                                      "Automovel: " + carros[index].nome,
                                       style: TextStyle(
                                         fontSize: 20,
                                         color: Colors.black87
                                       ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Container(
                                  child: Text(
                                    "Ano: " + carros[index].ano,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black87
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }
    );
  }

}
