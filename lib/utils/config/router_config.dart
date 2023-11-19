import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:wallet_p2p/main.dart';
import 'package:wallet_p2p/routes/account_details_page.dart';
import 'package:wallet_p2p/routes/collectible_details_page.dart';
import 'package:wallet_p2p/routes/collectibles_page.dart';
import 'package:wallet_p2p/routes/connect_with_near_page.dart';
import 'package:wallet_p2p/routes/explore_page.dart';
import 'package:wallet_p2p/routes/home_page.dart';
import 'package:wallet_p2p/routes/limited_permissions_page.dart';
import 'package:wallet_p2p/routes/log_in_page.dart';
import 'package:wallet_p2p/routes/passphrase_sign_in_page.dart';
import 'package:wallet_p2p/routes/passphrase_sign_up_page.dart';
import 'package:wallet_p2p/routes/passphrase_word_page.dart';
import 'package:wallet_p2p/routes/pick_username_page.dart';
import 'package:wallet_p2p/routes/select_account_page.dart';
import 'package:wallet_p2p/routes/send_details_page.dart';
import 'package:wallet_p2p/routes/send_page.dart';
import 'package:wallet_p2p/routes/send_qr_page.dart';
import 'package:wallet_p2p/routes/staking_page.dart';
import 'package:wallet_p2p/routes/transfer_nft_page.dart';
import 'package:wallet_p2p/utils/helper_widgets/custom_transition_wrapper.dart';
import 'package:wallet_p2p/utils/helper_widgets/double_back_to_close_widget.dart';
import 'package:wallet_p2p/utils/services/local_data/secure_storage_service.dart';
import 'package:go_router/go_router.dart';

Page _topLevelPageBuilder(Widget child) => _pageBuilder(DoubleBackToCloseWidget(
      snackBarMessage: "Press again to leave",
      child: child,
    ));

Page _pageBuilder(Widget child) => CustomTransitionPage(
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          CustomTransitionWrapper(animation: animation, child: child),
      child: child,
    );

final GoRouter router = GoRouter(
    navigatorKey: globalNavigatorKey,
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
          pageBuilder: (context, state) =>
              _topLevelPageBuilder(const LogInPage()),
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
          pageBuilder: (context, state) =>
              _topLevelPageBuilder(const HomePage()),
          routes: [
            GoRoute(
              path: 'staking',
              name: 'staking',
              pageBuilder: (context, state) =>
                  _pageBuilder(const StakingPage()),
            ),
            GoRoute(
              path: 'explore',
              name: 'explore',
              pageBuilder: (context, state) =>
                  _pageBuilder(const ExplorePage()),
            ),
            GoRoute(
              path: 'account-details',
              name: 'accountDetails',
              pageBuilder: (context, state) =>
                  _pageBuilder(const AccountDetailsPage()),
            ),
            GoRoute(
              path: 'connect-with-near',
              name: 'connectWithNear',
              pageBuilder: (context, state) =>
                  _pageBuilder(const ConnectWithNearPage()),
            ),
            GoRoute(
              path: 'limited-permissions',
              name: 'limitedPermissions',
              pageBuilder: (context, state) =>
                  _pageBuilder(const LimitedPermissionsPage()),
            ),
            GoRoute(
              path: 'send',
              name: 'send',
              pageBuilder: (context, state) => _pageBuilder(const SendPage()),
            ),
            GoRoute(
              path: 'send-details',
              name: 'sendDetails',
              pageBuilder: (context, state) =>
                  _pageBuilder(const SendDetailsPage()),
            ),
            GoRoute(
              path: 'send-qr',
              name: 'sendQr',
              pageBuilder: (context, state) => _pageBuilder(const SendQrPage()),
            ),
            GoRoute(
              path: 'collectibles',
              name: 'collectibles',
              pageBuilder: (context, state) =>
                  _pageBuilder(const CollectiblesPage()),
            ),
            GoRoute(
              path: 'collectible-details',
              name: 'collectibleDetails',
              pageBuilder: (context, state) =>
                  _pageBuilder(const CollectibleDetailsPage()),
            ),
            GoRoute(
              path: 'transfer-nft',
              name: 'transferNft',
              pageBuilder: (context, state) =>
                  _pageBuilder(const TransferNftPage()),
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
