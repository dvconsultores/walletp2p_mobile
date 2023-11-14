import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_p2p/utils/config/theme.dart';
import 'package:wallet_p2p/utils/extensions/type_extensions.dart';
import 'package:wallet_p2p/utils/helper_widgets/gap.dart';
import 'package:wallet_p2p/widgets/button.dart';
import 'package:wallet_p2p/widgets/custom_card.dart';
import 'package:wallet_p2p/widgets/footer.dart';
import 'package:wallet_p2p/widgets/header.dart';
import 'package:wallet_p2p/widgets/scaffold.dart';

class SelectAccountPage extends StatelessWidget {
  const SelectAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyleInfo = Theme.of(context).textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.w400,
          fontFamily: FontFamily.karla("400"),
        );

    const accounts = [
      {"name": "FRITZ WAGNER", "email": "fritzmwagner@gmail.com"},
      {
        "name": "DAO investigation near",
        "email": "daoinvestigationnear@gmail.com"
      },
      {"name": "use another account"},
    ];

    void onTapHelp() => debugPrint("on tap help");

    void onTapPolicy() => debugPrint("on tap policy privacy");

    void onTapTerms() => debugPrint("on tap terms and conditions");

    return AppScaffold(
      child: ScaffoldBody(
        body: Column(children: [
          const AppHeader(
            width: 278,
            topText: "SELECT",
            topTextAlign: Alignment.centerLeft,
            bottomText: "ACCOUNT",
            bottomTextAlign: Alignment.centerRight,
            desc: "LOGIN WITH GMAIL",
            descExpanded: true,
          ),
          const Gap(43).column,
          for (final item in accounts)
            Button(
              margin: const EdgeInsets.only(bottom: 23),
              gap: 10,
              leading: Image.asset("assets/icons/avatar.png"),
              content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(item['name']!,
                        style: TextStyle(
                          color: ThemeApp.colors(context).text,
                          letterSpacing: 3.9,
                          fontWeight: FontWeight.w700,
                          fontFamily: FontFamily.karla("700"),
                        )),
                    if (item['email'].hasValue)
                      Text(item['email']!,
                          style: TextStyle(
                            color: ThemeApp.colors(context).accent,
                            fontWeight: FontWeight.w400,
                            fontFamily: FontFamily.karla("400"),
                          )),
                  ]),
              trailingSpacer: true,
              trailing: SvgPicture.asset("assets/icons/arrow-next.svg"),
              borderSide: const BorderSide(width: 1),
              bgColor: Colors.white,
              boxShadow: const [],
              onPressed: () {},
            ),
          const Gap(27).column,
          CustomCard(
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              padding: const EdgeInsets.all(16),
              constraints: const BoxConstraints(minHeight: 95),
              child: Row(children: [
                SvgPicture.asset("assets/icons/info-white.svg"),
                const Gap(14).row,
                Expanded(
                    child: Text.rich(
                  TextSpan(children: [
                    const TextSpan(
                        text:
                            "Para continuar, google compartirá tu nombre, tu dirección de correo electrónico, tu preferencia de idioma y tu foto de perfil con ramper.xyz. Antes de usar esta aplicación puedes leer la "),
                    TextSpan(
                        text: "política de privacidad",
                        recognizer: TapAndPanGestureRecognizer()
                          ..onTapDown = (_) => onTapPolicy(),
                        style: textStyleInfo?.copyWith(
                          color: ThemeApp.colors(context).primary,
                          fontWeight: FontWeight.w700,
                          fontFamily: FontFamily.karla("700"),
                        )),
                    const TextSpan(text: " y los "),
                    TextSpan(
                        text: "términos del servicio",
                        recognizer: TapAndPanGestureRecognizer()
                          ..onTapDown = (_) => onTapTerms(),
                        style: textStyleInfo?.copyWith(
                          color: ThemeApp.colors(context).primary,
                          fontWeight: FontWeight.w700,
                          fontFamily: FontFamily.karla("700"),
                        )),
                    const TextSpan(text: " de ramper.xyz")
                  ]),
                  textAlign: TextAlign.justify,
                  style: textStyleInfo,
                )),
              ])),
          const Spacer(),
          AppFooter(
            padding: const EdgeInsets.symmetric(vertical: 62),
            child: (context, ts, ts2, ts3) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: onTapHelp,
                    child: Text("HELP",
                        style: ts3?.copyWith(
                            color: ThemeApp.colors(context).primary)),
                  ),
                  GestureDetector(
                    onTap: onTapPolicy,
                    child: Text("PRIVACY",
                        style: ts3?.copyWith(
                            color: ThemeApp.colors(context).primary)),
                  ),
                  GestureDetector(
                    onTap: onTapTerms,
                    child: Text("TERMS",
                        style: ts3?.copyWith(
                            color: ThemeApp.colors(context).primary)),
                  ),
                ]),
          ),
        ]),
      ),
    );
  }
}
