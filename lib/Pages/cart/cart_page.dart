import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/Components/custom_circular_button.dart';
import '/Controllers/ProductController/product_cart_controller.dart';
import '/Locale/locales.dart';
import '/Models/ProductsModel/all_products_model.dart';
import '/Pages/item_info.dart';
import '/Pages/orderPlaced.dart';
import '/Theme/colors.dart';
import '/utils.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          // List of cart items
          ListView(
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
              //       child: Text(
              //         locale.tableNo! + ' ${widget.index}',
              //         style: Get.theme.textTheme.subtitle1!.copyWith(
              //           fontSize: 14,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //     ),
              //     // buildItemsInCartButton(),
              //   ],
              // ),
              GetBuilder<ProductCartController>(builder: (ProductCartController prodCartCtrlObj) {
                return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.only(bottom: 150),
                    itemCount: prodCartCtrlObj.itemCartList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      ProductModel product = prodCartCtrlObj.itemCartList[index];

                      return ListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                        leading: GestureDetector(
                          onTap: () {
                            if (prodCartCtrlObj.item != null) {
                              Get.to(() => ItemInfoPage(prodCartCtrlObj.item!.value!));
                            }
                          },
                          child: FadedScaleAnimation(
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: FadedScaleAnimation(
                                CachedNetworkImage(
                                  imageUrl: '${product.imageUrl}',
                                ),
                                durationInMilliseconds: 400,
                              ),
                            ),
                            durationInMilliseconds: 400,
                          ),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                product.name ?? "",
                                style: Get.theme.textTheme.subtitle1!.copyWith(fontSize: 14),
                              ),
                              SizedBox(width: 8),
                            ],
                          ),
                        ),
                        subtitle: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: newOrderColor, width: 0.2),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          prodCartCtrlObj.removeToCart(product);
                                          if (product.quantity > 0) {
                                            product.quantity--;
                                            logger.i(product.quantity);
                                            prodCartCtrlObj.update();
                                          }
                                        },
                                        child: Icon(
                                          Icons.remove,
                                          color: newOrderColor,
                                          size: 16,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        '${product.quantity}',
                                        style:
                                            Get.theme.textTheme.subtitle1!.copyWith(fontSize: 12),
                                      ),
                                      SizedBox(width: 8),
                                      GestureDetector(
                                        onTap: () {
                                          if (product.quantity != 0) {
                                            product.quantity++;
                                            logger.i(product.quantity);
                                            prodCartCtrlObj.update();
                                          }
                                        },
                                        child: Icon(
                                          Icons.add,
                                          color: newOrderColor,
                                          size: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                if (product.variations.isNotEmpty)
                                  Text(
                                    '\$' +
                                        totalAmount(
                                          qty: product.quantity,
                                          price: '${product.variations.first.sellPriceIncTax}',
                                        ),
                                    style: TextStyle(color: Colors.black),
                                  )
                              ],
                            ),
                          ],
                        ),
                      );
                    });
              }),
            ],
          ),

          // Total Price
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    tileColor: Get.theme.backgroundColor,
                    title: Text(
                      locale.totalAmount!,
                      style: Get.theme.textTheme.subtitle1!.copyWith(fontSize: 14),
                    ),
                    trailing: Text(
                      '\$' + '74.00',
                      style: Get.theme.textTheme.subtitle1,
                    ),
                  ),
                  CustomButton(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => OrderPlaced()));
                      // Navigator.pop(context);
                      // showDialog(
                      //   context: context,
                      //   builder: (BuildContext context) =>
                      //       _buildAboutDialog(context),
                      // );
                    },
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    bgColor: Get.theme.primaryColor,
                    title: Text(
                      locale.finishOrdering!,
                      style: Get.theme.textTheme.bodyText1!.copyWith(fontSize: 16),
                    ),
                    borderRadius: 0,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  String totalAmount({required int qty, required String price}) {
    return (double.parse(qty.toString()) * double.parse(price.toString())).toString();
  }
}
