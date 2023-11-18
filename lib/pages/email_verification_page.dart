import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet_p2p/repositories/auth_api.dart';
import 'package:wallet_p2p/utils/config/theme.dart';
import 'package:wallet_p2p/utils/helper_widgets/gap.dart';
import 'package:wallet_p2p/utils/helper_widgets/otp_text_field.dart';
import 'package:wallet_p2p/widgets/button.dart';
import 'package:wallet_p2p/widgets/footer.dart';
import 'package:wallet_p2p/widgets/header.dart';
import 'package:wallet_p2p/widgets/scaffold.dart';

class EmailVerificationPage extends StatelessWidget {
  const EmailVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authApi = AuthApi(context);
    void onTapSupport() => debugPrint("on tap support text");

    void verify() => authApi.signIn().then((_) {
          Navigator.pop(context);
          context.goNamed("home");
        });

    return AppScaffold(
      child: ScaffoldBody(
        bgImg: 'assets/images/circle-avatar.png',
        scrollable: true,
        body: Column(children: [
          const AppHeader(
            width: 300,
            topText: "OTP",
            topTextPaddingRight: 65,
            topTextAlign: Alignment.centerRight,
            bottomText: "VERIFICATION",
            desc:
                "ENTER THE VERIFICATION CODE WE JUST SENT ON YOUR EMAIL ADDRESS",
            descExpanded: true,
          ),
          const Gap(288).column,
          OtpTextField(
            filled: true,
            showFieldAsBox: true,
            fillColor: ThemeApp.colors(context).tertiary,
            fieldWidth: 61,
            borderWidth: 2,
            borderRadius: BorderRadius.circular(50),
            enabledBorderColor: ThemeApp.colors(context).accent,
            gap: 23,
            textStyle: const TextStyle(),
          ),
          const Gap(22).column,
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("RESEND CODE IN",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                      fontFamily: FontFamily.karla("400"),
                    )),
            Text("2:13",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ThemeApp.colors(context).error,
                      fontWeight: FontWeight.w700,
                      fontFamily: FontFamily.karla("700"),
                    )),
          ]),
          const Gap(21).column,
          Button(text: "VERIFY", onPressed: verify),
          const Gap(122).column,
          AppFooter(
              child: (context, ts, ts2, ts3) => Text.rich(TextSpan(children: [
                    TextSpan(text: "NEED HELP? ", style: ts2),
                    TextSpan(
                      text: "SUPPORT",
                      recognizer: TapAndPanGestureRecognizer()
                        ..onTapDown = (_) => onTapSupport(),
                      style: ts3?.copyWith(
                          color: ThemeApp.colors(context).primary),
                    ),
                  ]))),
        ]),
      ),
    );
  }
}
