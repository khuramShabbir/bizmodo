import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungerz_ordering/Components/custom_circular_button.dart';
import 'package:hungerz_ordering/Controllers/ProductController/all_products_controller.dart';
import 'package:hungerz_ordering/Models/ProductsModel/all_products_model.dart';

import '../Locale/locales.dart';
import '../Theme/colors.dart';

class ItemInfoPage extends StatefulWidget {
  final Product? product;

  ItemInfoPage(this.product);
  @override
  _ItemInfoPageState createState() => _ItemInfoPageState();
}

class _ItemInfoPageState extends State<ItemInfoPage> {
  final AllProductsController allProductsCtrl = Get.find<AllProductsController>();

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return SafeArea(
      child: Drawer(
        child: widget.product != null
            ? FadedSlideAnimation(
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width,
                    color: Theme.of(context).backgroundColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  width: Get.width * .3,
                                  child: buildItemsInCartButton(context),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Stack(
                              children: [
                                FadedScaleAnimation(
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height * 0.5,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.vertical(top: Radius.circular(8)),
                                        image: DecorationImage(
                                            image: NetworkImage(widget.product!.imageUrl ?? ""),
                                            fit: BoxFit.cover)),
                                  ),
                                  durationInMilliseconds: 400,
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height * 0.5,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                          Theme.of(context).scaffoldBackgroundColor,
                                          transparentColor
                                        ],
                                        stops: [
                                          0.0,
                                          0.5
                                        ]),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.only(left: 15, right: 15, top: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
                                color: Theme.of(context).scaffoldBackgroundColor,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.product!.name!,
                                    style: Theme.of(context).textTheme.subtitle1,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        locale.fastFood!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(height: 1.8),
                                      ),
                                      Spacer(),
                                      Text(
                                        '\$12.00',
                                        style: Theme.of(context).textTheme.bodyText2,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(locale.addOptions!,
                                      style: Theme.of(context).textTheme.caption!.copyWith(
                                          fontWeight: FontWeight.w500, letterSpacing: 1.5)),
                                  buildAddOption(context, 'Extra Cheese', '\$5.00'),
                                  buildAddOption(context, 'Extra Honey', '\$3.00'),
                                  buildAddOption(context, 'Extra Mayonnaise', '\$4.00'),
                                  SizedBox(height: 20),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // ++widget.product!.selectQuantity.value;
                              },
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
                                    color: Theme.of(context).primaryColor),
                                width: MediaQuery.of(context).size.width,
                                child: Center(
                                  child: Text(
                                    locale.addToCart!,
                                    style: Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                beginOffset: Offset(0, 0.3),
                endOffset: Offset(0, 0),
                curve: Curves.linearToEaseOut,
              )
            : null,
      ),
    );
  }

  Container buildAddOption(
    BuildContext context,
    String title,
    String price,
  ) {
    bool? val = title == 'Extra Cheese' ? true : false;
    return Container(
      height: 30,
      child: Row(
        children: [
          Transform.scale(
              scale: 0.7,
              child: Checkbox(
                activeColor: Theme.of(context).primaryColor,
                checkColor: Theme.of(context).scaffoldBackgroundColor,
                value: val,
                onChanged: (bool? value) {
                  setState(() {
                    val = value;
                  });
                },
              )),
          Text(
            title,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 14),
          ),
          Spacer(),
          Text(price)
        ],
      ),
    );
  }

  CustomButton buildItemsInCartButton(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return CustomButton(
      onTap: () {},
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      title: Obx(() {
        return Text(
          "${locale.itemsInCart!} ( ${allProductsCtrl.getItemsCountInCart()})",
          style: Theme.of(context).textTheme.bodyText1,
        );
      }),
      bgColor: buttonColor,
    );
  }
}
