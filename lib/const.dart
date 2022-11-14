import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungerz_ordering/Components/custom_circular_button.dart';
import 'package:hungerz_ordering/utils.dart';

class AppConst {
  static void updateMapValues({
    required Map<String, dynamic> map,
    required String key,
    required var value,
  }) {
    if (map.containsKey(key)) {
      map.update(key, (v) => value);
    } else {
      map.putIfAbsent(key, () => value);
    }
    logger.i(map);
  }

  /// ImagePicker
  static Future<String> chooseImageSource() async {
    String value = "";
    await Get.bottomSheet(
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: Get.width * .9,
                    child: CustomButton(
                      borderRadius: 10,
                      title: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Camera",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      onTap: () {
                        value = "Camera";

                        if (Get.isBottomSheetOpen!) Get.back();
                        return value;
                      },
                    ),
                  ),
                  SizedBox(
                    width: Get.width * .9,
                    child: dividerLine,
                  ),
                  SizedBox(
                    width: Get.width * .9,
                    child: CustomButton(
                      borderRadius: 10,
                      title: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          "Gallery",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      onTap: () {
                        value = "Gallery";
                        if (Get.isBottomSheetOpen!) Get.back();
                        return value;
                      },
                    ),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
      enableDrag: true,
      isDismissible: false,
    );
    return value;
  }

  /// Divider Line
  static Widget dividerLine = Container(
    height: 1.5,
    color: Colors.grey.withOpacity(.1),
  );
}
