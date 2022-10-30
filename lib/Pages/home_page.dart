import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungerz_ordering/Components/custom_circular_button.dart';
import 'package:hungerz_ordering/Controllers/ProductController/all_products_controller.dart';
import 'package:hungerz_ordering/Locale/locales.dart';
import 'package:hungerz_ordering/Pages/item_info.dart';
import 'package:hungerz_ordering/Pages/orderPlaced.dart';
import 'package:hungerz_ordering/Theme/colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class ItemCategory {
  String image;
  String? name;

  ItemCategory(this.image, this.name);
}

class FoodItem {
  String image;
  String name;
  bool isVeg;
  String price;
  bool isSelected;
  int count = 0;
  FoodItem(this.image, this.name, this.isVeg, this.price, this.isSelected, this.count);
}

class CartItem {
  String name;
  String image;
  String price;
  int count;
  List<String> extras;
  bool isVeg;
  CartItem(this.name, this.image, this.price, this.count, this.extras, this.isVeg);
}

class _HomePageState extends State<HomePage> {
  List<CartItem> cartItems = [
    CartItem('Veg Sandwich', 'assets/food items/food1.jpg', '5.00', 1, ['Extra Cheese'], true),
    CartItem('Fried Chicken', 'assets/food items/food2.jpg', '7.00', 1, [], false),
    CartItem('Watermelon Juice', 'assets/food items/food3.jpg', '4.50', 1, [], true),
  ];

  PageController _pageController = PageController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  AllProductsController allProductsCtrl = Get.find<AllProductsController>();

  @override
  void initState() {
    allProductsCtrl.getAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Drawer(
        child: Drawer(
          child: allProductsCtrl.drawerCount.value == 1
              ? ItemInfoPage(allProductsCtrl.img?.value, allProductsCtrl.name?.value)
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
                                  locale.tableNo! + ' 6',
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
                              itemCount: 3,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
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
                                              builder: (context) => ItemInfoPage(
                                                  cartItems[index].image, cartItems[index].name),
                                            ),
                                          );
                                        },
                                        child: FadedScaleAnimation(
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(8),
                                            child: FadedScaleAnimation(
                                              Image.asset(cartItems[index].image),
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
                                              cartItems[index].name,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1!
                                                  .copyWith(fontSize: 14),
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            FadedScaleAnimation(
                                              Image.asset(
                                                cartItems[index].isVeg
                                                    ? 'assets/ic_veg.png'
                                                    : 'assets/ic_nonveg.png',
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
                                                          if (cartItems[index].count > 1)
                                                            setState(() {
                                                              cartItems[index].count--;
                                                            });
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
                                                      cartItems[index].count.toString(),
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
                                                          setState(() {
                                                            cartItems[index].count++;
                                                          });
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
                                                '\$' + cartItems[index].price,
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
                                                    Text('\$' + cartItems[index].price,
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
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => OrderPlaced()));
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
                ),
                TextSpan(text: ' eMENU', style: TextStyle(color: Theme.of(context).primaryColor)),
              ])),
          durationInMilliseconds: 400,
        ),
        actions: [
          Container(
              width: 300,
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
                        ? itemsPage().obs.value
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
            setState(() {
              allProductsCtrl.drawerCount.value = 0;
            });
            if (allProductsCtrl.itemSelected.value) {
              _scaffoldKey.currentState!.openEndDrawer();
            }
          },
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          title: Text(
            allProductsCtrl.itemsInCartList.isNotEmpty
                ? locale!.itemsInCart! + " ( ${allProductsCtrl.itemsInCartList.length.toString()} )"
                : locale!.itemsInCart! + ' (0)',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          bgColor: allProductsCtrl.itemSelected.value ? buttonColor : Colors.grey[600],
        ));
  }

  Widget itemsPage() {
    return GridView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsetsDirectional.only(top: 16, bottom: 16, start: 16, end: 32),
        itemCount: allProductsCtrl.allProducts?.data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: 0.75),
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
                          allProductsCtrl.itemSelected.value = true;
                        } else {
                          allProductsCtrl.selectedItem = -1;
                          allProductsCtrl.itemSelected.value = false;
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
                        Align(
                          alignment: Alignment.topRight,
                          child: FadedScaleAnimation(
                            Container(
                              height: 20,
                              width: 30,
                              child: IconButton(
                                  icon: Icon(
                                    Icons.info,
                                    color: Colors.grey.shade400,
                                    size: 15,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      allProductsCtrl.drawerCount.value = 1;
                                    });
                                    _scaffoldKey.currentState!.openEndDrawer();
                                  }),
                            ),
                            durationInMilliseconds: 400,
                          ),
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
                                              if (allProductsCtrl.itemsInCartList.isNotEmpty)
                                                allProductsCtrl.itemsInCartList.removeLast();
                                            },
                                            child:
                                                Icon(Icons.remove, color: Colors.white, size: 20)),
                                        SizedBox(width: 8),
                                        CircleAvatar(
                                          radius: 10,
                                          backgroundColor: buttonColor,
                                          child: Text(
                                            allProductsCtrl.itemsInCartList.length.toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1!
                                                .copyWith(fontSize: 10, color: Colors.white),
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        GestureDetector(
                                            onTap: () {
                                              allProductsCtrl.itemsInCartList
                                                  .add(allProductsCtrl.allProducts!.data[index]);
                                            },
                                            child: Icon(Icons.add, color: Colors.white, size: 20)),
                                      ],
                                    )),
                              ),
                            ),
                          )
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
