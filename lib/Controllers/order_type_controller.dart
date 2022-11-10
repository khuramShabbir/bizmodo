import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OrderTypeSelectionController extends GetxController {
  RxString orderValue = "".obs;
  RxList<String> chipData = <String>[
    "Dine In",
    "Take Away",
    "Delivery",
  ].obs;
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController mobileNumberCtrl = TextEditingController();
  TextEditingController identityCtrl = TextEditingController();
  TextEditingController locationCtrl = TextEditingController();
  TextEditingController addressCtrl = TextEditingController();
}
