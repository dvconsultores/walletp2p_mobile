import 'package:flutter/material.dart';
import 'package:wallet_p2p/utils/config/theme.dart';
import 'package:wallet_p2p/utils/helper_widgets/gap.dart';
import 'package:wallet_p2p/widgets/button.dart';
import 'package:wallet_p2p/widgets/header.dart';
import 'package:wallet_p2p/widgets/input_field.dart';
import 'package:wallet_p2p/widgets/scaffold.dart';

class PassphraseSigInPage extends StatelessWidget {
  const PassphraseSigInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: ScaffoldBody(
        body: Column(children: [
          const AppHeader(
            width: 284,
            topText: "PASSPHRASE",
            bottomText: "LOG IN",
            bottomTextAlign: Alignment.centerLeft,
            desc: "SECURELY LOG IN WITH YOUR EXCLUSIVE PASSPHRASE",
          ),
          const Gap(33).column,
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => InputField(
                  hintText: "ENTER WORD #${index + 1}",
                  height: 45,
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
          ),
          const Gap(33).column,
          Button(
            text: "CONTINUE",
            onPressed: () {},
          ),
          const Gap(40).column,
        ]),
      ),
    );
  }
}
