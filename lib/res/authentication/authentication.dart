import 'package:shared_preferences/shared_preferences.dart';

class Authentication {
  saveToken({required String token}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    print("Etoken$token");
    return token;
  }

  saveWalk(walk) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("walk", walk);
  }

  saveLogin(login) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("login", login);
  }

  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    prefs.remove('login');
  }

  getAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool login = prefs.getBool("login") ?? false;
    return login;
  }
}
