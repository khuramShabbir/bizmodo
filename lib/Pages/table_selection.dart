import 'dart:convert';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungerz_ordering/Controllers/ProductController/all_products_controller.dart';
import 'package:hungerz_ordering/Controllers/TableSelectionController/table_management_controller.dart';
import 'package:hungerz_ordering/Locale/locales.dart';
import 'package:hungerz_ordering/Models/TableManagemenModel/table_management_model.dart';
import 'package:hungerz_ordering/Pages/login.dart';
import 'package:hungerz_ordering/Routes/routes.dart';
import 'package:hungerz_ordering/Services/storage_sevices.dart';
import 'package:hungerz_ordering/utils.dart';

class TableSelectionPage extends StatefulWidget {
  @override
  _TableSelectionPageState createState() => _TableSelectionPageState();
}

class _TableSelectionPageState extends State<TableSelectionPage> {
  @override
  void initState() {
    if (!AppStorage.box.hasData(AppStorage.tableData)) {
      tableCtrl.createTable();
      tableCtrl.getTableDetail();
    } else {
      tableCtrl.getTableDetail();

      tableCtrl.isTableCreated.value = true;
    }
    super.initState();
  }

  final TableSelectionController tableCtrl = Get.find<TableSelectionController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onDoubleTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
          child: FadedScaleAnimation(
            RichText(
                text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: 'HUNGERZ',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(letterSpacing: 1, fontWeight: FontWeight.bold)),
              TextSpan(
                  text: 'eMENU',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Theme.of(context).primaryColor,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold)),
            ])),
            durationInMilliseconds: 400,
          ),
        ),
        actions: [],
      ),
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: GridView.builder(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            itemCount: tableCtrl.tableDetailModel.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.5),
            itemBuilder: (context, index) {
              Tables data = tableCtrl.tableDetailModel[index].tables;
              return Obx(() => GestureDetector(
                    onTap: () async {
                      if (data.available == "Busy") {
                        showToast("Please choose Free table");
                        return;
                      }
                      data.color = 0xFFFFFF00;
                      setState(() {});
                      TableDetail tables = TableDetail(
                          tables: Tables(
                              tableId: data.tableId,
                              color: data.color,
                              time: null,
                              available: 'Busy'));
                      tableCtrl.tableDetailModel[index] = tables;
                      setState(() {});
                      final je = jsonEncode(tableCtrl.tableDetailModel);

                      await AppStorage.write(AppStorage.tableData, je);

                      Get.put(AllProductsController());

                      Navigator.pushNamed(context, PageRoutes.homePage);
                    },
                    child: FadedScaleAnimation(
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                        decoration: BoxDecoration(boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.grey.withOpacity(.5), blurRadius: 10, spreadRadius: 1)
                        ], color: Color(data.color), borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("Table No ${data.tableId}",
                                    style: TextStyle(fontWeight: FontWeight.bold)),
                                Expanded(
                                    child: Text(data.time?.toString() ?? "", style: TextStyle()))
                              ],
                            ),
                            Spacer(),
                            Text(data.available, style: TextStyle())
                          ],
                        ),
                      ),
                      durationInMilliseconds: 200.obs.value,
                    ),
                  ));
            }),
      ),
    );
  }
}