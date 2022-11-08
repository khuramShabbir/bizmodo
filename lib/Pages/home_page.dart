import 'dart:convert';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungerz_ordering/Components/custom_circular_button.dart';
import 'package:hungerz_ordering/Controllers/ProductController/all_products_controller.dart';
import 'package:hungerz_ordering/Controllers/TableSelectionController/table_management_controller.dart';
import 'package:hungerz_ordering/Locale/locales.dart';
import 'package:hungerz_ordering/Models/ProductsModel/all_products_model.dart';
import 'package:hungerz_ordering/Models/TableManagemenModel/table_management_model.dart';
import 'package:hungerz_ordering/Pages/item_info.dart';
import 'package:hungerz_ordering/Pages/orderPlaced.dart';
import 'package:hungerz_ordering/Services/storage_sevices.dart';
import 'package:hungerz_ordering/Theme/colors.dart';

import '../utils.dart';

class ItemCategory {
  String image;
  String? name;

  ItemCategory(this.image, this.name);
}

class HomePage extends StatefulWidget {
  final int? index;

  HomePage(this.index);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  AllProductsController allProductsCtrl = Get.find<AllProductsController>();
  TableSelectionController tableCtrl = Get.find<TableSelectionController>();
  int currentIndex = 0;

  @override
  void initState() {
    allProductsCtrl.getAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Drawer(
        child: Drawer(
          child: allProductsCtrl.drawerCount.value == 1
              ? ItemInfoPage(allProductsCtrl.products)
              : SafeArea(
                  child: Stack(
                    children: [
                      ListView(
                        physics: BouncingScrollPhysics(),
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                                child: Text(
                                  locale.tableNo! + ' ${(widget.index! + 1)}',
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
                          ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.only(bottom: 150),
                              itemCount: allProductsCtrl.allProducts == null
                                  ? 0
                                  : allProductsCtrl.allProducts!.data.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final data = allProductsCtrl.allProducts!.data[index];
                                if (data.selectQuantity.value == 0) {
                                  return Container();
                                }
                                return Obx(() {
                                  return Column(
                                    children: [
                                      ListTile(
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                                        leading: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ItemInfoPage(allProductsCtrl.products),
                                              ),
                                            );
                                          },
                                          child: FadedScaleAnimation(
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(8),
                                              child: FadedScaleAnimation(
                                                Image.network(data.imageUrl),
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
                                                data.name,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1!
                                                    .copyWith(fontSize: 14),
                                              ),
                                              SizedBox(width: 8),
                                              FadedScaleAnimation(
                                                Image.asset(
                                                  'assets/ic_veg.png',
                                                  height: 12,
                                                ),
                                                durationInMilliseconds: 400,
                                              ),
                                            ],
                                          ),
                                        ),
                                        subtitle: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 6, horizontal: 6),
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(20),
                                                      border: Border.all(
                                                          color: newOrderColor, width: 0.2)),
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      GestureDetector(
                                                          onTap: () {
                                                            if (allProductsCtrl
                                                                    .allProducts!
                                                                    .data[index]
                                                                    .selectQuantity
                                                                    .value >
                                                                0) {
                                                              --allProductsCtrl.allProducts!
                                                                  .data[index].selectQuantity.value;
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
                                                      Text(allProductsCtrl.allProducts!.data[index]
                                                          .selectQuantity.value
                                                          .toString()),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      GestureDetector(
                                                          onTap: () {
                                                            ++allProductsCtrl.allProducts!
                                                                .data[index].selectQuantity.value;
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
                                                      data.productVariations.first.variations.first
                                                          .sellPriceIncTax,
                                                  style: TextStyle(color: Colors.black),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            index == 0
                                                ? Row(
                                                    children: [
                                                      Text(
                                                        "Extra Cheese",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .subtitle1!
                                                            .copyWith(fontSize: 14),
                                                      ),
                                                      Spacer(),
                                                      Text(
                                                          '\$' +
                                                              data.productVariations.first
                                                                  .variations.first.sellPriceIncTax,
                                                          style: TextStyle(color: Colors.black))
                                                    ],
                                                  )
                                                : SizedBox.shrink()
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(fontSize: 14)),
                                trailing: Text(
                                  '\$' + '74.00',
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ),
                              CustomButton(
                                onTap: () async {
                                  if (allProductsCtrl.getItemsCountInCart() == 0) {
                                    showToast("Please choose an item");
                                    return;
                                  }
                                  Tables data = tableCtrl.tableDetailModel[widget.index!].tables;

                                  data.color = 0xFFFFFF00;
                                  setState(() {});
                                  TableDetail tables = TableDetail(
                                    tables: Tables(
                                      tableId: data.tableId,
                                      color: data.color,
                                      time: null,
                                      available: 'Busy',
                                    ),
                                  );
                                  tableCtrl.tableDetailModel[widget.index!] = tables;
                                  final je = jsonEncode(tableCtrl.tableDetailModel);

                                  await AppStorage.write(AppStorage.tableData, je);
                                  setState(() {});
                                  bool result = await allProductsCtrl.createOrder();
                                  if (result)
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => OrderPlaced(),
                                      ),
                                    );
                                },
                                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                                bgColor: Theme.of(context).primaryColor,
                                title: Text(
                                  locale.finishOrdering!,
                                  style:
                                      Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16),
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
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: FadedScaleAnimation(
          RichText(
              text: TextSpan(
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(letterSpacing: 1, fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                TextSpan(
                  text: 'BIZMODO',
                  style: TextStyle(fontSize: isPortrait ? 12 : 16),
                ),
                TextSpan(
                  text: ' eMENU',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: isPortrait ? 12 : 16),
                ),
              ])),
          durationInMilliseconds: 400,
        ),
        actions: [
          Container(
              width: !isPortrait ? 300 : 150,
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
      //
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: Obx(
          () => Row(
            children: [
              /// TODO:
              if (allProductsCtrl.isLoaded.isTrue)
                Container(
                  width: 90,
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: /*allProductsCtrl.allProducts!.data.length*/ 1,
                      itemBuilder: (context, index) {
                        final Category cat = allProductsCtrl.allProducts!.data[index].category;
                        return InkWell(
                          onTap: () {
                            setState(() {
                              currentIndex = index;
                            });
                            // _pageController.animateToPage(index,
                            //     duration: Duration(milliseconds: 500),
                            //     curve: Curves.linearToEaseOut);
                            // _pageController.animateTo(index.toDouble(), duration: null, curve: null)
                          },
                          child: Container(
                            height: 80,
                            // width: 60,
                            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: currentIndex == index
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).scaffoldBackgroundColor,
                            ),
                            child: Column(
                              children: [
                                Spacer(),
                                FadedScaleAnimation(
                                  Image.asset(
                                    cat.image,
                                    scale: 3.5,
                                  ),
                                  durationInMilliseconds: 400,
                                ),
                                Spacer(),
                                Text(
                                  cat.name.toUpperCase(),
                                  style:
                                      Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 10),
                                ),
                                Spacer(),
                              ],
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
                      allProductsCtrl.currentIndex.value = index;
                    });
                  },
                  children: [
                    Obx(() => allProductsCtrl.isLoaded.isTrue
                        ? itemsPage(isPortrait).obs.value
                        : Center(
                            child: CircularProgressIndicator(
                              color: primaryColor,
                            ),
                          )),
                  ],
                ),
              ),
            ],
          ).obs.value,
        ),
      ),
    );
  }

  Widget buildItemsInCartButton(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Obx(() => CustomButton(
          onTap: () {
            allProductsCtrl.drawerCount.value = 0;

            if (allProductsCtrl.getItemsCountInCart() != 0.obs.value) {
              _scaffoldKey.currentState!.openEndDrawer();
            }
            setState(() {});
          },
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          title: Text(
            locale!.itemsInCart! + ' (${allProductsCtrl.getItemsCountInCart()})',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          bgColor: allProductsCtrl.getItemsCountInCart() != 0 ? buttonColor : Colors.grey[600],
        ).obs.value);
  }

  Widget itemsPage(bool isPortrait) {
    return GridView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsetsDirectional.only(top: 16, bottom: 16, start: 16, end: 32),
        itemCount: allProductsCtrl.allProducts?.data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isPortrait ? 2 : 4,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.75),
        itemBuilder: (context, index) {
          final data = allProductsCtrl.allProducts?.data[index];
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).scaffoldBackgroundColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 22,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (allProductsCtrl.selectedItem != index) {
                          allProductsCtrl.selectedItem = index;
                        }
                      });
                    },
                    child: Stack(
                      children: [
                        FadedScaleAnimation(
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                              image: DecorationImage(
                                  image: NetworkImage(data!.imageUrl), fit: BoxFit.fill),
                            ),
                          ),
                          durationInMilliseconds: 400,
                        ),
                        if (allProductsCtrl.selectedItem == index)
                          Opacity(
                            opacity: 0.8,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                                gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.center,
                                    colors: [
                                      Theme.of(context).primaryColor,
                                      transparentColor,
                                    ],
                                    stops: [
                                      0.2,
                                      0.75,
                                    ]),
                              ),
                            ),
                          ),
                        if (allProductsCtrl.selectedItem == index)
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 0.0),
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                                child: Obx(() => Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              if (allProductsCtrl.allProducts!.data[index]
                                                      .selectQuantity.value >
                                                  0.obs.value) {
                                                --allProductsCtrl
                                                    .allProducts?.data[index].selectQuantity.value;
                                              }
                                            },
                                            child:
                                                Icon(Icons.remove, color: Colors.white, size: 20)),
                                        SizedBox(width: 8),
                                        CircleAvatar(
                                          radius: 10,
                                          backgroundColor: buttonColor,
                                          child: Text(
                                            allProductsCtrl
                                                .allProducts!.data[index].selectQuantity.obs.value
                                                .toString(),
                                            // allProductsCtrl.itemsInCartList.length.toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1!
                                                .copyWith(fontSize: 10, color: Colors.white),
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        GestureDetector(
                                          onTap: () {
                                            ++allProductsCtrl
                                                .allProducts?.data[index].selectQuantity.value;
                                          },
                                          child: Icon(Icons.add, color: Colors.white, size: 20),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                          ),
                        Align(
                          alignment: Alignment.topRight,
                          child: FadedScaleAnimation(
                            Container(
                              height: 20,
                              width: 30,
                              child: IconButton(
                                  icon: Icon(
                                    Icons.info,
                                    color: Colors.yellow.shade400,
                                    size: 18,
                                  ),
                                  onPressed: () {
                                    logger.i(45);

                                    setState(() {
                                      allProductsCtrl.drawerCount.value = 1;
                                      allProductsCtrl.products = data;
                                    });
                                    _scaffoldKey.currentState!.openEndDrawer();
                                  }),
                            ),
                            durationInMilliseconds: 400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    data.name,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      FadedScaleAnimation(
                        Image.asset(
                          "assets/ic_veg.png",
                          scale: 2.5,
                        ),
                        durationInMilliseconds: 400,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text('\$ ' + data.productVariations.first.variations.first.sellPriceIncTax),
                    ],
                  ),
                ),
                Spacer(),
              ],
            ),
          );
        });
  }
}
