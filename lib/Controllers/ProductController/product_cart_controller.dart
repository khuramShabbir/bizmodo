import 'package:get/get.dart';

import '/Controllers/ProductController/all_products_controller.dart';
import '/Models/ProductsModel/all_products_model.dart';

class ProductCartController extends GetxController {
  final AllProductsController allProdCtrlObj = Get.find<AllProductsController>();

  Rxn<Product?>? item = Rxn<Product?>();
  RxList<Product?> itemCartList = <Product>[].obs;

  void addToCart(Product? _item) {
    itemCartList.addIf(!itemCartList.contains(_item), _item);
  }

  void removeToCart(item) {
    itemCartList.remove(item);
  }

  int getItemsCountInCart(int index) {
    int items = 0;
    try {
      for (var value in allProdCtrlObj.allProducts!.data[index].productsList!) {
        if (value.selectQuantity != 0) {
          items++;
        }
      }
      return items;
    } catch (e) {
      return items;
    }
  }
}
