import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet_p2p/utils/config/theme.dart';
import 'package:wallet_p2p/utils/extensions/type_extensions.dart';
import 'package:wallet_p2p/utils/helper_widgets/gap.dart';
import 'package:wallet_p2p/widgets/button_aspect.dart';
import 'package:wallet_p2p/widgets/button.dart';
import 'package:wallet_p2p/widgets/footer.dart';
import 'package:wallet_p2p/widgets/header.dart';
import 'package:wallet_p2p/widgets/scaffold.dart';

class PassphraseSignUpPage extends StatelessWidget {
  const PassphraseSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    const passphrase = [
      "LAWSUIT",
      "FISH",
      "MEAD",
      "SINGULAR",
      "AIRPORT",
      "HEALTH",
      "CIDER",
      "CAR",
      "KOMBUCHA",
      "BEER",
      "RETIRE",
      "SEA"
    ];

    return AppScaffold(
      child: ScaffoldBody(
        body: Column(children: [
          const AppHeader(
            width: 284,
            topText: "PASSPHRASE",
            bottomText: "SIGN UP",
            bottomTextAlign: Alignment.centerLeft,
            desc: "GENERATE AND SAFELY STORE A UNIQUE PASSPHRASE",
            descExpanded: true,
          ),
          const Gap(40).column,
          SizedBox(
            width: double.maxFinite,
            child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                spacing: 10,
                runSpacing: 27,
                children: [
                  for (var i = 0; i < passphrase.length; i++)
                    Stack(clipBehavior: Clip.none, children: [
                      ButtonAspect(
                        constraints: const BoxConstraints(maxWidth: 130),
                        text: passphrase[i],
                        textExpanded: true,
                        bgColor: ThemeApp.colors(context).tertiary,
                        color: ThemeApp.colors(context).text,
                        borderSide: const BorderSide(width: 1),
                        boxShadow: const [],
                        padding: const EdgeInsets.all(0),
                      ),
                      Positioned(
                        top: -12,
                        left: 0,
                        child: ButtonAspect.icon(
                          size: 27,
                          icon: Align(
                            child: Text(
                              (i + 1).toString(),
                              style: TextStyle(
                                fontSize: 16,
                                color: ThemeApp.colors(context).primary,
                                letterSpacing: 1.76,
                                fontWeight: FontWeight.w700,
                                fontFamily: FontFamily.montserrat("700"),
                              ),
                            ),
                          ),
                          bgColor: ThemeApp.colors(context).tertiary,
                          color: ThemeApp.colors(context).text,
                          borderSide: const BorderSide(width: 1),
                          boxShadow: const [],
                        ),
                      ),
                    ])
                ]),
          ),
          const Gap(40).column,
          Row(children: [
            Expanded(
              child: Button(
                  text: "CONTINUE",
                  onPressed: () => context.pushNamed("passphraseWord")),
            ),
            const Gap(13).row,
            Button.icon(
                icon: Image.asset("assets/icons/copy.png"),
                onPressed: () => passphrase
                    .join(" ")
                    .copyToClipboard(message: "Passphrase copied!")),
          ]),
          AppFooter(
            padding: const EdgeInsets.only(top: 49, bottom: 64),
            child: (context, ts, ts2, ts3) => Text.rich(
              TextSpan(children: [
                TextSpan(
                    text: "ALREADY HAVE A PASSPHRASE? ",
                    style: ts3?.copyWith(
                      fontWeight: FontWeight.w400,
                      fontFamily: FontFamily.karla("400"),
                    )),
                TextSpan(
                    text: "SIGN IN",
                    recognizer: TapAndPanGestureRecognizer()
                      ..onTapDown =
                          (_) => context.pushNamed("passphraseSignin"),
                    style: ts3?.copyWith(
                      color: ThemeApp.colors(context).primary,
                      fontWeight: FontWeight.w700,
                      fontFamily: FontFamily.karla("700"),
                    )),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
