import 'package:get/get.dart';
import 'package:hungerz_ordering/Config/app_config.dart';
import 'package:hungerz_ordering/Models/ProductsModel/all_products_model.dart';
import 'package:hungerz_ordering/Services/api_services.dart';
import 'package:hungerz_ordering/Services/api_urls.dart';
import 'package:hungerz_ordering/const.dart';
import 'package:hungerz_ordering/utils.dart';

class AllProductsController extends GetxController {
  /// models
  AllProducts? allProducts;

  RxBool isLoaded = false.obs;
  RxBool itemSelected = false.obs;
  RxString? img, name;
  RxInt drawerCount = 0.obs;
  RxInt currentIndex = 0.obs;
  int selectedItem = -1.obs;

  Map<String, dynamic> prodToMap = <String, dynamic>{};

  void addCartToMap({
    required String key,
    required dynamic products,
  }) {
    AppConst.updateMapValues(map: prodToMap, key: key, value: products);
  }

  void getAllProducts() async {
    isLoaded = false.obs;

    String response = await ApiServices.getMethod(feedUrl: ApiUrls.allProducts);

    if (response.isEmpty) return;

    allProducts = allProductsFromJson(response);
    isLoaded.value = true;
  }
}
