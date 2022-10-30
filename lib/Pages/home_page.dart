import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungerz_ordering/Components/custom_circular_button.dart';
import 'package:hungerz_ordering/Controllers/ProductController/all_products_controller.dart';
import 'package:hungerz_ordering/Locale/locales.dart';
import 'package:hungerz_ordering/Pages/item_info.dart';
import 'package:hungerz_ordering/Pages/orderPlaced.dart';
import 'package:hungerz_ordering/Theme/colors.dart';
import 'package:hungerz_ordering/utils.dart';

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

  List<FoodItem> foodItems = [
    FoodItem('assets/food items/food1.jpg', 'Veg Sandwich', true, '5.00', false, 0),
    FoodItem('assets/food items/food2.jpg', 'Shrips Rice', true, '3.00', false, 0),
    FoodItem('assets/food items/food3.jpg', 'Cheese Bread', true, '4.00', false, 0),
    FoodItem('assets/food items/food4.jpg', 'Veg Cheeswich', true, '3.50', false, 0),
    FoodItem('assets/food items/food5.jpg', 'Margherita Pizza', true, '4.50', false, 0),
    FoodItem('assets/food items/food6.jpg', 'Veg Manchau', true, '2.50', false, 0),
    FoodItem('assets/food items/food7.jpg', 'Spring Noodle', true, '3.00', false, 0),
    FoodItem('assets/food items/food8.jpg', 'Veg Mix Pizza', true, '5.00', false, 0),
  ];

  bool itemSelected = false;
  String? img, name;
  int drawerCount = 0;
  int currentIndex = 0;
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
    List<ItemCategory> foodCategories = [
      ItemCategory('assets/ItemCategory/cat_fastfood.png', locale.fastFood),
      ItemCategory('assets/ItemCategory/cat_seafood.png', locale.seaFood),
      ItemCategory('assets/ItemCategory/cat_chinese.png', locale.chinesee),
      ItemCategory('assets/ItemCategory/cat_dessert.png', locale.dessert),
      ItemCategory('assets/ItemCategory/cat_fastfood.png', locale.fastFood),
      ItemCategory('assets/ItemCategory/cat_seafood.png', locale.seaFood),
      ItemCategory('assets/ItemCategory/cat_chinese.png', locale.chinesee),
      ItemCategory('assets/ItemCategory/cat_dessert.png', locale.dessert),
    ];
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Drawer(
        child: Drawer(
          child: drawerCount == 1
              ? ItemInfoPage(img, name)
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
                                                      cartItems[index].image,
                                                      cartItems[index].name)));
                                        },
                                        child: FadedScaleAnimation(
                                          ClipRRect(
                                              borderRadius: BorderRadius.circular(8),
                                              child: FadedScaleAnimation(
                                                Image.asset(cartItems[index].image),
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
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: Row(
          children: [
            Container(
              width: 90,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: 8,
                  itemBuilder: (context, index) {
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
                                foodCategories[index].image,
                                scale: 3.5,
                              ),
                              durationInMilliseconds: 400,
                            ),
                            Spacer(),
                            Text(
                              foodCategories[index].name!.toUpperCase(),
                              style: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 10),
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
                    currentIndex = index;
                  });
                },
                children: [
                  buildPage(),
                  buildPage(),
                  buildPage(),
                  buildPage(),
                  buildPage(),
                  buildPage(),
                  buildPage(),
                  buildPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  CustomButton buildItemsInCartButton(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return CustomButton(
      onTap: () {
        setState(() {
          drawerCount = 0;
        });
        if (itemSelected) {
          _scaffoldKey.currentState!.openEndDrawer();
        }
      },
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      title: Text(
        itemSelected ? locale!.itemsInCart! + ' (3)' : locale!.itemsInCart! + ' (0)',
        style: Theme.of(context).textTheme.bodyText1,
      ),
      bgColor: itemSelected ? buttonColor : Colors.grey[600],
    );
  }

  Widget buildPage() {
    return GridView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsetsDirectional.only(top: 16, bottom: 16, start: 16, end: 32),
        itemCount: foodItems.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: 0.75),
        itemBuilder: (context, index) {
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
                        foodItems[index].isSelected = !foodItems[index].isSelected;
                        itemSelected = true;
                      });
                      // Navigator.push(
                      //     context, MaterialPageRoute(builder: (context)=>ItemInfoPage(foodItems[index].image,foodItems[index].name)));
                    },
                    child: Stack(
                      children: [
                        FadedScaleAnimation(
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                                image: DecorationImage(
                                    image: AssetImage(foodItems[index].image), fit: BoxFit.fill)),
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
                                      img = foodItems[index].image;
                                      name = foodItems[index].name;
                                      drawerCount = 1;
                                    });
                                    _scaffoldKey.currentState!.openEndDrawer();
                                  }),
                            ),
                            durationInMilliseconds: 400,
                          ),
                        ),
                        foodItems[index].isSelected
                            ? Opacity(
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
                              )
                            : SizedBox.shrink(),
                        foodItems[index].isSelected
                            ? Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              if (foodItems[index].count >= 1)
                                                setState(() {
                                                  foodItems[index].count--;
                                                });
                                            },
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.white,
                                              size: 16,
                                            )),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        CircleAvatar(
                                          radius: 10,
                                          backgroundColor: buttonColor,
                                          child: Text(
                                            foodItems[index].count.toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1!
                                                .copyWith(fontSize: 10, color: Colors.white),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                foodItems[index].count++;
                                              });
                                            },
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: 16,
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox.shrink(),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    foodItems[index].name,
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
                          foodItems[index].isVeg ? 'assets/ic_veg.png' : 'assets/ic_nonveg.png',
                          scale: 2.5,
                        ),
                        durationInMilliseconds: 400,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text('\$ ' + foodItems[index].price),
                    ],
                  ),
                ),
                Spacer(),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                //   child: Container(
                //     padding: EdgeInsets.symmetric(
                //         vertical: 6, horizontal: 6),
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(20),
                //         border: Border.all(
                //             color: newOrderColor, width: 0.2)),
                //     child: Row(
                //       mainAxisSize: MainAxisSize.min,
                //       children: [
                //         GestureDetector(
                //             onTap: () {
                //               if (foodItems[index].count >= 1)
                //                 setState(() {
                //                   foodItems[index].count--;
                //                 });
                //             },
                //             child: Icon(
                //               Icons.remove,
                //               color: newOrderColor,
                //               size: 16,
                //             )),
                //         SizedBox(
                //           width: 8,
                //         ),
                //         Text(
                //           foodItems[index].count.toString(),
                //           style: Theme.of(context)
                //               .textTheme
                //               .subtitle1
                //               .copyWith(fontSize: 12),
                //         ),
                //         SizedBox(
                //           width: 8,
                //         ),
                //         GestureDetector(
                //             onTap: () {
                //               setState(() {
                //                 foodItems[index].count++;
                //               });
                //             },
                //             child: Icon(
                //               Icons.add,
                //               color: newOrderColor,
                //               size: 16,
                //             )),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          );
        });
  }

  // Widget _buildAboutDialog(BuildContext context) {
  //   var locale = AppLocalizations.of(context);
  //   return new AlertDialog(
  //       content: SingleChildScrollView(
  //     child: new Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: <Widget>[
  //         RichText(
  //             textAlign: TextAlign.center,
  //             text: TextSpan(
  //                 style: Theme.of(context).textTheme.subtitle1,
  //                 children: <TextSpan>[
  //                   TextSpan(
  //                       text: locale.weMustSay + '\n'.toUpperCase(),
  //                       style: TextStyle(height: 2.8, fontSize: 12)),
  //                   TextSpan(
  //                       text: locale.youveGreatChoiceOfTaste.toUpperCase(),
  //                       style: TextStyle(fontSize: 20)),
  //                 ])),
  //         FadedScaleAnimation(
  //           Image.asset(
  //             'assets/order confirmed.png',
  //             scale: 3,
  //           ),
  //           durationInMilliseconds: 400,
  //         ),
  //         RichText(
  //             textAlign: TextAlign.center,
  //             text: TextSpan(
  //                 style: Theme.of(context).textTheme.subtitle1,
  //                 children: <TextSpan>[
  //                   TextSpan(
  //                       text: '\n' +
  //                           locale.orderConfirmedWith +
  //                           '\n\n'.toUpperCase(),
  //                       style: TextStyle(fontSize: 14)),
  //                   TextSpan(text: 'hungerz'.toUpperCase()),
  //                   TextSpan(
  //                       text: 'restro\n\n'.toUpperCase(),
  //                       style:
  //                           TextStyle(color: Theme.of(context).primaryColor)),
  //                   TextSpan(
  //                       text: locale.yourOrderWillBeAtYourTable.toUpperCase(),
  //                       style: TextStyle(fontSize: 14)),
  //                 ])),
  //       ],
  //     ),
  //   ));
  // }
}
