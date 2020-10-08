import 'dart:convert';

import 'package:http/http.dart' as http;

class ProfesorProvider {
  final String _url = 'https://quizmaker-5c8e3.firebaseio.com/';
  final String _firebaseToken = 'AIzaSyDIgLyjP5jaVXgKr_-kFaibcNVMe8q6UpE';
  String node;

  Future<bool> loginUser(String user, String pass) async {
    final authData = {
      'email': user,
      'password': pass,
      'returnSecureToken': true
    };

    final resp = await http.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_firebaseToken',
        body: json.encode(authData));

    Map<String, dynamic> decodedResp = json.decode(resp.body);
    //print(decodedResp);
    if (decodedResp.containsKey('idToken')) {
      return true;
    } else {
      return false;
    }
  }

  Future createUser(String user, String pass) async {
    final authData = {
      'email': user,
      'password': pass,
      'returnSecureToken': true
    };

    final resp = await http.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseToken',
        body: json.encode(authData));

    Map<String, dynamic> decodedResp = json.decode(resp.body);
    //print(decodedResp);
    if (decodedResp.containsKey('idToken')) {
      return {'ok': true, 'token': decodedResp['idToken']};
    } else {
      return {'ok': false, 'mensaje': decodedResp['error']['mensaje']};
    }
  }

  Future createQuiz(String titleq, String urlq, String descrq) async {
    final url = '$_url/profesor.json';
    var data = {
      "tittle_quiz": titleq,
      "url_quiz": urlq,
      "desc_quiz": descrq,
    };
    final resp = await http.post(url, body: json.encode(data));
    final decodedData = json.decode(resp.body);
    return decodedData['name'];
  }

  Future createQuest(String nodeq, String enunq, String correcq, String firstq,
      String secq, String thirdq) async {
    final url = '$_url/profesor/$nodeq.json';
    var data = {
      "enunciate": enunq,
      "correct_opt": correcq,
      "first_opt": firstq,
      "sec_opt": secq,
      "third_opt": thirdq,
    };
    final resp = await http.post(url, body: json.encode(data));
    final decodedData = json.decode(resp.body);
    //print(decodedData);
    return true;
  }

  Future<List<String>> viewQuizes() async {
    final url = '$_url/profesor.json';
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    print(decodedData);
    return [];
  }

  // Future createUser(String user, String pass, String nameComplete) async {
  //   final url = '$_url/profesor.json';
  //   var data = {"user_prof": user, "pass_prof": pass, "nom_prof": nameComplete};
  //   final resp = await http.post(url, body: jsonEncode(data));
  //   final decodedData = json.decode(resp.body);
  //   print(decodedData);
  //   return true;
  // }

  // Future loginUser(String user, String pass) async {
  //   final url = '$_url/profesor.json';

  //   final resp = await http.get(url);
  //   print(resp.body);

  // }
}
