import 'package:aws_task/Models/Product_model.dart';
import 'package:aws_task/Providers/cart_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ProductSlideCard extends StatelessWidget {
  final Product product;
  ProductSlideCard({this.product});
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(5),
      child: Card(
        elevation: 3,
        child: Container(
          width: size.width*0.4,
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Expanded(
               child: Container(
                 width: double.infinity,
                 decoration: BoxDecoration(
                   image: DecorationImage(
                     image: AssetImage(product.image),
                     fit: BoxFit.fill,
                   ),
                 ),
               ),
             ),
              SizedBox(height: 15,),
              Text(product.name, style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Text('${product.oldPrice} LE ' , style: TextStyle(decoration: TextDecoration.lineThrough , fontSize: 18),),
              Text('${product.newPrice} LE' , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Container(
                  width: double.infinity,
                  height: 40,
                  child: FlatButton(onPressed: (){
                    final instance=Provider.of<CartItem>(context , listen: false);
                    instance.addProduct(product);
                  }, child: Text('Add To Cart') , color: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
