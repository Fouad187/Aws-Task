import 'package:flutter/material.dart';

class Slide extends StatelessWidget {
  const Slide({@required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.fill
        )
      ),
     );
  }
}