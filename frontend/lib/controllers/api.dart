import 'dart:convert';

import 'package:http/http.dart' as http;

const baseUrl = "http://10.0.2.2:5000";

class API {
  static Future getCarros() async {
    var url = baseUrl + "/findCars";
    return await http.get(url);
  }
  Future<http.Response> addCarro(String nome, String marca, String modelo, String ano) async {
      var url = baseUrl + "/createCar";
      Map data = {
        'nome': '$nome',
        'marca': '$marca',
        "modelo": '$modelo',
        "ano": '$ano'
      };

      var body = json.encode(data);

      var response = await http.post(url, headers: {"content-Type": "application/json"}, body: body);
      return response;
  }

  Future<http.Response> editCarro(String id, String nome, String marca, String modelo, String ano) async {
    int a = int.parse(id);
    var url = baseUrl + "/updateCar/$a";
    Map data = {
      'id': '$a',
      'nome': '$nome',
      'marca': '$marca',
      "modelo": '$modelo',
      "ano": '$ano'
    };

    var body = json.encode(data);

    var response = await http.put(url, headers: {"content-Type": "application/json"}, body: body);
    return response;
  }

  Future<http.Response> removeCarro(String id) async {
    int a = int.parse(id);
    var url = baseUrl + "/deleteCar/$a";

    var response = await http.delete(url, headers: {"content-Type": "application/json"});
    return response;
  }
}