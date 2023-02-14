import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'g_color.dart';

class IconList {
  static Icon getIcon(String name, [double? size]) {
    double size0 = (size ?? 20);
    switch (name.toLowerCase()) {
      case 'wallet':
        return Icon(
          FontAwesomeIcons.wallet,
          color: const Color(0xFFFFFFFF),
          size: size0,
        );
      case 'asset':
        return Icon(FontAwesomeIcons.fileInvoiceDollar, color: const Color(0xFFFFFFFF), size: size0);
      case 'cash':
        return Icon(FontAwesomeIcons.moneyBill1, color: const Color(0xFFFFFFFF), size: size0);
      case 'checking':
        return Icon(FontAwesomeIcons.solidCreditCard, color: const Color(0xFFFFFFFF), size: size0);
      case 'credit card':
        return Icon(FontAwesomeIcons.ccVisa, color: const Color(0xFFFFFFFF), size: size0);
      case 'debit card':
        return Icon(FontAwesomeIcons.solidCreditCard, color: const Color(0xFFFFFFFF), size: size0);
      case 'investment':
        return Icon(FontAwesomeIcons.chartArea, color: const Color(0xFFFFFFFF), size: size0);
      case 'loan':
        return Icon(FontAwesomeIcons.handHoldingDollar, color: const Color(0xFFFFFFFF), size: size0);
      case 'savings':
        return Icon(FontAwesomeIcons.piggyBank, color: const Color(0xFFFFFFFF), size: size0);
      case 'other':
        return Icon(FontAwesomeIcons.wallet, color: const Color(0xFFFFFFFF), size: size0);
      default:
        return Icon(FontAwesomeIcons.wallet, color: const Color(0xFFFFFFFF), size: size0);
    }
  }

  static Color getColor(String name) {
    switch (name.toLowerCase()) {
      case 'wallet':
        return GColors.accentColors[0];
      case 'asset':
        return GColors.accentColors[3];
      case 'cash':
        return GColors.accentColors[5];
      case 'checking':
        return GColors.accentColors[9];
      case 'credit card':
        return GColors.accentColors[6];
      case 'debit card':
        return GColors.accentColors[7];
      case 'investment':
        return GColors.accentColors[1];
      case 'loan':
        return GColors.accentColors[2];
      case 'savings':
        return GColors.accentColors[4];
      case 'other':
        return GColors.accentColors[3];
      default:
        return GColors.accentColors[0];
    }
  }

  static Color getDarkColor(String name) {
    switch (name.toLowerCase()) {
      case 'wallet':
        return GColors.darkAccentColors[0];
      case 'asset':
        return GColors.darkAccentColors[3];
      case 'cash':
        return GColors.darkAccentColors[5];
      case 'checking':
        return GColors.darkAccentColors[9];
      case 'credit card':
        return GColors.darkAccentColors[6];
      case 'debit card':
        return GColors.darkAccentColors[7];
      case 'investment':
        return GColors.darkAccentColors[1];
      case 'loan':
        return GColors.darkAccentColors[2];
      case 'savings':
        return GColors.darkAccentColors[4];
      case 'other':
        return GColors.darkAccentColors[3];
      default:
        return GColors.darkAccentColors[0];
    }
  }

  static Color getLightColor(String name) {
    switch (name.toLowerCase()) {
      case 'wallet':
        return GColors.lightAccentColors[0];
      case 'asset':
        return GColors.lightAccentColors[3];
      case 'cash':
        return GColors.lightAccentColors[5];
      case 'checking':
        return GColors.lightAccentColors[9];
      case 'credit card':
        return GColors.lightAccentColors[6];
      case 'debit card':
        return GColors.lightAccentColors[7];
      case 'investment':
        return GColors.lightAccentColors[1];
      case 'loan':
        return GColors.lightAccentColors[2];
      case 'savings':
        return GColors.lightAccentColors[4];
      case 'other':
        return GColors.lightAccentColors[3];
      default:
        return GColors.lightAccentColors[0];
    }
  }
}
