import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travelapp/model/data_model.dart';
import 'package:travelapp/model/user_model.dart';
import 'package:travelapp/pages/Services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataServices {
  String baseUrl =
      "https://travelapi-production.up.railway.app"; //url da dove si prenderanno i dati

  Future<List<DataModel>> getInfo() async {
    var apiUrl = '/places'; //url dell'api da dove si prendono le info
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
      print("lol");
      return <DataModel>[];
    }
  }

  Future<UserModel> getId() async {
    var apiUrl = '/get_user?email=';
    http.Response res = await http.get(Uri.parse(
        baseUrl + apiUrl + FirebaseAuth.instance.currentUser!.email!));

    try {
      if (res.statusCode == 200) {
        dynamic body = json.decode(res.body);
        return UserModel.fromJson(body);
      } else {
        return UserModel(user_id: -1);
      }
    } catch (e) {
      print("lol2");
      return UserModel(user_id: -1);
    }
  }
}
