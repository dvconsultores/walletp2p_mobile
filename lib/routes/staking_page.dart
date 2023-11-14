import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallet_p2p/utils/config/theme.dart';
import 'package:wallet_p2p/utils/general/functions.dart';
import 'package:wallet_p2p/utils/helper_widgets/gap.dart';
import 'package:wallet_p2p/widgets/button.dart';
import 'package:wallet_p2p/widgets/button_aspect.dart';
import 'package:wallet_p2p/widgets/custom_card.dart';
import 'package:wallet_p2p/widgets/footer.dart';
import 'package:wallet_p2p/widgets/header.dart';
import 'package:wallet_p2p/widgets/scaffold.dart';
import 'package:wallet_p2p/widgets/tooltip.dart';

class StakingPage extends StatelessWidget {
  const StakingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final stakeInfo = [
      {
        "topText": "TOTAL AMOUNT",
        "topValue": "0 NEAR",
        "bottomText": "STAKED",
        "bottomValue": "\$0",
      },
      {
        "topText": "REWARDS",
        "topValue": "0 NEAR",
        "bottomText": "EARNED",
        "bottomValue": "\$0",
      },
    ];

    return AppScaffold(
        child: ScaffoldBody(
            scrollable: true,
            body: Column(children: [
              const AppHeader(
                topText: "STAKING",
                desc: "STAKE YOUR NEAR TOKENS WITH A VALIDATOR",
                descExpanded: true,
              ),
              const Gap(19).column,
              CustomCard(
                width: double.maxFinite,
                height: 87,
                child: buildWidget(() {
                  final karla700 = TextStyle(
                    color: ThemeApp.colors(context).textVariant,
                    fontWeight: FontWeight.w700,
                    fontFamily: FontFamily.karla("700"),
                  );
                  final karla500 = TextStyle(
                    color: ThemeApp.colors(context).textVariant,
                    fontWeight: FontWeight.w500,
                    fontFamily: FontFamily.karla("500"),
                  );

                  return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("patriciasilvab.near",
                            style: karla700.copyWith(
                                color: ThemeApp.colors(context).text)),
                        const Gap(4).column,
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "AVAILABLE BALANCE",
                                style: karla700.copyWith(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.fontSize),
                              ),
                              const Gap(10).row,
                              Text("0.94732 NEAR",
                                  style: karla500.copyWith(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.fontSize,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: FontFamily.karla("400"),
                                  )),
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Staked", style: karla500),
                              const Gap(10).row,
                              Text("0 NEAR", style: karla500),
                            ]),
                      ]);
                }),
              ),
              const Gap(9).column,
              Button(
                text: "STAKE MY TOKENS",
                onPressed: () {},
              ),
              const Gap(34).column,
              for (final item in stakeInfo) ...[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonAspect(
                        width: 185,
                        bgColor: Colors.transparent,
                        boxShadow: const [],
                        leading: Button.icon(
                          size: 40,
                          bgColor: Colors.white,
                          boxShadow: [],
                          onPressed: () {},
                          icon: Image.asset("assets/logos/near-blue.png"),
                        ),
                        gap: 13,
                        text: "${item['topText']}\n${item['bottomText']}",
                        textExpanded: true,
                        textAlign: TextAlign.left,
                        textStyle:
                            Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: ThemeApp.colors(context).textVariant,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: FontFamily.karla("700"),
                                ),
                        trailing: AppTooltip(
                          message: "",
                          child: SvgPicture.asset(
                            "assets/icons/info-blue.svg",
                            width: 20,
                          ),
                        ),
                      ),
                      const Gap(10).row,
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(item['topValue'] as String,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: ThemeApp.colors(context).primary,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: FontFamily.karla("700"),
                                    )),
                            Text(item['bottomValue'] as String,
                                style: TextStyle(
                                  color: ThemeApp.colors(context).textVariant,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: FontFamily.karla("500"),
                                )),
                          ])
                    ]),
                const Gap(18).column,
              ],
              const Gap(22).column,
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
                    width: 192,
                    height: 34,
                    text: "STAKE MY TOKENS",
                    bgColor: Colors.transparent,
                    onPressed: () {},
                  ),
                ]),
              ),
              const AppFooter(padding: EdgeInsets.only(top: 127, bottom: 33))
            ])));
  }
}
