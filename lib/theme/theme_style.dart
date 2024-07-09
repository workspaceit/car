import 'package:car_dealer_app/theme/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const double defaultElevation = 1.50;

// final accessToken = 'K4Dudn270MoUIM8K67ruHvkO7BLT8Q';


final listLeadingTextStyle = GoogleFonts.sourceSansPro(
    fontSize: 18,color: themeTextColor, fontWeight: FontWeight.w600,fontStyle: FontStyle.normal
);
final listTrailingTextStyle = GoogleFonts.sourceSansPro(
    fontSize: 16,color:  Color.fromRGBO(60, 82, 104, 0.85), fontWeight: FontWeight.w400,fontStyle: FontStyle.normal
);

final appTextFieldTextStyle = GoogleFonts.sourceSansPro(
  fontSize: 18,color: themeTextColor,
);

final buttonTitleTextStyle = GoogleFonts.sourceSansPro(
  fontSize: 20,color: themeWhiteColor,fontWeight: FontWeight.w600,
);
final socialButtonTextStyle = GoogleFonts.sourceSansPro(
  fontSize: 20,color: themeTextColor,fontWeight: FontWeight.w600,
);
final buttonSubTextStyle = GoogleFonts.sourceSansPro(
  fontSize: 18,color: themeWhiteColor,fontWeight: FontWeight.w600,
);

final gcTitleTextStyle = GoogleFonts.sourceSansPro(
    fontSize: 20,color: themeTextColor,fontWeight: FontWeight.bold
);

final currencyTextStyle = GoogleFonts.sourceSansPro(
    fontSize: 12,color: themeCurrencyColor,fontWeight: FontWeight.bold
);

final statusTextStyle = GoogleFonts.sourceSansPro(
    fontSize: 12,color: themeStatusColor,fontWeight: FontWeight.bold
);

final gcSubTitleTextStyle = GoogleFonts.sourceSansPro(
  fontSize: 16,color: themeTextColor,
);

final gcNormalTextStyle = GoogleFonts.sourceSansPro(
  fontSize: 14,color: themeTextColor,
);

final gcDescriptionTextStyle = GoogleFonts.sourceSansPro(
    fontSize: 10,color: listDescriptionColor
);

final gcUnderlinedTextStyle = GoogleFonts.sourceSansPro(
    fontSize: 14,color: themeTextColor,decoration: TextDecoration.underline
);

final gcPlaceholderTextStyle = GoogleFonts.sourceSansPro(
    fontSize: 16,color: Colors.grey
);

final gcInputFieldTextStyle = GoogleFonts.sourceSansPro(
    fontSize: 16,color:Colors.white
);


final gcListTitleTextStyle = GoogleFonts.sourceSansPro(
  fontSize: 16,color: listTileColor,
);

final listSubTitleTextStyle = GoogleFonts.sourceSansPro(
  fontSize: 14,color: listSubTitleColor,
);

/// scaffold > title
final ScaffoldAppBarTitle = TextStyle(
  fontSize: 18,
  color:themeWhiteColor,
);

/// scaffold > icon text
const ScaffoldAppBarIconText = TextStyle(
  color: Color.fromRGBO(105, 105, 105, 1),
);

/// scaffold > drawer > navigation text
const ScaffoldAppBarDrawer = TextStyle(
  fontSize: 15,
  color: Colors.white,
);

const normalBodyTextWithGreyColor = TextStyle(
  fontSize: 15,
  color: Colors.grey,
);

const greenTitleTextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: Colors.lightGreen,
);

const buttonTitleStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w300,
  color: Colors.white,
);

/// Card > Title
const CardTitle = TextStyle(color: Color.fromRGBO(105, 105, 105, 1), fontSize: 15.0, fontWeight: FontWeight.bold);

// Input > focusBorder
const FormFocusBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: Color.fromRGBO(44, 160, 28, 1),
    ));

final InputBorderUnderlined = UnderlineInputBorder(
  //borderRadius: BorderRadius.circular(50),
  borderSide: BorderSide(color: Colors.green.withOpacity(0.5), width: 1),
);
// Input > labelColor
const FormInputLabel = TextStyle(color: Color.fromRGBO(0, 0, 0, 1), fontSize: 12.0);

// Input > labelStyle
const FormInputLabelStyle = TextStyle(color: Color.fromRGBO(105, 105, 105, 1), fontSize: 14.0);

// PopupMenuButton > Style
const PopupMenuItemTextStyle = TextStyle(
  fontSize: 14.0,
  color: Color.fromRGBO(105, 105, 105, 1),
);

// PopupMenuButton > Style
const PopupMenuItemHeight = 25.0;

// SubNavigationButton > Style > Non-Active
const subNavNonActiveTextStyle = TextStyle(fontWeight: FontWeight.normal);

// AlertDialog > title
const AlertDialogTitleTextStyle = TextStyle(color: Color.fromRGBO(105, 105, 105, 1), fontWeight: FontWeight.w500, fontSize: 20.0);
