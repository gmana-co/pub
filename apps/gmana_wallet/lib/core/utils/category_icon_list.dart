import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'g_color.dart';

Icon getExpenseIcon(String name, [double? size]) {
  double size0 = (size ?? 20);
  switch (name.toLowerCase()) {
    case 'auto':
      return Icon(
        FontAwesomeIcons.car,
        color: GColors.textColor,
        size: size0,
      );
    case 'bank charge':
      return Icon(FontAwesomeIcons.fileInvoiceDollar, color: GColors.textColor, size: size0);
    case 'cash':
      return Icon(FontAwesomeIcons.moneyBill, color: GColors.textColor, size: size0);
    case 'charity':
      return Icon(FontAwesomeIcons.circleDollarToSlot, color: GColors.textColor, size: size0);
    case 'childcare':
      return Icon(FontAwesomeIcons.baby, color: GColors.textColor, size: size0);
    case 'clothing':
      return Icon(FontAwesomeIcons.shirt, color: GColors.textColor, size: size0);
    case 'credit card':
      return Icon(FontAwesomeIcons.solidCreditCard, color: GColors.textColor, size: size0);
    case 'dining':
      return Icon(FontAwesomeIcons.utensils, color: GColors.textColor, size: size0);
    case 'eating out':
      return Icon(FontAwesomeIcons.utensils, color: GColors.textColor, size: size0);
    case 'education':
      return Icon(FontAwesomeIcons.school, color: GColors.textColor, size: size0);
    case 'entertainment':
      return Icon(FontAwesomeIcons.champagneGlasses, color: GColors.textColor, size: size0);
    case 'gifts':
      return Icon(FontAwesomeIcons.gift, color: GColors.textColor, size: size0);
    case 'groceries':
      return Icon(FontAwesomeIcons.basketShopping, color: GColors.textColor, size: size0);
    case 'grooming':
      return Icon(FontAwesomeIcons.scissors, color: GColors.textColor, size: size0);
    case 'health':
      return Icon(FontAwesomeIcons.suitcaseMedical, color: GColors.textColor, size: size0);
    case 'holiday':
      return Icon(FontAwesomeIcons.plane, color: GColors.textColor, size: size0);
    case 'home repair':
      return Icon(FontAwesomeIcons.hammer, color: GColors.textColor, size: size0);
    case 'household':
      return Icon(FontAwesomeIcons.toiletPaper, color: GColors.textColor, size: size0);
    case 'insurance':
      return Icon(FontAwesomeIcons.carBurst, color: GColors.textColor, size: size0);
    case 'investment':
      return Icon(FontAwesomeIcons.scaleUnbalanced, color: GColors.textColor, size: size0);
    case 'loan':
      return Icon(FontAwesomeIcons.moneyCheck, color: GColors.textColor, size: size0);
    case 'medical':
      return Icon(FontAwesomeIcons.capsules, color: GColors.textColor, size: size0);
    case 'misc':
      return Icon(FontAwesomeIcons.box, color: GColors.textColor, size: size0);
    case 'mortgage':
      return Icon(FontAwesomeIcons.house, color: GColors.textColor, size: size0);
    case 'others':
      return Icon(FontAwesomeIcons.dollarSign, color: GColors.textColor, size: size0);
    case 'pets':
      return Icon(FontAwesomeIcons.dog, color: GColors.textColor, size: size0);
    case 'rent':
      return Icon(FontAwesomeIcons.houseUser, color: GColors.textColor, size: size0);
    case 'tax':
      return Icon(FontAwesomeIcons.fileInvoice, color: GColors.textColor, size: size0);
    case 'transport':
      return Icon(FontAwesomeIcons.bus, color: GColors.textColor, size: size0);
    case 'travel':
      return Icon(FontAwesomeIcons.earthAsia, color: GColors.textColor, size: size0);
    case 'utilities':
      return Icon(FontAwesomeIcons.solidLightbulb, color: GColors.textColor, size: size0);
    case 'utilities: cable tv':
      return Icon(FontAwesomeIcons.tv, color: GColors.textColor, size: size0);
    case 'utilities: garbage':
      return Icon(FontAwesomeIcons.solidTrashCan, color: GColors.textColor, size: size0);
    case 'utilities: gas & electric':
      return Icon(FontAwesomeIcons.chargingStation, color: GColors.textColor, size: size0);
    case 'utilities: internet':
      return Icon(FontAwesomeIcons.wifi, color: GColors.textColor, size: size0);
    case 'utilities: telephone':
      return Icon(FontAwesomeIcons.mobileScreenButton, color: GColors.textColor, size: size0);
    case 'utilities: water':
      return Icon(FontAwesomeIcons.shower, color: GColors.textColor, size: size0);
    default:
      return Icon(FontAwesomeIcons.dollarSign, color: GColors.textColor, size: size0);
  }
}

