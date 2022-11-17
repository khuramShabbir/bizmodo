import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '/Config/app_config.dart';
import '/Models/AuthModels/loggged_in_user_detail.dart';
import '/Models/AuthModels/o_auth_model.dart';
import '/Services/api_services.dart';
import '/Services/api_urls.dart';
import '/Services/storage_sevices.dart';
import '/utils.dart';

class AuthController extends GetxController {
  final TextEditingController userNameCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  OauthModel? oAuthData;
  LoggedInUserDetail? loggedInUserData;

  Future<bool> getToken() async {
    showProgress();
    Map<String, String> fields = {
      'client_id': AppConfig.clientId,
      'client_secret': AppConfig.clientSecret,
      'grant_type': AppConfig.grantType,
      'scope': AppConfig.scope,
      'username': userNameCtrl.text,
      'password': passwordCtrl.text,
    };
    String response = await ApiServices.postMethod(feedUrl: ApiUrls.oauthToken, fields: fields);
    stopProgress();
    if (response.isEmpty) return false;
    oAuthData = oauthModelFromJson(response);
    await AppStorage.write(AppStorage.token, response);
    disposeControllers();
    return true;
  }

  Future<bool> getLoginUserDetail() async {
    showProgress();
    String response = await ApiServices.getMethod(feedUrl: ApiUrls.getLoggedInUserDetail);
    stopProgress();

    if (response.isEmpty) return false;
    //Done: login user data parsing issue resolved.
    loggedInUserData = loggedInUserDetailFromJson(response);
    await showToast("logged in");
    disposeControllers();
    return true;
  }

  void disposeControllers() {
    userNameCtrl.clear();
    passwordCtrl.clear();
  }
}
