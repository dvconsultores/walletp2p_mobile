import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet_p2p/utils/config/theme.dart';
import 'package:wallet_p2p/utils/helper_widgets/gap.dart';
import 'package:wallet_p2p/widgets/button.dart';
import 'package:wallet_p2p/widgets/header.dart';
import 'package:wallet_p2p/widgets/input_field.dart';
import 'package:wallet_p2p/widgets/scaffold.dart';

class PassphraseWordPage extends StatelessWidget {
  const PassphraseWordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: ScaffoldBody(
        scrollable: true,
        body: Column(children: [
          const AppHeader(
            width: 284,
            topText: "PASSPHRASE",
            bottomText: "SIGN UP",
            bottomTextAlign: Alignment.centerLeft,
            desc:
                "ENTER THE FOLLOWING WORD FROM YOUR RECOVERY PHRASE TO COMPLETE THE SETUP PROCESS",
          ),
          const Gap(77).column,
          InputField.sizedBox(
            height: 45,
            hintText: "ENTER WORD #12",
            hintStyle: TextStyle(
              fontSize: 10,
              color: ThemeApp.colors(context).text,
              letterSpacing: 3.9,
              fontWeight: FontWeight.w700,
              fontFamily: FontFamily.karla("700"),
            ),
          ),
          Button(
            margin: const EdgeInsets.only(top: 15),
            text: "VERIFY",
            onPressed: () => context.pushNamed("pickUsername"),
          ),
          const Gap(49).column,
          Button.variant(
            context,
            text: "GO BACK",
            onPressed: () => context.pop(),
          ),
        ]),
      ),
    );
  }
}
