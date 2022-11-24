import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/Controllers/TableSelectionController/table_management_controller.dart';
import '/Models/TableManagemenModel/table_management_model.dart';
import '/Pages/app_menu.dart';
import '/Pages/home_page.dart';
import '/utils.dart';

class TableSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: FadedScaleAnimation(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: Image(
                  image: AssetImage("assets/appIcon.png"),
                ),
              ),
              RichText(
                  text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: 'eMENU',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Theme.of(context).primaryColor,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold)),
              ])),
            ],
          ),
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
        child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            return GetBuilder(
              initState: (_) {
                Get.find<TableSelectionController>().fetchTables();
              },
              builder: (TableSelectionController tableCtrlObj) {
                if (tableCtrlObj.tableRecord != null) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      tableCtrlObj.fetchTables();
                    },
                    child: GridView.builder(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      itemCount: tableCtrlObj.tableRecord!.tableData.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isPortrait ? 2 : 4,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1.5,
                      ),
                      itemBuilder: (context, index) {
                        TableDataModel _tableData = tableCtrlObj.tableRecord!.tableData[index];
                        return GestureDetector(
                          onTap: () async {
                            if (_tableData.status == TableStatus.BUSY ||
                                _tableData.status == TableStatus.RESERVED) {
                              showToast("Please choose Free table");

                              /// TODO: navigate to order details screen
                              return;
                            }

                            Get.to(() => HomePage(index));
                          },
                          child: FadedScaleAnimation(
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                              decoration: BoxDecoration(
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.grey.shade100,
                                    blurRadius: 5,
                                    spreadRadius: 1,
                                  )
                                ],
                                color: Color(_tableData.bgColor ?? 0xFFFFFF),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _tableData.name,
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      Spacer(),
                                      if (_tableData.updatedAt != null)
                                        Expanded(
                                          child: Text(
                                            _tableData.updatedAt.toString() ?? "",
                                            style: TextStyle(),
                                          ),
                                        ),
                                      Spacer(),
                                      Text(
                                        _tableData.status?.name ?? 'Status Not Available',
                                      )
                                    ],
                                  ),
                                  if (_tableData.status?.name != null &&
                                      _tableData.status?.name == TableStatus.BUSY)
                                    Positioned(
                                      top: 2.5,
                                      right: 2.5,
                                      child: DropdownButton<TableStatus>(
                                        underline: SizedBox(),
                                        items: <TableStatus>[
                                          (_tableData.status?.name == TableStatus.BUSY)
                                              ? TableStatus.RESERVED
                                              : TableStatus.FREE
                                        ].map((TableStatus value) {
                                          return DropdownMenuItem<TableStatus>(
                                            value: value,
                                            child: Text('$value'),
                                          );
                                        }).toList(),
                                        onChanged: (value) async {
                                          // Tables data = tableCtrl.tableDetailModel[index].tables;
                                          //
                                          // data.color = 0xFFFFFFFF;
                                          //
                                          // setState(() {});
                                          // TableDetail tables = TableDetail(
                                          //   tables: Tables(
                                          //     tableId: data.tableId,
                                          //     color: data.color,
                                          //     time: null,
                                          //     available: value!,
                                          //   ),
                                          // );
                                          // tableCtrl.tableDetailModel[index] = tables;
                                          // final je = jsonEncode(tableCtrl.tableDetailModel);
                                          //
                                          // await AppStorage.write(AppStorage.tableData, je);
                                          // setState(() {});
                                        },
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            durationInMilliseconds: 200,
                          ),
                        );
                      },
                    ),
                  );
                } else if (!tableCtrlObj.isTablesLoaded) {
                  return progressIndicator();
                } else {
                  /// TODO: show refresh button with some information.
                  return SizedBox();
                }
              },
            );
          },
        ),
      ),
    );
  }
}
