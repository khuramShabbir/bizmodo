import 'package:hungerz_ordering/utils.dart';

class AppConst {
  static void updateMapValues({
    required Map<String, dynamic> map,
    required String key,
    required var value,
  }) {
    if (map.containsKey(key)) {
      map.update(key, (v) => value);
    } else {
      map.putIfAbsent(key, () => value);
    }
    logger.i(map);
  }
}
