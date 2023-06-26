import 'package:flutter/material.dart';

enum NameType { firstName, lastName }

class Validator with ChangeNotifier {
  String? validatename(String? name, NameType nameType) {
    NameType type = nameType;
    String? msg;
    RegExp regex = RegExp(r"^[A-Za-z][A-Za-z0-9_]{7,29}$");
    if (name!.isEmpty) {
      msg = type == NameType.firstName
          ? "Your First Name is Required"
          : "Your Last Name is Required";
      return msg;
    } else if (regex.hasMatch(name)) {
      msg = type == NameType.firstName
          ? "Please provide a valid First Name"
          : "Please provide a valid Last Name";
      return msg;
    } else {
      return null;
    }
  }

  String? validateEmail(String? email) {
    String? msg;
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (email!.isEmpty) {
      msg = "Your Email is Required";
      return msg;
    } else if (regex.hasMatch(email)) {
      msg = "Please provide a valid emal address";
      return msg;
    } else {
      return null;
    }
  }

  String? validatePhone(String? phone) {
    String? msg;
    RegExp regex = RegExp(r'/^\+?[1-9][0-9]{7,14}$/');
    if (phone!.isEmpty) {
      msg = "Your phone is Required";
      return msg;
    } else if (regex.hasMatch(phone)) {
      msg = "Please provide a valid phone";
      return msg;
    } else {
      return null;
    }
  }

  String? validatePassword(String? password) {
    String? msg;
    RegExp regex = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^A-Za-z0-9])(?=.{8,})$');
    if (password!.isEmpty) {
      msg = "Your password is Required";
      return msg;
    } else if (regex.hasMatch(password)) {
      msg = "Please provide a valid password";
      return msg;
    } else {
      return null; // the password is good
    }
  }
}
