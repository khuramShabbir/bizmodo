import 'package:get_storage/get_storage.dart';
import 'package:hungerz_ordering/Models/AuthModels/o_auth_model.dart';

class AppStorage {
  static final box = GetStorage();
  static String token = "token";
  static String tableData = "tableCount";

  static String lang = "Lang";

  static Future<void> write(String key, dynamic value) async {
    await box.write(key, value);
  }

  static dynamic read(String key) {
    return box.read(key);
  }

  static OauthModel getUserToken() {
    return oauthModelFromJson(box.read(token));
  }
}
