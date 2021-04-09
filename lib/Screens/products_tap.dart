import 'package:aws_task/Models/Product_model.dart';
import 'package:aws_task/Widgets/product_card.dart';
import 'package:aws_task/constant.dart';
import 'package:flutter/material.dart';


class ProductsTap extends StatefulWidget {
  @override
  _ProductsTapState createState() => _ProductsTapState();
}

class _ProductsTapState extends State<ProductsTap> {
  ScrollController _scrollController;
  int start=0;
  int end=10;
  List<Product> productItem=productList.sublist(0,10);
  Future _loadData() async {
    // perform fetching data delay
    await new Future.delayed(new Duration(seconds: 2));
    // update data and loading status
    setState(() {
      if(end < productList.length)
        {
          if(end+10 <= productList.length)
          {
            start=end;
            end=end+10;
            productItem.addAll(productList.sublist(start,end));
          }
          else {
            start=end;
            end=productList.length;
            productItem.addAll(productList.sublist(start,end));
          }
        }
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    _scrollController=ScrollController();
    _scrollController.addListener(_ScrollListner);
    super.initState();
  }
  _ScrollListner() async {
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange)
    {
      await _loadData();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Products'),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: NotificationListener(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${productList.length} Product Found' , style: TextStyle(fontSize: 18 , color: Colors.grey),),
              SizedBox(height: 10,),
              Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: productItem.length,
                    itemBuilder: (context, index) {
                      return ProductCard(product: productItem[index],);
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
