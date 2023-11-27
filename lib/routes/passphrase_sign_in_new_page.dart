import 'package:flutter/material.dart';
import 'package:wallet_p2p/utils/config/theme.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:wallet_p2p/widgets/button.dart';
import 'package:wallet_p2p/widgets/header.dart';
import 'package:wallet_p2p/widgets/input_field.dart';
import 'package:wallet_p2p/widgets/scaffold.dart';

class PassphraseSigInNewPage extends StatelessWidget {
  const PassphraseSigInNewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: ScaffoldBody(
        scrollable: true,
        body: Column(children: [
          const AppHeader(
            width: 284,
            topText: "PASSPHRASE",
            bottomText: "LOG IN",
            bottomTextAlign: Alignment.centerLeft,
            desc: "IF THIS IS YOUR FIRST TIME YOU CANCREATE A NEW WALLET",
            descExpanded: true,
          ),
          const Gap(16).column,
          Button.variant(
            text: "CREATE NEW WALLET",
            bgColor: const Color.fromRGBO(36, 200, 255, 0.35),
            onPressed: () {},
          ),
          const Gap(13).column,
          const Text.rich(
            TextSpan(children: [
              TextSpan(text: "OR\n"),
              TextSpan(text: "SECURELY LOG IN USING PASSPHRASE")
            ]),
            textAlign: TextAlign.center,
          ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => InputField.sizedBox(
                height: 45,
                hintText: "ENTER WORD #${index + 1}",
                hintStyle: TextStyle(
                  fontSize: 10,
                  color: ThemeApp.colors(context).text,
                  letterSpacing: 3.9,
                  fontWeight: FontWeight.w700,
                  fontFamily: FontFamily.karla("700"),
                )),
            separatorBuilder: (context, index) => const Gap(19).column,
            itemCount: 12,
          ),
          const Gap(33).column,
          Button(
            text: "CONTINUE",
            onPressed: () {},
          ),
        ]),
      ),
    );
  }
}
