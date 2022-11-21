import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/Components/custom_circular_button.dart';
import '/Controllers/ProductController/all_products_controller.dart';
import '/Controllers/ProductController/product_cart_controller.dart';
import '/Locale/locales.dart';
import '/Models/ProductsModel/all_products_model.dart';
import '/Pages/cart/cart_page.dart';
import '/Pages/items_page.dart';
import '/Services/storage_sevices.dart';
import '/Theme/colors.dart';
import '/utils.dart';

class HomePage extends StatefulWidget {
  final int? index;
  HomePage(this.index);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int categoryCurrentIndex = 0;
  final PageController _pageController = PageController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    if (!AppStorage.box.hasData(AppStorage.products)) {
      Get.find<AllProductsController>().fetchAllProducts();
    } else {
      Get.find<AllProductsController>().getAllProductsFromStorage();
    }
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    final isPortrait = Get.mediaQuery.orientation == Orientation.portrait;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: FadedScaleAnimation(
          GestureDetector(
            onTap: () {
              Get.find<AllProductsController>().fetchAllProducts();
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
                    style: Get.theme.textTheme.subtitle1!.copyWith(
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'eMENU',
                        style: TextStyle(color: Get.theme.primaryColor),
                      ),
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
                  fillColor: Get.theme.backgroundColor,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              )),
          buildItemsInCartButton()
        ],
      ),
      body: GetX<AllProductsController>(
        builder: (AllProductsController allProdCtrlObj) => (allProdCtrlObj
                    .isFetchingProduct.isFalse &&
                AppStorage.box.hasData(AppStorage.products))
            ? Container(
                color: Get.theme.backgroundColor,
                child: Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: ListView.builder(
                          itemCount:
                              allProdCtrlObj.allCategoriesProductsData?.categories.length ?? 0,
                          itemBuilder: (context, index) {
                            CategoryDataModel? category =
                                allProdCtrlObj.allCategoriesProductsData?.categories[index];

                            return InkWell(
                              onLongPress: () {},
                              onTap: () {
                                setState(() {
                                  categoryCurrentIndex = index;
                                });
                              },
                              child: Container(
                                height: 120,
                                margin: const EdgeInsets.all(5.0),
                                child: Card(
                                  margin: const EdgeInsets.all(0),
                                  clipBehavior: Clip.hardEdge,
                                  color: categoryCurrentIndex == index
                                      ? Get.theme.primaryColor
                                      : Get.theme.scaffoldBackgroundColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 7,
                                        child: FadedScaleAnimation(
                                          CachedNetworkImage(
                                            imageUrl: category?.products.first.imageUrl ?? "",
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
                                            placeholder: (context, url) =>
                                                progressIndicator(width: 10, height: 10),
                                            errorWidget: (context, url, error) => Icon(Icons.error),
                                          ),
                                          durationInMilliseconds: 400,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: Center(
                                          child: Text(
                                            category?.name ?? "".toUpperCase(),
                                            style: TextStyle(
                                              color: categoryCurrentIndex == index
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: 12,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    Expanded(
                      child: PageView(
                        controller: _pageController,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index) {
                          setState(() {
                            categoryCurrentIndex = index;
                          });
                        },
                        children: [
                          ItemsPage(
                            category: allProdCtrlObj
                                .allCategoriesProductsData?.categories[categoryCurrentIndex],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : progressIndicator(),
      ),
    );
  }

  Widget buildItemsInCartButton() {
    return GetBuilder<ProductCartController>(builder: (ProductCartController prodCartCtrlObj) {
      return CustomButton(
        onTap: () {
          if (prodCartCtrlObj.itemCartList.isNotEmpty) {
            // _scaffoldKey.currentState!.openEndDrawer();
            Get.to(() => CartPage());
          }
        },
        padding: EdgeInsets.symmetric(horizontal: 15),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        title: Text(
          "Cart (${prodCartCtrlObj.itemCartList.length})",
          style: Get.theme.textTheme.bodyText1,
          textAlign: TextAlign.center,
          maxLines: 1,
        ),
        bgColor: prodCartCtrlObj.itemCartList.isNotEmpty ? buttonColor : Colors.grey[600],
      );
    });
  }
}
