import 'package:flutter/material.dart';
import 'package:hungerz_ordering/Pages/home_page.dart';
import 'package:hungerz_ordering/Pages/login.dart';
import 'package:hungerz_ordering/Pages/table_selection.dart';

class PageRoutes {
  static const String homePage = 'home_page';
  static const String loginPage = 'login_page';
  static const String tableSelectionPage = 'tableSelectionPage';

  Map<String, WidgetBuilder> routes() {
    return {
      homePage: (context) => HomePage(null),
      tableSelectionPage: (context) => TableSelectionPage(),
      loginPage: (context) => LoginPage(),
    };
  }
}
