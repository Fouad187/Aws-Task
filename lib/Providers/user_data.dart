import 'dart:convert';

import 'package:aws_task/Models/User_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData extends ChangeNotifier
{
  User user=User();
  SharedPreferences prefs;

  setUser(User user)
  {
    this.user=user;
  }

  User getUser()
  {
    return user;
  }
  saveUserData(User user) async {
    DateTime date=DateTime.now();
    String data=jsonEncode(user);
    prefs=await SharedPreferences.getInstance();
    prefs.setString('user', data);
    prefs.setString('date', date.toString());
  }
}