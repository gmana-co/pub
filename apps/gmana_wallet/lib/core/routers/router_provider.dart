import 'package:flutter/material.dart';
import 'package:gmana_wallet/core/services/auth_service.dart';
import 'package:gmana_wallet/core/widgets/widgets.dart';
import 'package:gmana_wallet/features/account/account.dart';
import 'package:gmana_wallet/features/budgets/budgets.dart';
import 'package:gmana_wallet/features/category/category.dart';
import 'package:gmana_wallet/features/currencies/currencies.dart';
import 'package:gmana_wallet/features/dashboard/dashboard.dart';
import 'package:gmana_wallet/features/error/error_view.dart';
import 'package:gmana_wallet/features/forgot_password/forgot_password.dart';
import 'package:gmana_wallet/features/language/view/language_view.dart';
import 'package:gmana_wallet/features/network/network.dart';
import 'package:gmana_wallet/features/profile/profile.dart';
import 'package:gmana_wallet/features/savings/savings.dart';
import 'package:gmana_wallet/features/settings/settings.dart';
import 'package:gmana_wallet/features/sign_in/sign_in.dart';
import 'package:gmana_wallet/features/sign_up/sign_up.dart';
import 'package:gmana_wallet/features/splash/splash.dart';
import 'package:gmana_wallet/features/theme/theme.dart';
import 'package:gmana_wallet/features/transactions/transactions.dart';
import 'package:gmana_wallet/features/verify/verify.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'go_router_refresh_stream.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final routerProvider = Provider<GoRouter>(
  (ref) {
    var auth = ref.watch(authController);
    return GoRouter(
      debugLogDiagnostics: false,
      navigatorKey: _rootNavigatorKey,
      initialLocation: SplashView.location,
      refreshListenable:
          GoRouterRefreshStream(auth.client.auth.onAuthStateChange),
      redirect: (context, state) {
        final isLoggedIn = auth.isLoggedIn();
        final signIn = state.subloc == SignInView.location;
        // final signUp = state.subloc == SignUpView.location;
        // final forgotPassword = state.subloc == ForgotPasswordView.location;
        final currentLoc = state.subloc.split('/')[1];
        List<String> publish = [
          SignInView.name,
          SignUpView.name,
          VerifyView.name,
          ForgotPasswordView.name
        ];
        final res = publish.contains(currentLoc);

        if (isLoggedIn && signIn) {
          return DashboardView.location;
        } else if (!isLoggedIn && !res) {
          return SignInView.location;
        }

        return null;
      },
      routes: <RouteBase>[
        GoRoute(
          name: SplashView.name,
          path: SplashView.path,
          builder: (context, state) => const SplashView(),
        ),
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: ((context, state, child) => GScaffold(child: child)),
          routes: <RouteBase>[
            GoRoute(
              name: DashboardView.name,
              path: DashboardView.path,
              builder: (context, state) => const DashboardView(),
            ),
            GoRoute(
              name: SavingsView.name,
              path: SavingsView.path,
              builder: (context, state) => const SavingsView(),
            ),
            GoRoute(
              name: TransactionsView.name,
              path: TransactionsView.path,
              builder: (context, state) => const TransactionsView(),
            ),
            GoRoute(
              name: BudgetsView.name,
              path: BudgetsView.path,
              builder: (context, state) => const BudgetsView(),
            ),
            GoRoute(
              name: SettingsView.name,
              path: SettingsView.path,
              builder: (context, state) => const SettingsView(),
              routes: <RouteBase>[
                GoRoute(
                  name: ThemeView.name,
                  path: ThemeView.path,
                  builder: (context, state) => const ThemeView(),
                ),
                GoRoute(
                  name: LanguageView.name,
                  path: LanguageView.path,
                  builder: (context, state) => const LanguageView(),
                ),
                GoRoute(
                  name: ProfileView.name,
                  path: ProfileView.path,
                  builder: (context, state) => const ProfileView(),
                ),
                GoRoute(
                  name: CategoryView.name,
                  path: CategoryView.path,
                  builder: (context, state) => const CategoryView(),
                ),
                GoRoute(
                  name: NetworkView.name,
                  path: NetworkView.path,
                  builder: (context, state) => const NetworkView(),
                ),
                GoRoute(
                  name: AccountView.name,
                  path: AccountView.path,
                  builder: (context, state) => const AccountView(),
                  routes: [
                    GoRoute(
                      name: CurrenciesView.name,
                      path: CurrenciesView.path,
                      builder: (context, state) => const CurrenciesView(),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
        GoRoute(
          name: SignInView.name,
          path: SignInView.path,
          builder: (context, state) => const SignInView(),
        ),
        GoRoute(
          name: SignUpView.name,
          path: SignUpView.path,
          builder: (context, state) => const SignUpView(),
        ),
        GoRoute(
          name: ForgotPasswordView.name,
          path: ForgotPasswordView.path,
          builder: (context, state) => const ForgotPasswordView(),
        ),
        GoRoute(
          name: VerifyView.name,
          path: VerifyView.path,
          builder: (context, state) =>
              VerifyView(email: state.params['email']!),
        ),
      ],
      errorBuilder: (context, state) => ErrorView(state.error!),
    );
  },
);
