import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hungerz_ordering/Controllers/TableSelectionController/table_management_controller.dart';
import 'package:hungerz_ordering/Locale/settings_page.dart';
import 'package:hungerz_ordering/Pages/table_selection.dart';
import 'Locale/language_cubit.dart';
import 'Locale/locales.dart';
import 'Routes/routes.dart';
import 'Theme/style.dart';

void main() async {
  await GetStorage.init();

  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.landscapeRight,
  //   DeviceOrientation.landscapeLeft,
  // ]);
  runApp(Phoenix(child: HungerzOrdering()));
}

class HungerzOrdering extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
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
            home: Settings(),
            // TableSelectionPage(),
            routes: PageRoutes().routes(),
          );
        },
      ),
    );
  }
}
