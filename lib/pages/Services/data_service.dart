import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travelapp/model/data_model.dart';

class DataServices {
  String baseUrl = ""; //url da dove si prenderanno i dati
  Future<List<DataModel>> getInfo() async {
    var apiUrl = ''; //url dell'api da dove si prendono le info
    http.Response res = await http.get(Uri.parse(baseUrl +
        apiUrl)); //crea richiesta al server e ritorna un http response
    try {
      if (res.statusCode == 200) {
        List<dynamic> list = json.decode(res.body);
        return list.map((e) => DataModel.fromJson(e)).toList();
      } else {
        return <DataModel>[];
      }
    } catch (e) {
      print(e);
      return <DataModel>[];
    }
  }
}
