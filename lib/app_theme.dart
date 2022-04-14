import 'package:flutter/material.dart';

import 'constats/constants.dart';

class AppTheme {
  static ThemeData lightMode = ThemeData(
      scaffoldBackgroundColor: scaffuldBgColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: scaffuldBgColor,
        centerTitle: false,
      ),
      textTheme: const TextTheme(
        //* headLine5 = 24 pt FW 500
        //* headLine6 = 16 pt FW 400

        //* bodyText1 = 16 pt FW 500
        //* bodyText2 = 14 pt FW 500

        //* subtitle2 = 12 pt FW 400

        //* Head Line Texts
        headline6: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
        headline5: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),

        //* Body Texts
        bodyText1: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        bodyText2: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        subtitle2: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Color(0xFFBCBCBC),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: scaffuldBgColor,
      ));
}
