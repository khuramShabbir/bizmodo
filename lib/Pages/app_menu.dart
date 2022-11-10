import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungerz_ordering/Locale/settings_page.dart';
import 'package:hungerz_ordering/Services/storage_sevices.dart';
import 'package:hungerz_ordering/Theme/colors.dart';
import 'package:hungerz_ordering/utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp/whatsapp.dart';

class AppMenuSettings extends StatelessWidget {
  AppMenuSettings({Key? key}) : super(key: key);

  final String supportNumber = "+971504059006";
  final WhatsApp whatsApp = WhatsApp();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: FadedScaleAnimation(
            Text(
              "Settings",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            durationInMilliseconds: 400,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      FadedScaleAnimation(
                        SizedBox(
                          height: Get.height * .1,
                          child: Image(
                            image: AssetImage("assets/appIcon.png"),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                              text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: 'BIZMODO',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(letterSpacing: 1, fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: 'eMENU',
                                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold)),
                          ])),
                          Text("Location"),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Column(
                  children: [
                    listTile(
                      onTap: () {},
                      title: "Wallet",
                      iconData: Icons.wallet,
                    ),
                    listTile(
                        onTap: () {},
                        title: "Terms & Condition",
                        iconData: Icons.library_add_check),
                    listTile(
                      onTap: () async {
                        await launchWhatsApp(number: supportNumber, text: '');
                      },
                      title: "Support",
                      iconData: Icons.mark_chat_read,
                    ),
                    listTile(
                      onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext ctx) {
                              return Settings(
                                allowToNaviGate: false,
                              );
                            },
                          ),
                        );
                      },
                      title: "Change Language",
                      iconData: Icons.logout_rounded,
                    ),
                    listTile(
                      onTap: () async {
                        logout();
                      },
                      title: "Logout",
                      iconData: Icons.logout_rounded,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget listTile({required onTap, required String title, required IconData iconData}) {
    return ListTile(
      leading: Icon(
        iconData,
        color: primaryColor,
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      onTap: onTap,
    );
  }

  Future<void> launchWhatsApp({required String number, required String text}) async {
    final whatsappAndroid = Uri.parse("whatsapp://send?phone=$number&text=$text");
    try {
      await launchUrl(whatsappAndroid);
    } on Exception catch (e) {
      logger.e(e);
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  void logout() async {
    await AppStorage.box.erase();
    Get.offAll(Settings());
  }
}
