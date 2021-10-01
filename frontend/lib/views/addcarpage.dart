import 'package:flutter/material.dart';
import 'package:frontend/controllers/api.dart';

class AddCarPage extends StatefulWidget {
  const AddCarPage({Key? key}) : super(key: key);

  @override
  _AddCarPageState createState() => _AddCarPageState();
}

class _AddCarPageState extends State<AddCarPage> {

  API api = API();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController marcaController = TextEditingController();
  final TextEditingController modeloController = TextEditingController();
  final TextEditingController anoController = TextEditingController();

  String _mensagemErro = "";

  _validarCampos() {
    String nome = nomeController.text;
    String marca = marcaController.text;
    String modelo = modeloController.text;
    String ano = anoController.text;

    if (nome.isNotEmpty && nome.length >= 3) {
      if (marca.isNotEmpty) {
        if (modelo.isNotEmpty) {
          if (ano.isNotEmpty) {
            api.addCarro(
              nomeController.text.trim(),
              marcaController.text.trim(),
              modeloController.text.trim(),
              anoController.text.trim(),
            );
            setState(() {

            });
            Navigator.pop(context, true);
            setState(() {

            });
          } else {
            _mensagemErro = "Ano é obrigatorio!";
          }
        } else {
          setState(() {
            _mensagemErro = 'Modelo é obrigatorio!';
          });
        }
      } else {
        setState(() {
          _mensagemErro = 'Marca é obrigatorio!';
        });
      }
    } else {
      setState(() {
        _mensagemErro = 'O nome do carro tem que conter ao menos 4 caracteres!';
      });
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cadastrar Carro'),
        backgroundColor: Colors.indigo[900],
      ),
      body: Form(
        key: _formKey,
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          padding: EdgeInsets.all(16),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                      padding: EdgeInsets.only(bottom: 8),
                    child: TextFormField(
                      controller: nomeController,
                      autofocus: true,
                      decoration: InputDecoration(
                        contentPadding:
                        EdgeInsets.fromLTRB(32, 16, 32, 16),
                        labelText: 'nome',
                        hintText: 'Nome do Carro',
                        //icon: Icon(Icons.directions_car),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: TextFormField(
                      controller: marcaController,
                      decoration: InputDecoration(
                        contentPadding:
                        EdgeInsets.fromLTRB(32, 16, 32, 16),
                        labelText: 'marca',
                        hintText: 'Marca do Carro',
                        //icon: Icon(Icons.directions_car),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: TextFormField(
                      controller: modeloController,
                      decoration: InputDecoration(
                        contentPadding:
                        EdgeInsets.fromLTRB(32, 16, 32, 16),
                        labelText: 'modelo',
                        hintText: 'Modelo do Carro',
                        //icon: Icon(Icons.directions_car),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: TextFormField(
                      controller: anoController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding:
                        EdgeInsets.fromLTRB(32, 16, 32, 16),
                        labelText: 'ano',
                        hintText: 'Ano do Carro',
                        //icon: Icon(Icons.directions_car),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: RaisedButton(
                      child: Text(
                        "Salvar",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      color: Colors.indigo[900],
                      padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {
                        _validarCampos();
                        setState(() {

                        });
                      },
                    ),
                  ),
                  Center(
                    child: Text(
                      _mensagemErro,
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
