import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hungerz_ordering/Components/bottom_bar.dart';
import 'package:hungerz_ordering/Config/app_config.dart';
import 'package:hungerz_ordering/Controllers/Auth%20Controller/auth_controller.dart';
import 'package:hungerz_ordering/Controllers/ProductController/all_products_controller.dart';
import 'package:hungerz_ordering/Controllers/TableSelectionController/table_management_controller.dart';
import 'package:hungerz_ordering/Pages/login.dart';
import 'package:hungerz_ordering/Routes/routes.dart';
import 'package:hungerz_ordering/Services/storage_sevices.dart';
import 'package:hungerz_ordering/Theme/colors.dart';

import 'language_cubit.dart';

class LanguageList {
  final String? title;

  LanguageList({this.title});
}

class Settings extends StatefulWidget {
  final isForSetting;
  final bool allowToNaviGate;
  Settings({
    this.isForSetting = false,
    this.allowToNaviGate = true,
  });
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool sliderValue = false;
  late LanguageCubit _languageCubit;
  String? selectedLocal;

  @override
  void initState() {
    super.initState();
    _languageCubit = BlocProvider.of<LanguageCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text('Change Language',
            style: Theme.of(context).textTheme.headline5!.copyWith(fontWeight: FontWeight.bold)),
        titleSpacing: 0,
        leading: widget.isForSetting
            ? IconButton(
                icon: Icon(
                  Icons.chevron_left,
                  size: 30,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            : null,
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              BlocBuilder<LanguageCubit, Locale>(
                builder: (context, currentLocale) {
                  selectedLocal ??= currentLocale.languageCode;
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: AppConfig.languagesSupported.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => RadioListTile(
                      value: AppConfig.languagesSupported.keys.elementAt(index),
                      groupValue: selectedLocal,
                      title: Text(
                        AppConfig
                            .languagesSupported[AppConfig.languagesSupported.keys.elementAt(index)]!
                            .name,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(color: blackColor),
                      ),
                      onChanged: (langCode) => setState(() {
                        selectedLocal = langCode as String;
                      }),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 100,
              ),
            ],
            physics: BouncingScrollPhysics(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomBar(
              text: 'Submit',
              onTap: () async {
                await AppStorage.write(AppStorage.lang, selectedLocal);
                _languageCubit.setCurrentLanguage(AppStorage.lang, true);
                if (widget.allowToNaviGate)
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return LoginPage();
                      },
                    ),
                  );
                else {
                  Navigator.pop(context);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
