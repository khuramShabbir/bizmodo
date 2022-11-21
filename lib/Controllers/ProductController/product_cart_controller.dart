import 'package:get/get.dart';

import '/Controllers/ProductController/all_products_controller.dart';
import '/Models/ProductsModel/all_products_model.dart';

class ProductCartController extends GetxController {
  final AllProductsController allProdCtrlObj = Get.find<AllProductsController>();

  Rxn<ProductModel>? item = Rxn<ProductModel>();
  List<ProductModel> itemCartList = [];

  void addToCart(ProductModel? _item) {
    if (_item != null) {
      itemCartList.addIf(!itemCartList.contains(_item), _item);
      update();
    }
  }

  void removeToCart(item) {
    itemCartList.remove(item);
    update();
  }
}
