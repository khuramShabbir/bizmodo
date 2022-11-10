import 'dart:convert';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungerz_ordering/Controllers/ProductController/all_products_controller.dart';
import 'package:hungerz_ordering/Controllers/TableSelectionController/table_management_controller.dart';
import 'package:hungerz_ordering/Models/TableManagemenModel/table_management_model.dart';
import 'package:hungerz_ordering/Pages/app_menu.dart';
import 'package:hungerz_ordering/Pages/home_page.dart';
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
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: Image(
          image: AssetImage("assets/appIcon.png"),
        ),
        title: FadedScaleAnimation(
          RichText(
              text: TextSpan(children: <TextSpan>[
            TextSpan(
                text: 'BIZMODO',
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
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext ctx) {
                    return AppMenuSettings();
                  },
                ),
              );
            },
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            return GridView.builder(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                itemCount: tableCtrl.tableDetailModel.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isPortrait ? 2 : 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.5,
                ),
                itemBuilder: (context, index) {
                  Tables data = tableCtrl.tableDetailModel[index].tables;
                  return Obx(() => GestureDetector(
                        onTap: () async {
                          if (data.available == "Busy") {
                            showToast("Please choose Free table");
                            return;
                          }

                          Get.to(() => HomePage(index));
                        },
                        child: FadedScaleAnimation(
                          Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                                decoration: BoxDecoration(
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(.5),
                                          blurRadius: 10,
                                          spreadRadius: 1)
                                    ],
                                    color: Color(data.color),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text("Table No ${data.tableId}",
                                            style: TextStyle(fontWeight: FontWeight.bold)),
                                        Expanded(
                                            child: Text(data.time?.toString() ?? "",
                                                style: TextStyle()))
                                      ],
                                    ),
                                    Spacer(),
                                    Text(data.available, style: TextStyle())
                                  ],
                                ),
                              ),
                              // if (data.available == "Busy")
                              Positioned(
                                top: 1,
                                right: 2,
                                child: DropdownButton<String>(
                                  underline: SizedBox(),
                                  items: <String>[data.available == "Busy" ? 'Served' : "Free"]
                                      .map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? value) async {
                                    Tables data = tableCtrl.tableDetailModel[index].tables;

                                    data.color = 0xFFFFFFFF;

                                    setState(() {});
                                    TableDetail tables = TableDetail(
                                      tables: Tables(
                                        tableId: data.tableId,
                                        color: data.color,
                                        time: null,
                                        available: value!,
                                      ),
                                    );
                                    tableCtrl.tableDetailModel[index] = tables;
                                    final je = jsonEncode(tableCtrl.tableDetailModel);

                                    await AppStorage.write(AppStorage.tableData, je);
                                    setState(() {});
                                  },
                                ),
                              ),
                            ],
                          ),
                          durationInMilliseconds: 200.obs.value,
                        ),
                      ));
                });
          },
        ),
      ),
    );
  }
}
