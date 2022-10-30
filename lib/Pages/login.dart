import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungerz_ordering/Components/colorButton.dart';
import 'package:hungerz_ordering/Components/textfield.dart';
import 'package:hungerz_ordering/Controllers/Auth%20Controller/auth_controller.dart';
import 'package:hungerz_ordering/Controllers/TableSelectionController/table_management_controller.dart';
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
      appBar: AppBar(),
      body: FadedSlideAnimation(
        Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FadedScaleAnimation(
                        Container(
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
                              .copyWith(color: Colors.black, fontSize: 25),
                        ),
                        durationInMilliseconds: 200,
                      )
                    ],
                  ),
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 250,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: EntryField(
                              validator: (String? v) {
                                if (v!.isEmpty) return "* user name required";
                                return null;
                              },
                              title: "User Name",
                              textCtrl: authCtrl.userNameCtrl,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 250,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: EntryField(
                              obSecure: true,
                              validator: (String? v) {
                                if (v!.isEmpty) return "* password required";
                                return null;
                              },
                              title: "Password",
                              textCtrl: authCtrl.passwordCtrl,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              bool token = await authCtrl.getToken();

                              if (!token) return;

                              bool login = await authCtrl.getLoginUserDetail();
                              if (!login) return;
                              Get.put(TableSelectionController());
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => TableSelectionPage()));
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
        beginOffset: Offset(0.0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}

// import 'package:animation_wrappers/animation_wrappers.dart';
// import 'package:flutter/material.dart';
// import 'package:hungerz_ordering/Components/colorButton.dart';
// import 'package:hungerz_ordering/Components/textfield.dart';
// import 'package:hungerz_ordering/Pages/verification.dart';
//
// class LoginUi extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FadedSlideAnimation(
//         SingleChildScrollView(
//           child: Container(
//             height: MediaQuery.of(context).size.height,
//             padding: EdgeInsets.symmetric(horizontal: 25),
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 70,
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     Text(
//                       "ENTERED REGISTERED",
//                       style: Theme.of(context).textTheme.bodyText1!.copyWith(
//                           fontSize: 16,
//                           color: Colors.blueGrey.shade700,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Text(
//                       "PHONE NUMBER TO START",
//                       style: Theme.of(context).textTheme.bodyText1!.copyWith(
//                           fontSize: 16,
//                           color: Colors.blueGrey.shade700,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//                 Spacer(),
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.phone_android,
//                       color: Theme.of(context).primaryColor,
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Text("PHONE NUMBER",
//                         style: TextStyle(color: Colors.grey[600]))
//                   ],
//                 ),
//                 Container(
//                   padding: EdgeInsets.only(left: 35),
//                   child: Column(
//                     children: [
//                       EntryField("+1 984 596 4521"),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             "We'll send Verification code on given number",
//                             style: TextStyle(color: Colors.grey),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//                 Spacer(),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => Verification()));
//                   },
//                   child: Padding(
//                     padding: EdgeInsets.only(left: 35),
//                     child: Row(
//                       children: [
//                         ColorButton("CONTINUE"),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Spacer()
//               ],
//             ),
//           ),
//         ),
//         beginOffset: Offset(0, 0.3),
//         endOffset: Offset(0, 0),
//         curve: Curves.linearToEaseOut,
//       ),
//     );
//   }
// }
