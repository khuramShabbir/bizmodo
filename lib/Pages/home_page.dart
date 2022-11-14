import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungerz_ordering/Components/custom_circular_button.dart';
import 'package:hungerz_ordering/Controllers/ProductController/all_products_controller.dart';
import 'package:hungerz_ordering/Locale/locales.dart';
import 'package:hungerz_ordering/Pages/item_info.dart';
import 'package:hungerz_ordering/Pages/items_page.dart';
import 'package:hungerz_ordering/Pages/orderPlaced.dart';
import 'package:hungerz_ordering/Services/storage_sevices.dart';
import 'package:hungerz_ordering/Theme/colors.dart';
import 'package:hungerz_ordering/utils.dart';

import '../Models/ProductsModel/all_products_model.dart';

class HomePage extends StatefulWidget {
  final int? index;
  HomePage(this.index);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int drawerCount = 0;
  int currentIndex = 0;
  PageController _pageController = PageController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  AllProductsController allProductsController = Get.find<AllProductsController>();

  @override
  void initState() {
    if (!AppStorage.box.hasData(AppStorage.products)) {
      allProductsController.fetchAllProducts();
    } else {
      allProductsController.getAllProductsFromStorage();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Drawer(
        child: SafeArea(
          child: Stack(
            children: [
              ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                        child: Text(
                          locale.tableNo! + '${widget.index}',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Spacer(),
                      buildItemsInCartButton(context),
                    ],
                  ),
                  Obx(() {
                    return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.only(bottom: 150),
                        itemCount: allProductsController.itemCartList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          Product? product = allProductsController.itemCartList[index];

                          return Column(
                            children: [
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                                leading: GestureDetector(
                                  onTap: () {
                                    if (allProductsController.item != null)
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ItemInfoPage(allProductsController.item!.value)));
                                  },
                                  child: FadedScaleAnimation(
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: FadedScaleAnimation(
                                          CachedNetworkImage(
                                            imageUrl: product?.imageUrl ?? "",
                                          ),
                                          durationInMilliseconds: 400,
                                        )),
                                    durationInMilliseconds: 400,
                                  ),
                                ),
                                title: Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        product?.name ?? "",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .copyWith(fontSize: 14),
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
                                              border: Border.all(color: newOrderColor, width: 0.2)),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              GestureDetector(
                                                  onTap: () {
                                                    if (product!.selectQuantity > 0) {
                                                      product.selectQuantity--;
                                                      logger.i(product.selectQuantity);
                                                      setState(() {});
                                                    }
                                                  },
                                                  child: Icon(
                                                    Icons.remove,
                                                    color: newOrderColor,
                                                    size: 16,
                                                  )),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                product!.selectQuantity.toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1!
                                                    .copyWith(fontSize: 12),
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              GestureDetector(
                                                  onTap: () {
                                                    if (product.selectQuantity != 0) {
                                                      product.selectQuantity++;
                                                      logger.i(product.selectQuantity);
                                                      setState(() {});
                                                    }
                                                  },
                                                  child: Icon(
                                                    Icons.add,
                                                    color: newOrderColor,
                                                    size: 16,
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          '\$' +
                                              totalAmount(
                                                  qty: product.selectQuantity,
                                                  price: product.variations!.first.sellPriceIncTax),
                                          style: TextStyle(color: Colors.black),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // SizedBox(height: 200,),
                            ],
                          );
                        });
                  })
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        tileColor: Theme.of(context).backgroundColor,
                        title: Text(locale.totalAmount!,
                            style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 14)),
                        trailing: Text(
                          '\$' + '74.00',
                          style: Theme.of(context).textTheme.subtitle1,
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
                        bgColor: Theme.of(context).primaryColor,
                        title: Text(
                          locale.finishOrdering!,
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16),
                        ),
                        borderRadius: 0,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: FadedScaleAnimation(
          GestureDetector(
            onTap: () async {
              await allProductsController.fetchAllProducts();
            },
            child: Row(
              children: [
                SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.asset("assets/appIcon.png"),
                ),
                RichText(
                  text: TextSpan(
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(letterSpacing: 1, fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'eMENU', style: TextStyle(color: Theme.of(context).primaryColor)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          durationInMilliseconds: 400,
        ),
        actions: [
          Container(
              width: isPortrait ? 120 : 300,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 4),
              child: TextFormField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: locale.searchItem,
                    contentPadding: EdgeInsets.symmetric(vertical: 0),
                    filled: true,
                    fillColor: Theme.of(context).backgroundColor,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none, borderRadius: BorderRadius.circular(40))),
              )),
          buildItemsInCartButton(context)
        ],
      ),
      body: Obx(
        () => allProductsController.isLoaded.value
            ? Container(
                color: Theme.of(context).backgroundColor,
                child: Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: allProductsController.allProducts?.data.length ?? 0,
                          itemBuilder: (context, index) {
                            Datum? category = allProductsController.allProducts?.data[index];
                            Future.delayed(Duration.zero, () {
                              if (allProductsController.category?.value == null) {
                                allProductsController.category?.value = category!;
                              }
                            });
                            return InkWell(
                              onLongPress: () async {
                                // await allProductsController.getImages();
                              },
                              onTap: () {
                                setState(() {
                                  currentIndex = index;
                                });
                                allProductsController.category?.value = category!;
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: currentIndex == index
                                        ? Theme.of(context).primaryColor
                                        : Theme.of(context).scaffoldBackgroundColor,
                                  ),
                                  child: Column(
                                    children: [
                                      FadedScaleAnimation(
                                        CachedNetworkImage(
                                          imageUrl: category?.productsList?.first.imageUrl ?? "",
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
                                      Text(
                                        category?.name ?? "".toUpperCase(),
                                        style: TextStyle(
                                            color:
                                                currentIndex == index ? Colors.white : Colors.black,
                                            fontSize: 12),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    Expanded(
                      child: PageView(
                        physics: BouncingScrollPhysics(),
                        controller: _pageController,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        children: [
                          ItemsPage(
                            category: allProductsController.category?.value,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  Widget buildItemsInCartButton(BuildContext context) {
    return Obx(() {
      return CustomButton(
        onTap: () {
          if (allProductsController.itemCartList.isNotEmpty) {
            _scaffoldKey.currentState!.openEndDrawer();
          }
        },
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        title: Text(
          "Item in cart (${allProductsController.itemCartList.length.toString()})",
          style: Theme.of(context).textTheme.bodyText1,
        ),
        bgColor: allProductsController.itemCartList.isNotEmpty ? buttonColor : Colors.grey[600],
      );
    });
  }

  String totalAmount({required int qty, required String price}) {
    return (double.parse(qty.toString()) * double.parse(price.toString())).toString();
  }
}
