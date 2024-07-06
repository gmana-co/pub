part of '../gmana.dart';

RegExp surrogatePairsReg = RegExp(surrogatePairsRegStr);
String surrogatePairsRegStr = r'[\uD800-\uDBFF][\uDC00-\uDFFF]';
