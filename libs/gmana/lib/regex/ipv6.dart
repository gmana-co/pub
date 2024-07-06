part of '../gmana.dart';

RegExp ipv6 = RegExp(ipv6Str);
String ipv6Str = r'^::|^::1|^([a-fA-F0-9]{1,4}::?){1,7}([a-fA-F0-9]{1,4})$';
