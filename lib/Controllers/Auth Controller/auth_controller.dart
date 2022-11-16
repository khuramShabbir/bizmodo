import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '/Models/AuthModels/o_auth_model.dart';
import '/Services/api_services.dart';
import '/Services/api_urls.dart';
import '/Services/storage_sevices.dart';
import '/utils.dart';

class AuthController extends GetxController {
  TextEditingController userNameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  Rxn<OauthModel>? oauthModel;
  final String _grantType = "password";
  final String _clientId = "7";
  final String _clientSecret = "C30C6RIW3dxtQMQcKRMCXlT3smG106t5OYoaySoN";
  final String _scope = "";

  Future<bool> getToken() async {
    showProgress();
    Map<String, String> fields = {
      'grant_type': _grantType,
      'client_id': _clientId,
      'client_secret': _clientSecret,
      'username': userNameCtrl.text,
      'password': passwordCtrl.text,
      'scope': _scope
    };
    String response = await ApiServices.postMethod(feedUrl: ApiUrls.oauthToken, fields: fields);
    stopProgress();
    if (response.isEmpty) return false;
    oauthModel?.value = oauthModelFromJson(response);
    await AppStorage.write(AppStorage.token, response);
    disposeControllers();
    return true;
  }

  Future<bool> getLoginUserDetail() async {
    showProgress();
    String response = await ApiServices.getMethod(feedUrl: ApiUrls.getLoggedInUserDetail);
    stopProgress();

    if (response.isEmpty) return false;
    oauthModel?.value = oauthModelFromJson(response);
    await showToast("logged in");
    disposeControllers();
    return true;
  }

  void disposeControllers() {
    userNameCtrl.clear();
    passwordCtrl.clear();
  }
}
