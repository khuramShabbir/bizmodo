import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/Controllers/ProductController/product_cart_controller.dart';
import '/Models/ProductsModel/all_products_model.dart';
import '/Pages/item_info.dart';
import '/Theme/colors.dart';

class ItemsPage extends StatefulWidget {
  final Datum? category;
  ItemsPage({required this.category, Key? key}) : super(key: key);

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  final ProductCartController prodCartCtrlObj = Get.find<ProductCartController>();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Product? item;

  @override
  Widget build(BuildContext context) {
    final isPortrait = Get.mediaQuery.orientation == Orientation.portrait;

    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Drawer(
        child: ItemInfoPage(prodCartCtrlObj.item?.value),
      ),
      body: GridView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsetsDirectional.only(top: 16, bottom: 16, start: 16, end: 32),
          itemCount: widget.category?.productsList?.length ?? 0,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isPortrait ? 2 : 4,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.75),
          itemBuilder: (context, index) {
            Product? item = widget.category?.productsList?[index];

            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 22,
                    child: GestureDetector(
                      onTap: () {
                        prodCartCtrlObj.addToCart(item);
                        prodCartCtrlObj.item?.value = item;
                        if (item!.modifier != null && item!.modifier!.isNotEmpty) {
                          _scaffoldKey.currentState!.openEndDrawer();
                        }
                        setState(() {});
                      },
                      child: Stack(
                        children: [
                          FadedScaleAnimation(
                            CachedNetworkImage(
                              imageUrl: item?.imageUrl ?? "",
                              imageBuilder: (context, imageProvider) => Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              placeholder: (context, url) => Center(
                                  child: SizedBox(
                                      width: 10,
                                      height: 10,
                                      child: CircularProgressIndicator(
                                          color: primaryColor, strokeWidth: 1))),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
                            durationInMilliseconds: 400,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: FadedScaleAnimation(
                              InkWell(
                                onTap: () {
                                  prodCartCtrlObj.item?.value = item;
                                  item = widget.category!.productsList![index];
                                  setState(() {});

                                  _scaffoldKey.currentState!.openEndDrawer();
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  height: 20,
                                  width: 30,
                                  child: Icon(
                                    Icons.view_comfy_alt_rounded,
                                    color: Colors.grey.shade400,
                                    size: 30,
                                  ),
                                ),
                              ),
                              durationInMilliseconds: 400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      item?.name ?? "",
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('\$ ' + "${item?.variations?.first.sellPriceIncTax}"),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
