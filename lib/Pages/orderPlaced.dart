import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/Components/custom_circular_button.dart';
import '/Locale/locales.dart';
import '/Theme/colors.dart';
import 'table_selection.dart';

class OrderPlaced extends StatefulWidget {
  @override
  _OrderPlacedState createState() => _OrderPlacedState();
}

class _OrderPlacedState extends State<OrderPlaced> {
  @override
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    return Scaffold(
      body: FadedSlideAnimation(
        SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      locale.weMustSay!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      locale.youveGreatChoiceOfTaste!.toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 20, letterSpacing: 1, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Spacer(
                  flex: 2,
                ),
                FadedScaleAnimation(
                  Container(
                    width: MediaQuery.of(context).size.height * 0.42,
                    child: Image(
                      image: AssetImage("assets/order confirmed.png"),
                    ),
                  ),
                  durationInMilliseconds: 400,
                ),
                Spacer(),
                Column(
                  children: [
                    Text(
                      locale.orderConfirmedWith!.toUpperCase(),
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 13,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey.shade800),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RichText(
                        text: TextSpan(
                            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                ),
                            children: <TextSpan>[
                          TextSpan(
                            text: 'BIZMODO',
                          ),
                          TextSpan(
                              text: 'Restro',
                              style: TextStyle(color: Theme.of(context).primaryColor)),
                        ])),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Text(
                      locale.yourOrderWillBeAtYourTable!.toUpperCase(),
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 13,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey.shade800),
                    ),
                    Text(
                      locale.anytimeSoon!.toUpperCase(),
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 13,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey.shade800),
                    ),
                  ],
                ),
                Spacer(),
                SizedBox(
                  width: Get.width * .2,
                  child: CustomButton(
                    onTap: () {
                      setState(() {});

                      Get.offAll(TableSelectionPage());
                    },
                    title: Text(
                      "Finish",
                      style: TextStyle(color: Colors.white),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    bgColor: primaryColor,
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        curve: Curves.linearToEaseOut,
      ),
    );
  }
}
