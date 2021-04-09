import 'dart:convert';

import 'package:aws_task/Models/User_model.dart';
import 'package:aws_task/Providers/user_data.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class UserServices
{
  String url='https://api.mixcloud.com/spartacus/';

  getUserData(context) async
  {
    final instance=Provider.of<UserData>(context);
    http.Response response=await http.get(url);
    if(response.statusCode==200)
      {
        String json=response.body;
        var data=jsonDecode(json);
        instance.user=User.fromJson(data);
        instance.saveUserData(User.fromJson(data));
      }
  }
}