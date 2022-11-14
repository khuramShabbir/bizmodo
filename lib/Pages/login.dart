import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungerz_ordering/Components/colorButton.dart';
import 'package:hungerz_ordering/Components/textfield.dart';
import 'package:hungerz_ordering/Controllers/Auth%20Controller/auth_controller.dart';
import 'package:hungerz_ordering/Controllers/TableSelectionController/table_management_controller.dart';
import 'package:hungerz_ordering/Pages/forget_screen.dart';
import 'package:hungerz_ordering/Pages/order_type_selection.dart';
import 'package:hungerz_ordering/Theme/colors.dart';
import 'table_selection.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthController authCtrl = Get.find<AuthController>();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FadedScaleAnimation(
                      Container(
                        width: 100,
                        height: 100,
                        child: Image(
                          image: AssetImage("assets/appIcon.png"),
                        ),
                      ),
                      durationInMilliseconds: 200,
                    ),
                    FadedScaleAnimation(
                      Text(
                        "BizModo",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Colors.black, fontSize: 18),
                      ),
                      durationInMilliseconds: 200,
                    ),
                    SizedBox(height: 20),
                  ],
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 300,
                        child: AppFormField(
                          keyboardType: TextInputType.emailAddress,
                          labelText: "User",
                          validator: (String? v) {
                            if (v!.isEmpty) return "* user name required";
                            return null;
                          },
                          title: "User Name",
                          controller: authCtrl.userNameCtrl,
                        ),
                      ),
                      SizedBox(height: 5),
                      SizedBox(
                        width: 300,
                        child: AppFormField(
                          isPasswordField: true,
                          labelText: "Password",
                          validator: (String? v) {
                            if (v!.isEmpty) return "* password required";
                            return null;
                          },
                          title: "Password",
                          controller: authCtrl.passwordCtrl,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(() => ForgetPasswordScreen());
                            },
                            child: Text(
                              "Forget Password ?",
                              style: TextStyle(color: primaryColor),
                            ),
                          ),
                          SizedBox(width: 30),
                        ],
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            bool token = await authCtrl.getToken();
                            if (!token) return;
                            bool login = await authCtrl.getLoginUserDetail();
                            if (!login) return;
                            Get.offAll(OrderTypeSelection());
                          }
                        },
                        child: ColorButton("Continue"),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
