import 'package:aws_task/Models/Product_model.dart';
import 'package:aws_task/Providers/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CartCard extends StatelessWidget {
  final Product product;
  CartCard({this.product});
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Card(
      elevation: 3,
      child: Container(
        padding: EdgeInsets.all(5),
        child: Row(
          children: [
            Container(
              width: size.width*0.4,
              height: size.height*0.2,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(product.image),
                    fit: BoxFit.fill,
                  )
              ),
            ),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(product.name , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                Text(product.category , style: TextStyle(fontSize: 16 , color: Colors.grey),),
                SizedBox(height: 10,),
                Text('${product.newPrice} LE' , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
                Container(
                    width: size.width*0.45,
                    child: FlatButton(onPressed: (){
                      final instance=Provider.of<CartItem>(context , listen: false);
                      instance.deleteProduct(product);
                      }, child: Text('Remove From Cart') , color: Colors.orange,)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
