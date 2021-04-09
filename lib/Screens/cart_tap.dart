import 'package:aws_task/Models/Product_model.dart';
import 'package:aws_task/Providers/cart_item.dart';
import 'package:aws_task/Screens/home_screen.dart';
import 'package:aws_task/Widgets/cart_card.dart';
import 'package:aws_task/constant.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class CartTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Cart=Provider.of<CartItem>(context);
    final List<Product> products=Cart.cartProducts;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: products.length >= 1 ? Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return CartCard(product: products[index],);
              },
            ),
          ),
          Container(
              width: double.infinity,
              height: 50,
              child: FlatButton(onPressed: (){

                Cart.clearProducts();
                Fluttertoast.showToast(msg: 'Congratulation.. Your order was done' , textColor: Colors.white , backgroundColor: Colors.black , toastLength: Toast.LENGTH_LONG);
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen(),), (route) => false);

                }, child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Confirm' , style: TextStyle(color: Colors.white , fontSize: 20 , fontWeight: FontWeight.bold),),
                  Text(' Total : ${Cart.sumTotal().toString()} LE' , style: TextStyle(color: Colors.white),),
                ],
              ) , color: Colors.green,)),
        ],
      ) : Column(
        children: [
          Expanded(child: Image(image: AssetImage('images/empty.png'),)),
        ],
      ),
    );
  }
}
