import 'package:get/get.dart';
import 'package:hungerz_ordering/Theme/colors.dart';
import 'package:logger/logger.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

Logger logger = Logger();

showToast(String msg) async {
  await Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0);
}

showProgress() {
  Get.defaultDialog(
      title: "",
      content: Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.grey,
            color: primaryColor,
          ),
        ),
      ),
      barrierDismissible: true);
}

stopProgress() {
  if (Get.isDialogOpen!) Get.back();
}
