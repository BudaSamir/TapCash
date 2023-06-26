import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tap_cash/app_routes.dart';
import 'package:tap_cash/models/user_models.dart';

class UserPerferences extends ChangeNotifier {
  static late SharedPreferences prefs; // declare sharedPreferences variable.
  static sharedInitialize() async {
    prefs = await SharedPreferences
        .getInstance(); // assignment an Instance to shred variable.
  }

  Future<void> saveUser(User user, String screenName) async {
    // Select shared pre fun
    switch (screenName) {
      case AppRouter.onBoardScreen:
        prefs.setBool('seen', true);
        break;
      case AppRouter.loginScreen:
        prefs.setString("email", user.email!);
        prefs.setString("password", user.password!);
        prefs.setString("token", user.token!);
        break;
      case AppRouter.signupScreen:
        prefs.setString("firstName", user.firstName!);
        prefs.setString("lastName", user.lastName!);
        prefs.setString("email", user.email!);
        prefs.setString("phone", user.phone!);
        prefs.setString("token", user.token!);
        break;
    }
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? firstName = prefs.getString("firstName");
    String? lastName = prefs.getString("lastName");
    String? email = prefs.getString("email");
    String? phone = prefs.getString("phone");
    String? token = prefs.getString("token");
    String? renewalToken = prefs.getString("renewalToken");
    return User(
      firstName: firstName!,
      lastName: lastName,
      email: email!,
      phone: phone!,
      token: token!,
    );
  }

  userInfo() async {
    User userInfo = await getUser();
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("firstName");
    prefs.remove("lastName");
    prefs.remove("email");
    prefs.remove("phone");
    prefs.remove("token");
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    return token;
  }
}
