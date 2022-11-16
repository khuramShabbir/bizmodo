import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

import '/Controllers/Auth%20Controller/auth_controller.dart';
import '/Controllers/ProductController/all_products_controller.dart';
import '/Controllers/TableSelectionController/table_management_controller.dart';
import '/Controllers/order_type_controller.dart';
import '/Locale/settings_page.dart';
import '/Pages/order_type_selection.dart';
import '/Services/storage_sevices.dart';
import 'Locale/language_cubit.dart';
import 'Locale/locales.dart';
import 'Routes/routes.dart';
import 'Theme/style.dart';

void main() async {
  await GetStorage.init();

  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AuthController());
  Get.put(TableSelectionController());
  Get.put(OrderTypeSelectionController());
  Get.put(AllProductsController());

  runApp(Phoenix(child: HungerzOrdering()));
}

class HungerzOrdering extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageCubit>(
          create: (context) => LanguageCubit(),
        ),
      ],
      child: BlocBuilder<LanguageCubit, Locale>(
        builder: (_, locale) {
          Get.put(TableSelectionController());
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              const AppLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.getSupportedLocales(),
            locale: locale,
            theme: appTheme,
            home: intiScreen(),
            routes: PageRoutes().routes(),
          );
        },
      ),
    );
  }

  Widget intiScreen() {
    if (AppStorage.box.hasData(AppStorage.token) && AppStorage.box.hasData(AppStorage.lang))
      return OrderTypeSelection();
    else
      return Settings();
  }
}