Color getExpenseColor(String name) {
  switch (name.toLowerCase()) {
    case 'auto':
      return GColors.darken(GColors.accentColors[2], 0.2);
    case 'bank charge':
      return GColors.darken(GColors.accentColors[2], 0.19);
    case 'cash':
      return GColors.darken(GColors.accentColors[2], 0.18);
    case 'charity':
      return GColors.darken(GColors.accentColors[2], 0.17);
    case 'childcare':
      return GColors.darken(GColors.accentColors[2], 0.16);
    case 'clothing':
      return GColors.darken(GColors.accentColors[2], 0.14);
    case 'credit card':
      return GColors.darken(GColors.accentColors[2], 0.13);
    case 'dining':
      return GColors.darken(GColors.accentColors[2], 0.12);
    case 'eating out':
      return GColors.darken(GColors.accentColors[2], 0.11);
    case 'education':
      return GColors.darken(GColors.accentColors[2], 0.1);
    case 'entertainment':
      return GColors.darken(GColors.accentColors[2], 0.09);
    case 'gifts':
      return GColors.darken(GColors.accentColors[2], 0.08);
    case 'groceries':
      return GColors.darken(GColors.accentColors[2], 0.07);
    case 'grooming':
      return GColors.darken(GColors.accentColors[2], 0.06);
    case 'health':
      return GColors.darken(GColors.accentColors[2], 0.04);
    case 'holiday':
      return GColors.darken(GColors.accentColors[2], 0.03);
    case 'home repair':
      return GColors.darken(GColors.accentColors[2], 0.02);
    case 'household':
      return GColors.darken(GColors.accentColors[2], 0.01);
    case 'insurance':
      return GColors.accentColors[2];
    case 'investment':
      return GColors.lighten(GColors.accentColors[2], 0.01);
    case 'loan':
      return GColors.lighten(GColors.accentColors[2], 0.02);
    case 'medical':
      return GColors.lighten(GColors.accentColors[2], 0.03);
    case 'misc':
      return GColors.lighten(GColors.accentColors[2], 0.04);
    case 'mortgage':
      return GColors.lighten(GColors.accentColors[2], 0.06);
    case 'others':
      return GColors.lighten(GColors.accentColors[2], 0.07);
    case 'pets':
      return GColors.lighten(GColors.accentColors[2], 0.08);
    case 'rent':
      return GColors.lighten(GColors.accentColors[2], 0.09);
    case 'tax':
      return GColors.lighten(GColors.accentColors[2], 0.1);
    case 'transport':
      return GColors.lighten(GColors.accentColors[2], 0.11);
    case 'travel':
      return GColors.lighten(GColors.accentColors[2], 0.12);
    case 'utilities':
      return GColors.lighten(GColors.accentColors[2], 0.13);
    case 'utilities: cable tv':
      return GColors.lighten(GColors.accentColors[2], 0.14);
    case 'utilities: garbage':
      return GColors.lighten(GColors.accentColors[2], 0.16);
    case 'utilities: gas & electric':
      return GColors.lighten(GColors.accentColors[2], 0.17);
    case 'utilities: internet':
      return GColors.lighten(GColors.accentColors[2], 0.18);
    case 'utilities: telephone':
      return GColors.lighten(GColors.accentColors[2], 0.19);
    case 'utilities: water':
      return GColors.lighten(GColors.accentColors[2], 0.2);
    default:
      return GColors.accentColors[2];
  }
}

Icon getIncomeIcon(String name, [double? size]) {
  double size0 = (size ?? 20);
  switch (name.toLowerCase()) {
    case 'bonus':
      return Icon(FontAwesomeIcons.gift, color: GColors.textColor, size: size0);
    case 'investment':
      return Icon(FontAwesomeIcons.scaleUnbalancedFlip, color: GColors.textColor, size: size0);
    case 'loan payment':
      return Icon(FontAwesomeIcons.fileInvoiceDollar, color: GColors.textColor, size: size0);
    case 'misc':
      return Icon(FontAwesomeIcons.box, color: GColors.textColor, size: size0);
    case 'others':
      return Icon(FontAwesomeIcons.dollarSign, color: GColors.textColor, size: size0);
    case 'salary':
      return Icon(FontAwesomeIcons.moneyCheckDollar, color: GColors.textColor, size: size0);
    case 'deposit':
      return Icon(FontAwesomeIcons.moneyCheck, color: GColors.textColor, size: size0);
    case 'tax refund':
      return Icon(FontAwesomeIcons.fileInvoice, color: GColors.textColor, size: size0);
    default:
      return Icon(FontAwesomeIcons.dollarSign, color: GColors.textColor, size: size0);
  }
}

Color getIncomeColor(String name) {
  switch (name.toLowerCase()) {
    case 'bonus':
      return GColors.darken(GColors.accentColors[0], 0.15);
    case 'investment':
      return GColors.darken(GColors.accentColors[0], 0.1);
    case 'loan payment':
      return GColors.darken(GColors.accentColors[0], 0.05);
    case 'misc':
      return GColors.accentColors[0];
    case 'others':
      return GColors.darken(GColors.accentColors[0], 0.05);
    case 'salary':
      return GColors.darken(GColors.accentColors[0], 0.1);
    case 'deposit':
      return GColors.darken(GColors.accentColors[0], 0.15);
    case 'tax refund':
      return GColors.darken(GColors.accentColors[0], 0.2);
    default:
      return GColors.accentColors[0];
  }
}
