import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hungerz_ordering/Models/ProductsModel/all_products_model.dart';

import '../Theme/colors.dart';

class ItemInfoPage extends StatefulWidget {
  final Product? item;

  ItemInfoPage(this.item);
  @override
  _ItemInfoPageState createState() => _ItemInfoPageState();
}

class _ItemInfoPageState extends State<ItemInfoPage> {
  int selectedModifier = -1;
  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return SafeArea(
      child: Drawer(
        child: FadedSlideAnimation(
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).backgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Item Image
                      Stack(
                        children: [
                          FadedScaleAnimation(
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.3,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                                  image: DecorationImage(
                                      image: NetworkImage(widget.item?.imageUrl ?? ""),
                                      fit: BoxFit.cover)),
                            ),
                            durationInMilliseconds: 400,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.3,
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
                            crossAxisCount: isPortrait ? 2 : 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 1,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            final Product? modifier = widget.item?.modifier?[index].productModifier;

                            return GestureDetector(
                              onTap: () {
                                if (selectedModifier == index) {
                                  selectedModifier == -1;
                                } else {
                                  selectedModifier = index;
                                }
                                setState(() {});
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: selectedModifier == index
                                        ? Theme.of(context).primaryColor
                                        : Theme.of(context).scaffoldBackgroundColor,
                                  ),
                                  child: Column(
                                    children: [
                                      FadedScaleAnimation(
                                        CachedNetworkImage(
                                          imageUrl: modifier?.imageUrl ?? "",
                                          imageBuilder: (context, imageProvider) => Container(
                                            height: 70,
                                            width: 90,
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
                                                color: primaryColor, strokeWidth: 1),
                                          ),
                                          errorWidget: (context, url, error) => Icon(Icons.error),
                                        ),
                                        durationInMilliseconds: 400,
                                      ),
                                      Text(modifier?.name ?? ""),
                                      Spacer(),
                                    ],
                                  ),
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
                ],
              ),
            ),
          ),
          beginOffset: Offset(0, 0.3),
          endOffset: Offset(0, 0),
          curve: Curves.linearToEaseOut,
        ),
      ),
    );
  }
}
