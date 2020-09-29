import 'dart:convert';

import 'package:http/http.dart' as http;

class ProfesorProvider {
  final String _url = 'https://quizmaker-5c8e3.firebaseio.com/';

  Future createUser(String user, String pass) async {
    final url = '$_url/profesor.json';
    var data = {"user_prof": user, "pass_prof": pass};
    final resp = await http.post(url, body: jsonEncode(data));
    final decodedData = json.decode(resp.body);
    print(decodedData);
    return true;
  }
}
