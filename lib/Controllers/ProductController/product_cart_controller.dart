import 'package:get/get.dart';

import '/Controllers/ProductController/all_products_controller.dart';
import '/Models/ProductsModel/all_products_model.dart';

class ProductCartController extends GetxController {
  final AllProductsController allProdCtrlObj = Get.find<AllProductsController>();

  Rxn<ProductModel>? item = Rxn<ProductModel>();
  List<ProductModel> itemCartList = [];

  // TODO: add item as new entry
  void updateCart(ProductModel? _item, {required bool isAdd}) {
    if (_item != null) {
      if (itemCartList.isEmpty) {
        itemCartList.add(_item.copyWith(quantity: 1));
      } else {
        int indexOfItem = itemCartList.indexWhere((prod) => prod.id == _item.id);
        // logger.d('$indexOfItem');
        if (indexOfItem == -1) {
          itemCartList.add(_item.copyWith(quantity: 1));
        } else {
          int previousQuantity = itemCartList[indexOfItem].quantity;
          itemCartList.removeAt(indexOfItem);
          if (isAdd)
            itemCartList.insert(indexOfItem, _item.copyWith(quantity: ++previousQuantity));
          else
            itemCartList.insert(indexOfItem, _item.copyWith(quantity: --previousQuantity));
        }
      }
      update();
    }
  }

  void addItemQuantity(ProductModel cartItem) {
    cartItem.quantity++;
    update();
  }

  void removeItemQuantity(ProductModel cartItem) {
    cartItem.quantity--;
    update();
  }

  void deleteFromCart(ProductModel item) {
    itemCartList.remove(item);
    update();
  }

  bool isItemInCart(int _itemId) {
    return itemCartList.indexWhere((prod) => prod.id == _itemId) != -1;
  }

  String countItemInCart(int _itemId) {
    int totalCount = 0;
    try {
      List<ProductModel> allSameItems = itemCartList.where((prod) => prod.id == _itemId).toList();
      allSameItems.forEach((prod) => totalCount = totalCount + prod.quantity);
      return '$totalCount';
    } catch (_err) {
      return '$totalCount';
    }
  }
}
