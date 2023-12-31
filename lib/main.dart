import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallet_p2p/blocs/main_bloc.dart';
import 'package:wallet_p2p/utils/config/router_config.dart';
import 'package:wallet_p2p/utils/config/session_timeout_config.dart';
import 'package:wallet_p2p/utils/config/theme.dart';
import 'package:wallet_p2p/utils/general/variables.dart';
import 'package:wallet_p2p/utils/helper_widgets/restart_widget.dart';
import 'package:wallet_p2p/main_provider.dart';
import 'package:wallet_p2p/utils/config/config.dart';
import 'package:wallet_p2p/utils/services/dio_service.dart';
import 'package:wallet_p2p/utils/services/local_data/hive_data_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:local_session_timeout/local_session_timeout.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final globalNavigatorKey = GlobalKey<NavigatorState>();
final globalScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ? -- config to dotenv 🖊️ --
  await dotenv
      .load(fileName: '.env')
      .catchError((error) => debugPrint('Error loading .env file: $error ㊗️'));

  Hive.initFlutter().then((_) => Hive.openBox(HiveData.boxName).then((value) {
        runApp(const RestartWidget(child: AppState()));
      }));
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Color.fromRGBO(9, 105, 254, 1),
        systemNavigationBarColor: Color.fromRGBO(9, 105, 254, 1),
      ));
    }

    // * Route blocs
    return BlocProvider<MainBloc>(
      bloc: MainBloc(),
      // * Main Provider
      child: ChangeNotifierProvider<MainProvider>(
        create: (context) => MainProvider(),
        child: const App(),
      ),
    );
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final sessionTimeoutConfig = SessionTimeoutConfig(context);

  @override
  void initState() {
    DioService.init();
    sessionTimeoutConfig.listen();
    super.initState();
  }

  @override
  void dispose() {
    sessionTimeoutConfig.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      Consumer<MainProvider>(builder: (context, value, child) {
        return SessionTimeoutManager(
          sessionConfig: sessionTimeoutConfig.instance,
          child: ScreenUtilInit(
              designSize: Variables.mSize,
              builder: (context, child) {
                return MaterialApp.router(
                  scaffoldMessengerKey: globalScaffoldMessengerKey,
                  locale: value.locale,
                  debugShowCheckedModeBanner: false,
                  title: AppName.capitalize.value,
                  theme: ThemeApp.of(context), // * Theme switcher
                  localizationsDelegates:
                      AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  routerConfig: router,
                  // // * global text scale factorized
                  // builder: (context, child) {
                  //   return MediaQuery(
                  //     data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                  //     child: child!,
                  //   );
                  // },
                );
              }),
        );
      });
}
