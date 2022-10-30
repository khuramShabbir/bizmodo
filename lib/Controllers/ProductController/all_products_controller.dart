import 'package:get/get.dart';
import 'package:hungerz_ordering/Models/ProductsModel/all_products_model.dart';
import 'package:hungerz_ordering/Services/api_services.dart';
import 'package:hungerz_ordering/Services/api_urls.dart';

class AllProductsController extends GetxController {
  /// models
  Rx<AllProducts>? allProducts;

  void getAllProducts() async {
    String response = await ApiServices.getMethod(feedUrl: ApiUrls.allProducts);

    if (response.isEmpty) return;

    allProducts = allProductsFromJson(response).obs;
  }
}
