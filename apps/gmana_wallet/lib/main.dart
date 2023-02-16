import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:gmana_wallet/core/utils/utils.dart';
import 'package:gmana_wallet/features/app/app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await FlutterConfig.loadEnvVariables();
  await Supabase.initialize(url: FlutterConfig.get('SUPABASE_URL'), anonKey: FlutterConfig.get('SUPABASE_ANON_KEY'));
  await Hive.initFlutter();
  await Hive.openBox(GConfig.settingsStorageKey);

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode) exit(1);
  };

  runApp(const ProviderScope(child: App()));
}
