import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gmana_wallet/core/localization/localization.dart';
import 'package:gmana_wallet/core/routers/routers.dart';
import 'package:gmana_wallet/core/utils/g_theme.dart';
import 'package:gmana_wallet/features/language/language.dart';
import 'package:gmana_wallet/features/theme/theme.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final language = ref.watch(languageProvider);
    GoRouter router = ref.watch(routerProvider);

    return MaterialApp.router(
      routerConfig: router,
      restorationScopeId: 'app',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      locale: Locale(language.language, ''),
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (BuildContext context) => context.loc.appTitle,
      theme: GTheme.light,
      darkTheme: GTheme.dark,
      themeMode: theme.themeMode,
    );
  }
}
