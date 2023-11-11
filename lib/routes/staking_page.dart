import 'package:flutter/material.dart';
import 'package:wallet_p2p/utils/config/theme.dart';
import 'package:wallet_p2p/utils/helper_widgets/gap.dart';
import 'package:wallet_p2p/widgets/button.dart';
import 'package:wallet_p2p/widgets/custom_card.dart';
import 'package:wallet_p2p/widgets/header.dart';
import 'package:wallet_p2p/widgets/scaffold.dart';

class StakingPage extends StatelessWidget {
  const StakingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        child: ScaffoldBody(
            body: Column(children: [
      const AppHeader(),
      const Gap(200).column,
      const CustomTitle(
        width: 312,
        topText: "CURRENT",
        topTextAlign: Alignment.centerLeft,
        bottomText: "VALIDATORS",
        bottomTextAlign: Alignment.centerRight,
      ),
      const Gap(17).column,
      CustomCard(
        width: double.maxFinite,
        backgroundColor: ThemeApp.colors(context).secondary,
        padding: const EdgeInsets.only(top: 29, bottom: 20),
        child: Column(children: [
          Text(
            "You are not currently staking with any validators",
            style: TextStyle(
              fontSize: 10,
              color: ThemeApp.colors(context).textVariant,
              fontWeight: FontWeight.w500,
              fontFamily: FontFamily.karla("500"),
            ),
          ),
          const Gap(12).column,
          Button.variant(
            context,
            width: 192,
            height: 34,
            text: "STAKE MY TOKENS",
            bgColor: Colors.transparent,
            onPressed: () {},
          ),
        ]),
      ),
    ])));
  }
}
