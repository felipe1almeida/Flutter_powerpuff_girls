import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

ThemeData themeApp = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  dividerColor: colorDividerList,
  textTheme: GoogleFonts.poppinsTextTheme(),
  primaryColor: colorPrimary,
  scaffoldBackgroundColor: colorBackground,
);
