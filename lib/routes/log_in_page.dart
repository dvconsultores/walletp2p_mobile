import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet_p2p/pages/email_verification.dart';
import 'package:wallet_p2p/repositories/auth_api.dart';
import 'package:wallet_p2p/utils/config/theme.dart';
import 'package:wallet_p2p/utils/helper_widgets/gap.dart';
import 'package:wallet_p2p/widgets/button.dart';
import 'package:wallet_p2p/widgets/footer.dart';
import 'package:wallet_p2p/widgets/input_field.dart';
import 'package:wallet_p2p/widgets/header.dart';
import 'package:wallet_p2p/widgets/scaffold.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});
  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  late final authApi = AuthApi(context);

  @override
  void initState() {
    authApi.clearTokenAuth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: ScaffoldBody(
        bgImg: 'assets/images/circle-main.png',
        showBgDots: true,
        scrollable: true,
        body: Column(children: [
          const AppHeader(
            showArrow: false,
            width: 251,
            topText: "GET",
            topTextAlign: Alignment.centerLeft,
            bottomText: "STARTED",
            bottomTextAlign: Alignment.centerRight,
            desc: "SIGN IN OR REGISTER TO JOIN THE FUN",
          ),
          const Gap(309).column,
          InputField.sizedBox(
            height: 45,
            hintText: "EMAIL",
          ),
          const Gap(15).column,
          Button(
            text: "CONTINUE",
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const EmailVerificationPage(),
            )),
          ),
          const Gap(23).column,
          Text("OR",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontFamily: FontFamily.karla("700"),
                  )),
          const Gap(12).column,
          Button(
            text: "CONTINUE WITH GOOGLE",
            leading: Image.asset('assets/icons/gmail.png'),
            leadingGap: 20,
            color: ThemeApp.colors(context).text,
            bgColor: ThemeApp.colors(context).tertiary,
            boxShadow: const [],
            borderSide:
                BorderSide(color: ThemeApp.colors(context).text, width: 1),
            onPressed: () => context.goNamed("selectAccount"),
          ),
          const Gap(15).column,
          Button(
            text: "CONTINUE WITH PASSPHRASE",
            color: ThemeApp.colors(context).text,
            bgColor: ThemeApp.colors(context).tertiary,
            boxShadow: const [],
            borderSide:
                BorderSide(color: ThemeApp.colors(context).text, width: 1),
            onPressed: () => context.goNamed("passphraseSignup"),
          ),
          const Gap(22).column,
          AppFooter(
              child: (context, ts, ts2, ts3) =>
                  Text("PRIVACY POLICY", style: ts3)),
        ]),
      ),
    );
  }
}
