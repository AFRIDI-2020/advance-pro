import 'dart:convert';
import 'package:advance_pro/functions/toast.dart';
import 'package:advance_pro/models/LoginModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  LoginModel? _loginModel;
  bool _successLogin = false;

  get successLogin => _successLogin;

  Future<void> login(Map data) async {
    const String url =
        'https://webhooktest61.advanceprotech.com/api/Authenticate/login';
    try {
      var json = jsonEncode(data);
      var response = await http.post(Uri.parse(url),
          headers: {
            'accept': 'application/json',
            'Content-Type': 'application/json-patch+json'
          },
          body: json);
      if (response.statusCode == 200) {
        _loginModel = loginModelFromJson(response.body);
        if (_loginModel?.successResonse?.token != null) {
          _successLogin = true;
          print("totke = ${_loginModel!.successResonse!.token!}");
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('token', _loginModel!.successResonse!.token!);

        }
      } else {
        showToast('Login failed!');
      }
      notifyListeners();
    } catch (error) {
      showToast('Login failed!');
      print('login failed, error: $error');
    }
  }
}
