import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:tap_cash/models/user_models.dart';
import 'package:tap_cash/utility/shared_preference.dart';

enum Status {
  notLoggedIn,
  notRegistered,
  loggedIn,
  registered,
  authenticating,
  registering,
  loggedOut
}

class AuthProvider extends ChangeNotifier {
  Status loginStatus = Status.notLoggedIn; // Default Value
  Status registerStatus = Status.notRegistered; // Default Value

  Status get getLoggedInStatus => loginStatus;
  Status get getRegisteredStatus => registerStatus;

  setLoginStatus(Status value) {
    loginStatus = value;
    notifyListeners();
  }

  setRegisterStatus(Status value) {
    registerStatus = value;
    notifyListeners();
  }

  Future<Map<String, dynamic>> register(
      {String? firstName,
      String? lastName,
      String? email,
      String? phone,
      String? password}) async {
    final Map<String, String> headers = {'Content-Type': 'application/json'};

    Uri url = Uri.parse(
        "https://battaria.glowrank.com/api/auth/register?lastName=$lastName&email=$email&password=$password&firstName=$firstName&phone=$phone");

    http.Response response = await http.post(url, headers: headers);
    Map<String, dynamic> responseData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print(responseData);
      User authUser = User.fromJson(responseData);
      // UserPerferences().saveUser(authUser);
      return {
        'status': true,
        'message': "Successfuly registered",
        'user': authUser
      };
    } else {
      return {
        'status': false,
        'message': "UnSuccessfuly registered",
        'user': responseData
      };
    }
  }

  Future<Map<String, dynamic>> login(String? email, String? password) async {
    print("1:$email");
    print("1:$password");

    final Map<String, String> headers = {'Content-Type': 'application/json'};
    loginStatus = Status.authenticating;
    notifyListeners();
    Uri url = Uri.parse(
        "https://battaria.glowrank.com/api/auth/login?email=$email&password=$password");
    http.Response response = await http.post(url, headers: headers);

    final Map<String, dynamic> responseData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      loginStatus = Status.loggedIn;
      notifyListeners();
      print(responseData);
      // User authUser = User.fromJson(responseData);
      // UserPerferences().saveUser(authUser);
      return {
        'status': true,
        'message': "Successfuly Login",
        'data': responseData
      };
    } else {
      loginStatus = Status.notLoggedIn;
      notifyListeners();
      return {'status': false, 'message': responseData['message']};
    }
  }

  Future<Map<String, dynamic>> verification(String? email) async {
    final Map<String, String> headers = {'Content-Type': 'application/json'};
    Uri url =
        Uri.parse("https://battaria.glowrank.com/api/send-otp?email=$email");
    http.Response response = await http.post(url, headers: headers);

    final Map<String, dynamic> responseData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      loginStatus = Status.loggedIn;
      notifyListeners();
      print(responseData);
      return {'status': true, 'message': responseData['message']};
    } else {
      loginStatus = Status.notLoggedIn;
      notifyListeners();
      return {'status': false, 'message': responseData['message']};
    }
  }

  Future<Map<String, dynamic>> resetPassword(
      String? email, String? otp, String? password) async {
    final Map<String, String> headers = {'Content-Type': 'application/json'};

    Uri url = Uri.parse(
        "https://battaria.glowrank.com/api/reset-password?email=$email&otp=$otp&password=$password&password_confirmation=$password");
    print(otp);
    print(email);
    print(password);

    http.Response response = await http.post(url, headers: headers);
    Map<String, dynamic> responseData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print(responseData);
      // UserPerferences().saveUser(authUser);
      return {
        'status': true,
        'message': responseData["message"],
      };
    } else {
      print(responseData);

      return {
        'status': false,
        'message': responseData["message"],
      };
    }
  }
}
