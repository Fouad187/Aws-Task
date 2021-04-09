import 'package:aws_task/Widgets/productSlide_card.dart';
import 'package:aws_task/constant.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class HomeTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 30 , left: 15 , right: 15),
          child: ListView(
            children: [
              Text('Welcome to AWS ' , style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold,)),
              SizedBox(height: 15,),
              Text('Daily Offers' , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
              SizedBox(height: 15,),
              Container(
                width: double.infinity,
                height: size.height*0.3,
                child: Carousel(
                  images: slideList,
                  dotBgColor: Colors.transparent,
                  dotColor: Colors.orange,
                  dotIncreasedColor: Color(0xFFFE724C),
                  dotSpacing: 30,
                  dotSize: 6,
                  autoplayDuration: Duration(seconds: 10),
                  autoplay: true,
                ),
              ),
              SizedBox(height: 15,),
              Text('New Products' , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Container(
                width: size.width,
                height: 300,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ProductSlideCard(product: productList[index],);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
