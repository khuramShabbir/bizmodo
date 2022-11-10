import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungerz_ordering/Components/custom_circular_button.dart';
import 'package:hungerz_ordering/Components/textfield.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
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
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/appIcon.png"),
            ),
            Container(
              width: Get.width * .5,
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
                  textCtrl: textEditingController,
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 50, right: 50),
              child: CustomButton(
                borderRadius: 10,
                onTap: () {},
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
