import 'package:aws_task/Models/User_model.dart';
import 'package:aws_task/Providers/user_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ProfileCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    User user=Provider.of<UserData>(context).user;
    return Container(
      width: size.width,
      height: size.height*0.25,
      child: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height*0.2,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(user.coverPictures.s1670wx240h),
                    fit: BoxFit.cover
                )
            ),
          ),
          Positioned(
            bottom: 0,
            left:0,
            right: 0,
            child: Center(
              child: Container(
                width: size.width*0.25,
                height: size.height*0.15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(user.pictures.extraLarge),
                      fit: BoxFit.fill,
                    )
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
