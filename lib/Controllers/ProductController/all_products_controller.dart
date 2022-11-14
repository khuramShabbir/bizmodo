import 'package:get/get.dart';
import 'package:hungerz_ordering/Models/ProductsModel/all_products_model.dart';
import 'package:hungerz_ordering/Services/api_services.dart';
import 'package:hungerz_ordering/Services/api_urls.dart';
import 'package:hungerz_ordering/Services/storage_sevices.dart';
import 'package:hungerz_ordering/const.dart';
import 'package:hungerz_ordering/utils.dart';
import 'package:image_picker/image_picker.dart';

class AllProductsController extends GetxController {
  AllProducts? allProducts;
  XFile? xFile;
  RxBool isLoaded = false.obs;
  Rxn<Datum?>? category = Rxn<Datum?>();
  Rxn<Product?>? item = Rxn<Product?>();

  RxList<Product?> itemCartList = <Product>[].obs;

  void addToCart(Product? item) {
    itemCartList.add(item);
  }

  void removeToCart(item) {
    itemCartList.remove(item);
  }

  int getItemsCountInCart(int index) {
    int items = 0;
    try {
      for (var value in allProducts!.data[index].productsList!) {
        if (value.selectQuantity != 0) {
          items++;
        }
      }
      return items;
    } catch (e) {
      return items;
    }
  }

  Future<void> fetchAllProducts() async {
    isLoaded.value = false;
    String response = await ApiServices.getMethod(feedUrl: ApiUrls.allProducts);
    if (response.isEmpty) return;
    await AppStorage.write(AppStorage.products, response);
    getAllProductsFromStorage();
    isLoaded.value = true;
  }

  void getAllProductsFromStorage() async {
    isLoaded.value = false;
    allProducts = allProductsFromJson(AppStorage.read(AppStorage.products));
    isLoaded.value = true;
  }

  Future<bool> createOrder() async {
    Map<String, String> fields = {
      "sells": [
        {
          "location_id": 1,
          "contact_id": 1,
          "transaction_date": "2020-07-22 15:48:29",
          "invoice_no": "quaerat",
          "status": "final",
          "is_quotation": true,
          "tax_rate_id": 4,
          "discount_amount": 10,
          "discount_type": "fixed",
          "sale_note": "recusandae",
          "staff_note": "nulla",
          "commission_agent": 5,
          "shipping_details": "Express Delivery",
          "shipping_address": "laboriosam",
          "shipping_status": "ordered",
          "delivered_to": "'Mr robin'",
          "shipping_charges": 10,
          "packing_charge": 10,
          "exchange_rate": 1,
          "selling_price_group_id": 5,
          "pay_term_number": 3,
          "pay_term_type": "months",
          "is_recurring": 0,
          "recur_interval": 1,
          "recur_interval_type": "months",
          "subscription_repeat_on": 15,
          "subscription_no": "nihil",
          "recur_repetitions": 20,
          "rp_redeemed": 1,
          "rp_redeemed_amount": 13.5,
          "types_of_service_id": 13,
          "service_custom_field_1": "quia",
          "service_custom_field_2": "ullam",
          "service_custom_field_3": "distinctio",
          "service_custom_field_4": "id",
          "round_off_amount": 639.2552,
          "table_id": 1,
          "service_staff_id": 1,
          "change_return": 0,
          "products": [
            {
              "product_id": 17,
              "variation_id": 58,
              "quantity": 1,
              "unit_price": 437.5,
              "tax_rate_id": 0,
              "discount_amount": 0,
              "discount_type": "percentage",
              "sub_unit_id": 11,
              "note": "consectetur"
            }
          ],
          "payments": [
            {
              "amount": 453.13,
              "method": "cash",
              "account_id": 2,
              "card_number": "rerum",
              "card_holder_name": "molestias",
              "card_transaction_number": "est",
              "card_type": "explicabo",
              "card_month": "earum",
              "card_year": "in",
              "card_security": "corrupti",
              "transaction_no_1": "provident",
              "transaction_no_2": "veritatis",
              "transaction_no_3": "dolore",
              "bank_account_number": "suscipit",
              "note": "doloremque",
              "cheque_number": "voluptate"
            }
          ]
        }
      ].toString()
    };

    String response = await ApiServices.postMethod(feedUrl: ApiUrls.createOrder, fields: fields);
    logger.i(response);

    if (response.isEmpty) {
      showToast("Something went wrong");

      return false;
    }

    return true;
  }

  ImagePicker picker = ImagePicker();
  Future<void> getImages() async {
    xFile = null;
    String choice = await AppConst.chooseImageSource();
    if (choice.isEmpty) {
      return;
    } else if (choice == "Camera") {
      xFile = (await picker.pickImage(source: ImageSource.camera, imageQuality: 50));
    } else if (choice == "Gallery") {
      xFile = (await picker.pickImage(source: ImageSource.gallery, imageQuality: 50));
    }
  }
}

class Cart {
  final int id;
  final String name;
  Cart({required this.id, required this.name});
}
