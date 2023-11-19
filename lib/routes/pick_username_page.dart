import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_p2p/utils/config/theme.dart';
import 'package:wallet_p2p/utils/general/variables.dart';
import 'package:wallet_p2p/utils/helper_widgets/gap.dart';
import 'package:wallet_p2p/widgets/button.dart';
import 'package:wallet_p2p/widgets/custom_card.dart';
import 'package:wallet_p2p/widgets/footer.dart';
import 'package:wallet_p2p/widgets/header.dart';
import 'package:wallet_p2p/widgets/input_field.dart';
import 'package:wallet_p2p/widgets/scaffold.dart';

class PickUsernamePage extends StatelessWidget {
  const PickUsernamePage({super.key});

  @override
  Widget build(BuildContext context) {
    void onTapSupport() => debugPrint("on tap support");

    return AppScaffold(
      child: ScaffoldBody(
        scrollable: true,
        body: Column(children: [
          const AppHeader(
            width: 283,
            topText: "PICK A",
            topTextAlign: Alignment.centerRight,
            bottomText: "USERNAME",
            desc: "THIS WILL BE YOUR LEGIBLE WALLET ADDRESS",
          ),
          const Gap(47).column,
          InputField.sizedBox(
            height: 45,
            hintText: "USERNAME / WALLET",
            hintStyle: TextStyle(
              fontSize: 10,
              color: ThemeApp.colors(context).text,
              letterSpacing: 3.9,
              fontWeight: FontWeight.w700,
              fontFamily: FontFamily.karla("700"),
            ),
          ),
          Button(
            margin: const EdgeInsets.only(top: 18),
            text: "SIGN UP",
            onPressed: () {},
          ),
          const Gap(47).column,
          CustomCard(
              constraints: const BoxConstraints(minHeight: 61),
              child: Row(children: [
                SvgPicture.asset("assets/icons/info-white.svg", width: 36),
                const Gap(11).row,
                Expanded(
                    child: Text.rich(
                  TextSpan(children: [
                    TextSpan(
                        text: "NOTE: ",
                        style:
                            TextStyle(color: ThemeApp.colors(context).primary)),
                    const TextSpan(
                        text:
                            "By skiping the username setup your wallet address will be a non-legible one."),
                  ]),
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontFamily: FontFamily.karla("400"),
                      ),
                )),
              ])),
          // const Gap(324).column,
        ]),
        footer: AppFooter(
          padding: const EdgeInsets.only(top: Variables.gapWithFooter),
          child: (context, ts, ts2, ts3) => Text.rich(TextSpan(children: [
            TextSpan(text: "NEED HELP? ", style: ts2),
            TextSpan(
                text: "SUPPORT",
                recognizer: TapAndPanGestureRecognizer()
                  ..onTapDown = (_) => onTapSupport,
                style: ts3?.copyWith(color: ThemeApp.colors(context).primary)),
          ])),
        ),
      ),
    );
  }
}
