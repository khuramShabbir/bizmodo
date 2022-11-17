import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/Components/custom_circular_button.dart';
import '/Components/single_selection_chip.dart';
import '/Components/textfield.dart';
import '/Controllers/order_type_controller.dart';
import '/Pages/table_selection.dart';

class OrderTypeSelection extends StatelessWidget {
  OrderTypeSelection({Key? key}) : super(key: key);
  final OrderTypeSelectionController orderCtrl = Get.find<OrderTypeSelectionController>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final isPortrait = Get.mediaQuery.orientation == Orientation.portrait;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   icon: Icon(Icons.arrow_back, color: Colors.black),
        // ),
        title: FadedScaleAnimation(
          RichText(
              text: TextSpan(
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(letterSpacing: 1, fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                TextSpan(
                  text: 'BizModo',
                  style: TextStyle(fontSize: isPortrait ? 12 : 16),
                ),
                TextSpan(
                  text: ' eMenu',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: isPortrait ? 12 : 16),
                ),
              ])),
          durationInMilliseconds: 400,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Obx(() {
            return SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Select Order Type,".obs.value,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 20),
                    SingleSelectionChip(
                        chipsDataList: orderCtrl.chipData,
                        valueChanged: (String? v) {
                          orderCtrl.orderValue.value = v!;
                          if (orderCtrl.orderValue.value == orderCtrl.chipData[0])
                            Get.to(() => TableSelectionPage());
                        }),
                    SizedBox(height: 20),
                    if (orderCtrl.orderValue.value == orderCtrl.chipData[1])
                      Column(
                        children: [
                          formField(
                            text: "Name",
                            validator: (String? v) {
                              if (v!.isEmpty)
                                return "*field required";
                              else
                                return null;
                            },
                            controller: orderCtrl.nameCtrl,
                          ),
                          formField(
                            validator: (String? v) {
                              if (v!.isEmpty)
                                return "*field required";
                              else
                                return null;
                            },
                            text: "Mobile",
                            controller: orderCtrl.mobileNumberCtrl,
                          ),
                          formField(
                            validator: (String? v) {
                              if (v!.isEmpty)
                                return "*field required";
                              else
                                return null;
                            },
                            text: "Identity",
                            controller: orderCtrl.identityCtrl,
                          ),
                        ],
                      ),
                    if (orderCtrl.orderValue.value == orderCtrl.chipData[2])
                      Column(
                        children: [
                          formField(
                            validator: (String? v) {
                              if (v!.isEmpty)
                                return "*field required";
                              else
                                return null;
                            },
                            text: "Name",
                            controller: orderCtrl.nameCtrl,
                          ),
                          formField(
                            validator: (String? v) {
                              if (v!.isEmpty)
                                return "*field required";
                              else
                                return null;
                            },
                            text: "Mobile",
                            controller: orderCtrl.mobileNumberCtrl,
                          ),
                          formField(
                            // validator: (String? v) {
                            //   if (v!.isEmpty)
                            //     return "*field required";
                            //   else
                            //     return null;
                            // },
                            text: "Identity",
                            controller: orderCtrl.identityCtrl,
                          ),
                          formField(
                            validator: (String? v) {
                              if (v!.isEmpty)
                                return "*field required";
                              else
                                return null;
                            },
                            text: "Location",
                            controller: orderCtrl.identityCtrl,
                          ),
                          formField(
                            validator: (String? v) {
                              if (v!.isEmpty)
                                return "*field required";
                              else
                                return null;
                            },
                            text: "Address",
                            controller: orderCtrl.identityCtrl,
                          ),
                        ],
                      ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        if (orderCtrl.orderValue.value == orderCtrl.chipData[1] ||
                            orderCtrl.orderValue.value == orderCtrl.chipData[2])
                          Expanded(
                            child: CustomButton(
                              borderRadius: 10,
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) {
                                        return TableSelectionPage();
                                      },
                                    ),
                                  );
                                }
                              },
                              title: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  "Submit",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        if (orderCtrl.orderValue.value == orderCtrl.chipData[1] ||
                            orderCtrl.orderValue.value == orderCtrl.chipData[2])
                          SizedBox(width: 30),
                        Expanded(
                          child: CustomButton(
                            borderRadius: 10,
                            onTap: () {},
                            title: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                "Orders",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget formField({
    required String text,
    required TextEditingController controller,
    final FormFieldValidator<String>? validator,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Container(
        color: Colors.grey.withOpacity(.2),
        width: Get.width * .7,
        child: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: AppFormField(
            validator: validator,
            controller: controller,
            title: text,
          ),
        ),
      ),
    );
  }
}
