import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:wallet_p2p/routes/home_page.dart';
import 'package:wallet_p2p/routes/log_in_page.dart';
import 'package:wallet_p2p/routes/passphrase_sign_in_page.dart';
import 'package:wallet_p2p/routes/passphrase_sign_up_page.dart';
import 'package:wallet_p2p/routes/passphrase_word_page.dart';
import 'package:wallet_p2p/routes/pick_username_page.dart';
import 'package:wallet_p2p/routes/select_account_page.dart';
import 'package:wallet_p2p/routes/staking_page.dart';
import 'package:wallet_p2p/utils/helper_widgets/custom_transition_wrapper.dart';
import 'package:wallet_p2p/utils/services/local_data/secure_storage_service.dart';
import 'package:go_router/go_router.dart';

Page _pageBuilder(Widget child) => CustomTransitionPage(
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          CustomTransitionWrapper(animation: animation, child: child),
    );

final GoRouter router = GoRouter(
    initialLocation: "/",
    // errorBuilder: (context, state) {
    //   return const ErrorPage();
    // },
    redirect: (context, state) async {
      final isLogged =
          (await SecureStorage.read<String?>(SecureCollection.tokenAuth)) !=
              null;

      if (router.requireAuth && !isLogged) return "/auth";

      return null;
    },

    // ? Registered Routes
    routes: [
      // * no require auth
      GoRoute(
          path: '/auth',
          name: 'login',
          pageBuilder: (context, state) => _pageBuilder(const LogInPage()),
          routes: [
            GoRoute(
              path: 'select-account',
              name: 'selectAccount',
              pageBuilder: (context, state) =>
                  _pageBuilder(const SelectAccountPage()),
            ),
            GoRoute(
              path: 'passphrase-signup',
              name: 'passphraseSignup',
              pageBuilder: (context, state) =>
                  _pageBuilder(const PassphraseSignUpPage()),
            ),
            GoRoute(
              path: 'passphrase-signin',
              name: 'passphraseSignin',
              pageBuilder: (context, state) =>
                  _pageBuilder(const PassphraseSigInPage()),
            ),
            GoRoute(
              path: 'passphrase-word',
              name: 'passphraseWord',
              pageBuilder: (context, state) =>
                  _pageBuilder(const PassphraseWordPage()),
            ),
            GoRoute(
              path: 'pick-username',
              name: 'pickUsername',
              pageBuilder: (context, state) =>
                  _pageBuilder(const PickUsernamePage()),
            ),
          ]),

      // * require auth
      GoRoute(
          path: '/',
          name: 'home',
          pageBuilder: (context, state) => _pageBuilder(const HomePage()),
          routes: [
            GoRoute(
              path: 'staking',
              name: 'staking',
              pageBuilder: (context, state) =>
                  _pageBuilder(const StakingPage()),
            ),
          ]),
    ]);

//! //FIXME search better practices
extension GoRouterExtension on GoRouter {
  /// Getter yo know if current route require authentication
  get requireAuth => !router.location.contains('/auth');

  /// Get list of main routes on the [ShellRoute].
  List<RouteBase> get shellRoutes => router.configuration.routes
      .firstWhere((element) => element is ShellRoute)
      .routes;

  /// Get list of sub routes on the [ShellRoute].
  List<RouteBase>? get subShellRoutes => shellRoutes
      .firstWhereOrNull(
          (element) => (element as GoRoute).path.startsWith(location))
      ?.routes;

  /// Get index of the current [ShellRoute] displayed in Page.
  /// Returns -1 if [element] is not found.
  int get indexShellRoute => shellRoutes.indexWhere(
      (element) => (element as GoRoute).path == "/${location.split('/')[1]}");

  /// Get the current [ShellRoute] displayed in Page.
  RouteBase? get shellRoute => indexShellRoute == -1
      ? null
      : shellRoutes.elementAtOrNull(indexShellRoute);
}
