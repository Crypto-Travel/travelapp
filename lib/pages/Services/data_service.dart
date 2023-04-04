import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travelapp/model/data_model.dart';
import 'package:travelapp/model/history_model.dart';
import 'package:travelapp/model/user_model.dart';
import 'package:travelapp/pages/Services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../model/favorite_model.dart';

class DataServices {
  String baseUrl = "https://travelapi-production.up.railway.app";

  Future<List<DataModel>> getInfo() async {
    var apiUrl = '/places';
    http.Response res = await http.get(Uri.parse(baseUrl + apiUrl));
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

  void postCity(int userid, int placeid) async {
    var apiUrl = '/history';
    http.Response res = await http.post(Uri.parse(baseUrl + apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, int>{
          'userid': userid,
          'placeid': placeid,
        }));

    print(res.body);
  }

  Future<List<HistoryModel>> getHistoryInfo(int id) async {
    var apiUrl = '/history?userid=$id';
    http.Response res = await http.get(Uri.parse(baseUrl + apiUrl));
    try {
      if (res.statusCode == 200) {
        List<dynamic> list = json.decode(res.body);
        return list.map((e) => HistoryModel.fromJson(e)).toList();
      } else {
        return <HistoryModel>[];
      }
    } catch (e) {
      print("lol4");
      return <HistoryModel>[];
    }
  }

  void deleteAllHistory(int id) async {
    var apiUrl = '/history';
    http.Response res = await http.delete(Uri.parse(baseUrl + apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, int>{
          'userid': id,
        }));
    print(res.body);
  }

  Future<List<FavoriteModel>> getFav(int id) async {
    var apiUrl = '/all_favorites?userid=$id';
    http.Response res = await http.get(Uri.parse(baseUrl + apiUrl));
    try {
      if (res.statusCode == 200) {
        List<dynamic> list = json.decode(res.body);
        return list.map((e) => FavoriteModel.fromJson(e)).toList();
      } else {
        return <FavoriteModel>[];
      }
    } catch (e) {
      print("lol5");
      return <FavoriteModel>[];
    }
  }

  void postFav(int userid, int placeid, bool bool) async {
    var apiUrl = '/favorites';
    http.Response res = await http.post(Uri.parse(baseUrl + apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'userid': userid,
          'placeid': placeid,
          'isfav': bool
        }));

    print(res.body);
  }
}
