import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:hungerz_ordering/Locale/locales.dart';

class OrderPlaced extends StatefulWidget {
  @override
  _OrderPlacedState createState() => _OrderPlacedState();
}

class _OrderPlacedState extends State<OrderPlaced> {
  @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(Duration(seconds: 5), () {
  //     Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => LandingPage(),
  //         ));
  //   });
  // }

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
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 20,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold),
                    ),
                    // Text(
                    //   locale.choiceoOfTaste,
                    //   style: Theme.of(context)
                    //       .textTheme
                    //       .bodyText2
                    //       .copyWith(fontSize: 20),
                    // ),
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
                            style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold,
                                    ),
                            children: <TextSpan>[
                          TextSpan(
                            text: 'HUNGERZ',
                          ),
                          TextSpan(
                              text: 'RESTRO',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor)),
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
                // GestureDetector(
                //   onTap: () {
                //     Navigator.pushReplacement(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => LandingPage(),
                //         ));
                //   },
                //   child: Text("Home",
                //       style: Theme.of(context).textTheme.bodyText2.copyWith(
                //           fontSize: 20,
                //           letterSpacing: 2,
                //           color: Theme.of(context).primaryColor)),
                // ),
                // Spacer(),
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
