import 'package:get/get.dart';

import '/Models/TableManagemenModel/table_management_model.dart';
import '/Services/api_services.dart';
import '/Services/api_urls.dart';
import '/Services/storage_sevices.dart';
import '/utils.dart';

class TableSelectionController extends GetxController {
  bool isTablesLoaded = true;
  TableModel? tableRecord;

  void fetchTables() async {
    if (AppStorage.box.hasData(AppStorage.tableData)) {
      isTablesLoaded = true;
      getTableDetail();
    } else {
      isTablesLoaded = false;
      update();
    }
    await ApiServices.getMethod(feedUrl: ApiUrls.getTables).then((_res) async {
      isTablesLoaded = true;
      update();
      if (_res == null) return;
      await AppStorage.write(AppStorage.tableData, _res);
      getTableDetail();
      update();
    }).onError((error, stackTrace) {
      isTablesLoaded = true;
      update();
      print('Error => $error');
      logger.e('StackTrace => $stackTrace');
    });
  }

  void getTableDetail() {
    String? _storedTableData = AppStorage.read(AppStorage.tableData);
    if (_storedTableData != null) {
      tableRecord = tableModelFromJson(_storedTableData);
      update();
    }
  }
}
