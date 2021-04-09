import 'dart:convert';

import 'package:aws_task/Models/User_model.dart';
import 'package:aws_task/Providers/cart_item.dart';
import 'package:aws_task/Providers/user_data.dart';
import 'package:aws_task/Services/user_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime date=DateTime.now();
    UserServices userServices=UserServices();
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider<CartItem>(create: (context) => CartItem(),),
        ChangeNotifierProvider<UserData>(create: (context) => UserData(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: SharedPreferences.getInstance(),
          builder: (context, snapshot) {
            if(snapshot.hasData)
            {
               String storedDate=snapshot.data.getString('date') ?? '';
               if(storedDate != '')
                 {
                   DateTime stored=DateTime.parse(storedDate);
                   int duration=DateTime.now().difference(stored).inHours;
                   if(duration >= 12)
                     {
                       userServices.getUserData(context);
                     }
                   else
                     {
                      String user=snapshot.data.getString('user') ?? '';
                      if(user !='')
                        {
                          var data=jsonDecode(user);
                          Provider.of<UserData>(context).user=User.fromJson(data);
                        }
                     }
                 }
               else
                 {
                   userServices.getUserData(context);
                 }
              return HomeScreen();
            }
            else if(snapshot.connectionState==ConnectionState.waiting)
            {
              return Container(color: Colors.white, child: CircularProgressIndicator(),);
            }
            else
            {
              return Container(color: Colors.white,child: CircularProgressIndicator(),);
            }
          },
        ),
      ),
    );
  }
}
