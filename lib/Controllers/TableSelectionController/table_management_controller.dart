import 'dart:convert';
import 'package:get/get.dart';
import 'package:hungerz_ordering/Models/TableManagemenModel/table_management_model.dart';
import 'package:hungerz_ordering/Services/storage_sevices.dart';
import 'package:hungerz_ordering/utils.dart';

class TableSelectionController extends GetxController {
  int tableCount = 10;
  List<String> tableList = [];
  RxBool isTableCreated = false.obs;
  RxList<TableDetail> tableDetailModel = <TableDetail>[].obs;

  void createTable() async {
    for (int i = 1; i <= tableCount; i++) {
      Map<String, dynamic> table = TableDetail(
        tables: Tables(
          tableId: i.toString(),
          color: 0xFFFFFFFF,
          time: null,
          available: 'Free',
        ),
      ).toJson();

      final je = jsonEncode(table);
      tableList.add(je);
    }
    await AppStorage.write(AppStorage.tableData, tableList.toString());
    isTableCreated.value = true;
  }

  void getTableDetail() {
    final String data = AppStorage.read(AppStorage.tableData);
    tableDetailModel.value = tableDetailFromJson(data);
  }
}
