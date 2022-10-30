import 'package:get/get.dart';
import 'package:hungerz_ordering/Models/ProductsModel/all_products_model.dart';
import 'package:hungerz_ordering/Services/api_services.dart';
import 'package:hungerz_ordering/Services/api_urls.dart';

class AllProductsController extends GetxController {
  /// models
  AllProducts? allProducts;

  RxList<Products> itemsInCartList = <Products>[].obs;
  RxBool isLoaded = false.obs;
  RxBool itemSelected = false.obs;
  RxString? img, name;
  RxInt drawerCount = 0.obs;
  RxInt currentIndex = 0.obs;
  int selectedItem = -1.obs;
  void getAllProducts() async {
    isLoaded = false.obs;

    String response = await ApiServices.getMethod(feedUrl: ApiUrls.allProducts);

    if (response.isEmpty) return;

    allProducts = allProductsFromJson(response);
    isLoaded.value = true;
  }
}
