part of '../gmana.dart';

RegExp isbn10MaybeReg = RegExp(isbn10MaybeRegStr);
String isbn10MaybeRegStr = r'^(?:[0-9]{9}X|[0-9]{10})$';
