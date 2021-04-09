import 'package:aws_task/Models/User_model.dart';
import 'package:aws_task/Providers/user_data.dart';
import 'package:aws_task/Services/user_services.dart';
import 'package:aws_task/Widgets/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user=Provider.of<UserData>(context).user;
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ProfileCard(),
          SizedBox(height: 10,),
          Center(child: Text(user.name , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.w500),)),
          SizedBox(height: 5,),
          Center(child: Text('${user.followerCount.toString()} Followers / ${user.followingCount.toString()} Following'),),
          SizedBox(height: 10,),
          Padding(
              padding: EdgeInsets.only(left: 30 , right: 30),
              child: Center(child: Text(user.biog),)),
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.all(15),
            child: Card(
              elevation: 3,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(children: [
                      Icon(Icons.location_on,),
                      SizedBox(width: 5,),
                      Text('${user.city} / ${user.country}'),
                    ],),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Icon(Icons.link),
                        SizedBox(width: 5,),
                        Text(user.url , style: TextStyle(color: Colors.blue , decoration: TextDecoration.underline),),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Icon(Icons.music_note),
                        SizedBox(width: 5,),
                        Text('${user.listenCount.toString()} Listen Count'),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Icon(Icons.favorite_border),
                        SizedBox(width: 5,),
                        Text('${user.favoriteCount.toString()} Favorite Count'),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

