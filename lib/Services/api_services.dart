import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:hungerz_ordering/Services/api_urls.dart';
import 'package:hungerz_ordering/utils.dart';

import 'storage_sevices.dart';

class ApiServices {
  static Future<String> getMethod({required String feedUrl}) async {
    String token = AppStorage.getUserToken().accessToken;

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request = http.Request('GET', Uri.parse('${ApiUrls.baseUrl}$feedUrl'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    String result = await response.stream.bytesToString();
    logger.i(result);
    if (response.statusCode == 200) {
      return result;
    } else {
      return "";
    }
  }

  static Future<String> postMethod({
    required feedUrl,
    required Map<String, String>? fields,
  }) async {
    Map<String, String> headers = {};
    var request = http.MultipartRequest('POST', Uri.parse('${ApiUrls.baseUrl}$feedUrl'));
    if (fields != null) request.fields.addAll(fields);

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    String result = await response.stream.bytesToString();
    logger.i(result);

    if (response.statusCode == 200) {
      return result;
    } else {
      final jd = jsonDecode(result);
      Get.snackbar("Meaasge", jd["message"]);

      // showToast(jd["message"]);

      return "";
    }
  }
}
