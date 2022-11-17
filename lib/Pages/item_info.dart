import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:bizmodo_emenu/Controllers/ProductController/product_cart_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/Components/custom_circular_button.dart';
import '/Controllers/ProductController/all_products_controller.dart';
import '/Models/ProductsModel/all_products_model.dart';
import '../Theme/colors.dart';

class ItemInfoPage extends StatefulWidget {
  final Product? item;

  ItemInfoPage(this.item);
  @override
  _ItemInfoPageState createState() => _ItemInfoPageState();
}

class _ItemInfoPageState extends State<ItemInfoPage> {
  int selectedModifier = -1;
  final AllProductsController allProductsController = Get.find<AllProductsController>();
  @override
  Widget build(BuildContext context) {
    final isPortrait = Get.mediaQuery.orientation == Orientation.portrait;

    return SafeArea(
      child: Drawer(
        child: FadedSlideAnimation(
          Stack(
            children: [
              // Add on Selection
              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: Get.width,
                  color: Get.theme.backgroundColor,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Item Image
                      Stack(
                        children: [
                          FadedScaleAnimation(
                            Container(
                              width: Get.width,
                              height: Get.height * 0.3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                                image: DecorationImage(
                                  image: NetworkImage(widget.item?.imageUrl ?? ""),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            durationInMilliseconds: 400,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            width: Get.width,
                            height: Get.height * 0.3,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [Get.theme.scaffoldBackgroundColor, transparentColor],
                                  stops: [0.0, 0.5]),
                            ),
                          ),
                        ],
                      ),

                      /// Modifiers
                      Text(
                        "Add On",
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      if (widget.item?.modifier != null)
                        GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: widget.item?.modifier?.length,
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: isPortrait ? 3 : 4,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            final Product? modifier = widget.item?.modifier?[index].productModifier;

                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (selectedModifier == index) {
                                    selectedModifier = -1;
                                  } else {
                                    selectedModifier = index;
                                  }
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: selectedModifier == index
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context).scaffoldBackgroundColor,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: FadedScaleAnimation(
                                        CachedNetworkImage(
                                          imageUrl: modifier?.imageUrl ?? "",
                                          imageBuilder: (context, imageProvider) => Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          placeholder: (context, url) => SizedBox(
                                            width: 10,
                                            height: 10,
                                            child: CircularProgressIndicator(
                                              color: primaryColor,
                                              strokeWidth: 1,
                                            ),
                                          ),
                                          errorWidget: (context, url, error) => Icon(Icons.error),
                                        ),
                                        durationInMilliseconds: 400,
                                      ),
                                    ),
                                    SizedBox(height: 2.5),
                                    Text(modifier?.name ?? ""),
                                  ],
                                ),
                              )
                              /*Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color:
                                          selectedModifier == index ? primaryColor : Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(width: 1, color: Colors.grey)),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          modifier?.productModifier.name ?? "",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Text(
                                          "\$ 1.0",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )*/
                              ,
                            );
                          },
                        )
                    ],
                  ),
                ),
              ),

              // Add to cart button
              Align(
                alignment: Alignment.bottomCenter,
                child: CustomButton(
                  onTap: () {
                    Get.find<ProductCartController>().addToCart(widget.item);
                  },
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  bgColor: Theme.of(context).primaryColor,
                  title: Text(
                    'Add',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16),
                  ),
                  borderRadius: 0,
                ),
              )
            ],
          ),
          beginOffset: Offset(0, 0.3),
          endOffset: Offset(0, 0),
          curve: Curves.linearToEaseOut,
        ),
      ),
    );
  }
}
