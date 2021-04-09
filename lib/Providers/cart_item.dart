import 'package:aws_task/Models/Product_model.dart';
import 'package:flutter/cupertino.dart';

class CartItem extends ChangeNotifier {
  List<Product> cartProducts=[];

  addProduct(Product pro)
  {
    cartProducts.add(pro);
    notifyListeners();
  }
  deleteProduct(Product pro)
  {
    cartProducts.remove(pro);
    notifyListeners();
  }

  double sumTotal()
  {
    double sum=0 ;
    for(var pro in cartProducts)
    {
      sum+=pro.newPrice;
    }
    return sum;
  }
  clearProducts(){
    cartProducts.clear();
    cartProducts=[];
    notifyListeners();
  }
}