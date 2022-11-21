import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/Components/custom_circular_button.dart';
import '/Components/multi_selection_chip.dart';
import '/Controllers/ProductController/all_products_controller.dart';
import '/Controllers/ProductController/product_cart_controller.dart';
import '/Models/ProductsModel/all_products_model.dart';
import '/utils.dart';

class ItemInfoPage extends StatefulWidget {
  final ProductModel item;

  ItemInfoPage(this.item);
  @override
  _ItemInfoPageState createState() => _ItemInfoPageState();
}

class _ItemInfoPageState extends State<ItemInfoPage> {
  final AllProductsController allProductsController = Get.find<AllProductsController>();

  List<ProductModel> selectedProductModifiersAndVariations = [];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: FadedSlideAnimation(
          Stack(
            children: [
              CustomScrollView(
                slivers: [
                  /// Item Image
                  SliverAppBar(
                    expandedHeight: Get.height * 0.3,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      background: FadedScaleAnimation(
                        Container(
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                            image: DecorationImage(
                              image: NetworkImage(widget.item.imageUrl ?? ""),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        durationInMilliseconds: 400,
                      ),
                      titlePadding: const EdgeInsets.symmetric(horizontal: 20),
                    ),
                  ),

                  /// Item Description
                  if (widget.item.productDescription != null)
                    SliverPadding(
                      padding: const EdgeInsets.all(15),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            Text('Description'),
                            Text('${widget.item.productDescription}'),
                          ],
                        ),
                      ),
                    ),

                  /// Modifiers
                  SliverPadding(
                    padding: const EdgeInsets.all(15),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: widget.item.modifier.length,
                            itemBuilder: (context, _modifierIndex) {
                              final ProductModel _modifier =
                                  widget.item.modifier[_modifierIndex].productModifier;

                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FadedScaleAnimation(
                                    CachedNetworkImage(
                                      imageUrl: _modifier.imageUrl ?? "",
                                      imageBuilder: (context, imageProvider) => Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      placeholder: (context, url) =>
                                          progressIndicator(width: 10, height: 10),
                                      errorWidget: (context, url, error) => Icon(Icons.error),
                                    ),
                                    durationInMilliseconds: 400,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Text(
                                          "${_modifier.name.capitalize}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        if (_modifier.variations.isNotEmpty)
                                          MultiSelectChip/*<VariationModel>*/(
                                            initChoices: <VariationModel>[],
                                            chipsDataList: _modifier.variations,
                                            onSelectionChanged: (value) {
                                              for (var itr in value) {
                                                debugPrint('${value.length}');
                                              }
                                              // selectedProductModifiersAndVariations.();
                                            },
                                            // itemTitle: (item) => '${item.name}',
                                            // itemQuantity: (item) => '',
                                          ),
                                        // GridView.builder(
                                        //   shrinkWrap: true,
                                        //   physics: const NeverScrollableScrollPhysics(),
                                        //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        //     crossAxisCount: isPortrait ? 3 : 4,
                                        //     crossAxisSpacing: 10,
                                        //     mainAxisSpacing: 10,
                                        //   ),
                                        //   itemCount: _modifier.variations.length,
                                        //   itemBuilder: (context, variationIndex) {
                                        //     final VariationModel? _variation =
                                        //         _modifier.variations[variationIndex];
                                        //
                                        //     return GestureDetector(
                                        //       onTap: () {
                                        //         // setState(() {
                                        //         //   if (selectedModifier == index) {
                                        //         //     selectedModifier = -1;
                                        //         //   } else {
                                        //         //     selectedModifier = index;
                                        //         //   }
                                        //         // });
                                        //       },
                                        //       child: Container(
                                        //         padding: const EdgeInsets.all(5.0),
                                        //         decoration: BoxDecoration(
                                        //           borderRadius: BorderRadius.circular(8),
                                        //           // color: selectedModifier == index
                                        //           //     ? Theme.of(context).primaryColor
                                        //           //     : Theme.of(context).scaffoldBackgroundColor,
                                        //         ),
                                        //         child: Text('${_variation?.name}'),
                                        //       ),
                                        //     );
                                        //   },
                                        // ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                          // Text(
                          //   "Add On",
                          //   style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                          // ),
                          // if (widget.item.modifier.isNotEmpty)
                          //   GridView.builder(
                          //     physics: NeverScrollableScrollPhysics(),
                          //     itemCount: widget.item.modifier.length,
                          //     shrinkWrap: true,
                          //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          //       crossAxisCount: isPortrait ? 3 : 4,
                          //       crossAxisSpacing: 10,
                          //       mainAxisSpacing: 10,
                          //     ),
                          //     itemBuilder: (BuildContext context, int index) {
                          //       final ProductModel? modifier =
                          //           widget.item.modifier[index].productModifier;
                          //
                          //       return GestureDetector(
                          //         onTap: () {
                          //           setState(() {
                          //             if (selectedModifier == index) {
                          //               selectedModifier = -1;
                          //             } else {
                          //               selectedModifier = index;
                          //             }
                          //           });
                          //         },
                          //         child: Container(
                          //           padding: const EdgeInsets.all(5.0),
                          //           decoration: BoxDecoration(
                          //             borderRadius: BorderRadius.circular(8),
                          //             color: selectedModifier == index
                          //                 ? Theme.of(context).primaryColor
                          //                 : Theme.of(context).scaffoldBackgroundColor,
                          //           ),
                          //           child: Column(
                          //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //             children: [
                          //               Expanded(
                          //                 child: FadedScaleAnimation(
                          //                   CachedNetworkImage(
                          //                     imageUrl: modifier?.imageUrl ?? "",
                          //                     imageBuilder: (context, imageProvider) => Container(
                          //                       decoration: BoxDecoration(
                          //                         image: DecorationImage(
                          //                           image: imageProvider,
                          //                           fit: BoxFit.cover,
                          //                         ),
                          //                       ),
                          //                     ),
                          //                     placeholder: (context, url) => SizedBox(
                          //                       width: 10,
                          //                       height: 10,
                          //                       child: CircularProgressIndicator(
                          //                         color: primaryColor,
                          //                         strokeWidth: 1,
                          //                       ),
                          //                     ),
                          //                     errorWidget: (context, url, error) => Icon(Icons.error),
                          //                   ),
                          //                   durationInMilliseconds: 400,
                          //                 ),
                          //               ),
                          //               SizedBox(height: 2.5),
                          //               Text(modifier?.name ?? ""),
                          //             ],
                          //           ),
                          //         )
                          //         /*Padding(
                          //           padding: const EdgeInsets.all(8.0),
                          //           child: Container(
                          //             decoration: BoxDecoration(
                          //                 color:
                          //                     selectedModifier == index ? primaryColor : Colors.white,
                          //                 borderRadius: BorderRadius.circular(10),
                          //                 border: Border.all(width: 1, color: Colors.grey)),
                          //             child: Padding(
                          //               padding:
                          //                   const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                          //               child: Column(
                          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //                 children: [
                          //                   Text(
                          //                     modifier?.productModifier.name ?? "",
                          //                     style: TextStyle(color: Colors.grey),
                          //                   ),
                          //                   Text(
                          //                     "\$ 1.0",
                          //                     style: TextStyle(color: Colors.grey),
                          //                   ),
                          //                 ],
                          //               ),
                          //             ),
                          //           ),
                          //         )*/
                          //         ,
                          //       );
                          //     },
                          //   ),
                        ],
                      ),
                    ),
                  ),
                ],
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
              ),
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
