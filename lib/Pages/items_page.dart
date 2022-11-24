import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/Controllers/ProductController/product_cart_controller.dart';
import '/Models/ProductsModel/all_products_model.dart';
import '/utils.dart';
import 'item_info.dart';

class ItemsPage extends StatefulWidget {
  final CategoryDataModel category;
  ItemsPage({required this.category, Key? key}) : super(key: key);

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  final ProductCartController prodCartCtrlObj = Get.find<ProductCartController>();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  // ProductModel? item;

  @override
  Widget build(BuildContext context) {
    final isPortrait = Get.mediaQuery.orientation == Orientation.portrait;

    return Scaffold(
      key: _scaffoldKey,
      // endDrawer: Obx(
      //   () => prodCartCtrlObj.item != null
      //       ? Drawer(child: ItemInfoPage(prodCartCtrlObj.item!.value!))
      //       : SizedBox(),
      // ),
      body: GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsetsDirectional.only(top: 5, bottom: 5, start: 10, end: 10),
        itemCount: widget.category.products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isPortrait ? 2 : 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          ProductModel item = widget.category.products[index];

          return Card(
            clipBehavior: Clip.hardEdge,
            color: Get.theme.scaffoldBackgroundColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: GestureDetector(
              onTap: () {
                prodCartCtrlObj.item?.value = item;
                if (item.modifier.isNotEmpty) {
                  // _scaffoldKey.currentState!.openEndDrawer();
                  Get.to(() => ItemInfoPage(prodCartCtrlObj.item!.value!));
                } else {
                  prodCartCtrlObj.updateCart(item, isAdd: true);
                }
                setState(() {});
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        // product image
                        FadedScaleAnimation(
                          CachedNetworkImage(
                            imageUrl: item.imageUrl ?? "",
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            placeholder: (context, url) => progressIndicator(width: 10, height: 10),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          ),
                          durationInMilliseconds: 400,
                        ),
                        // product details page button
                        Align(
                          alignment: Alignment.topRight,
                          child: FadedScaleAnimation(
                            InkWell(
                              onTap: () {
                                prodCartCtrlObj.item?.value = item;
                                item = widget.category.products[index];
                                setState(() {});

                                // _scaffoldKey.currentState!.openEndDrawer();
                                Get.to(() => ItemInfoPage(prodCartCtrlObj.item!.value!));
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                height: 20,
                                width: 30,
                                child: Icon(
                                  Icons.info,
                                  color: Colors.grey.shade400,
                                  size: 30,
                                ),
                              ),
                            ),
                            durationInMilliseconds: 400,
                          ),
                        ),
                        // product shade effect if item in cart
                        GetBuilder(
                          builder: (ProductCartController prodCartCtrlObj) {
                            return prodCartCtrlObj.isItemInCart(item.id)
                                ? Opacity(
                                    opacity: 0.8,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.vertical(top: Radius.circular(10)),
                                        gradient: LinearGradient(
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.center,
                                            colors: [
                                              Get.theme.primaryColor,
                                              Colors.transparent,
                                            ],
                                            stops: [
                                              0.2,
                                              0.75,
                                            ]),
                                      ),
                                    ),
                                  )
                                : SizedBox.shrink();
                          },
                        ),
                        // counts of and item if in cart
                        GetBuilder(builder: (ProductCartController prodCartCtrlObj) {
                          return prodCartCtrlObj.isItemInCart(item.id)
                              ? Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          // GestureDetector(
                                          //   onTap: () {
                                          //     if (foodItems[index].count >= 1)
                                          //       setState(() {
                                          //         foodItems[index].count--;
                                          //       });
                                          //   },
                                          //   child: Icon(Icons.remove, color: Colors.white, size: 16),
                                          // ),
                                          // SizedBox(width: 8),
                                          CircleAvatar(
                                            radius: 10,
                                            // backgroundColor: buttonColor,
                                            child: Text(
                                              prodCartCtrlObj.countItemInCart(item.id),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1!
                                                  .copyWith(fontSize: 10, color: Colors.white),
                                            ),
                                          ),
                                          // SizedBox(width: 8),
                                          // GestureDetector(
                                          //   onTap: () {
                                          //     setState(() {
                                          //       foodItems[index].count++;
                                          //     });
                                          //   },
                                          //   child: Icon(Icons.add, color: Colors.white, size: 16),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox.shrink();
                        }),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),

                  /// TODO: need to show the quantity

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      item.name ?? "",
                      style: Get.theme.textTheme.subtitle1!.copyWith(fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                  ),
                  if (item != null && item.variations.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text('\$ ' + "${item.variations.first.sellPriceIncTax}"),
                    ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
