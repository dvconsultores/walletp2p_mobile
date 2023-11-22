import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet_p2p/utils/config/theme.dart';
import 'package:wallet_p2p/utils/extensions/type_extensions.dart';
import 'package:wallet_p2p/utils/general/variables.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:wallet_p2p/widgets/button.dart';
import 'package:wallet_p2p/widgets/custom_card.dart';
import 'package:wallet_p2p/widgets/footer.dart';
import 'package:wallet_p2p/widgets/header.dart';
import 'package:wallet_p2p/widgets/scaffold.dart';
import 'package:wallet_p2p/widgets/tooltip.dart';

class AccountDetailsPage extends StatefulWidget {
  const AccountDetailsPage({super.key});

  @override
  State<AccountDetailsPage> createState() => _AccountDetailsPageState();
}

class _AccountDetailsPageState extends State<AccountDetailsPage> {
  final balanceData = [
    {
      "field": "RESERVED FOR STORAGE",
      "value": 0.000264,
    },
    {
      "field": "RESERVED FOR TRANSACTIONS",
      "value": 0.005,
    },
    {
      "field": "AVAILABLE BALANCE",
      "value": 0.98275,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final titleTextStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: ThemeApp.colors(context).textVariant,
          letterSpacing: 1,
          fontWeight: FontWeight.w700,
          fontFamily: FontFamily.karla("700"),
        );

    final bodyTextStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: ThemeApp.colors(context).textVariant,
          fontWeight: FontWeight.w500,
          fontFamily: FontFamily.karla("500"),
        );

    return AppScaffold(
        child: ScaffoldBody(
      scrollable: true,
      body: Column(children: [
        const AppHeader(
          width: 301,
          topText: "ACCOUNT",
          topTextAlign: Alignment.centerLeft,
          bottomText: "DETAILS",
          bottomTextAlign: Alignment.centerRight,
        ),
        const Gap(23).column,
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("WALLET ID", style: titleTextStyle),
          const Gap(12).row,
          Row(children: [
            Text("patriciasilvab.near",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: FontFamily.karla("700"),
                )),
            const Gap(12).row,
            Button.icon(
              size: 29,
              icon: Image.asset("assets/icons/copy.png", width: 14.82),
              onPressed: () => "patriciasilvab.near"
                  .copyToClipboard(message: "wallet id copied!"),
            ),
          ]),
        ]),
        const Gap(13).column,
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("WALLET BALANCE", style: titleTextStyle),
          const Gap(12).row,
          Text.rich(
            TextSpan(children: [
              TextSpan(text: "0.9999996 NEAR\n", style: titleTextStyle),
              TextSpan(text: "\$1.38", style: bodyTextStyle),
            ]),
            textAlign: TextAlign.end,
          )
        ]),
        const Gap(16).column,
        CustomCard(
          width: double.maxFinite,
          height: 168,
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: balanceData.length,
            separatorBuilder: (context, index) => const Gap(27).column,
            itemBuilder: (context, index) {
              final item = balanceData[index];

              return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      SizedBox(
                        width: 102,
                        child: Text(
                          item['field'] as String,
                          style: titleTextStyle,
                        ),
                      ),
                      const Gap(10).row,
                      AppTooltip(
                        message: "",
                        child: SvgPicture.asset("assets/icons/info-blue.svg"),
                      ),
                    ]),
                    const Gap(10).row,
                    Text.rich(
                      TextSpan(children: [
                        TextSpan(
                            text: "${item['value']} NEAR\n",
                            style: titleTextStyle),
                        TextSpan(
                            text:
                                "\$${((item['value'] as double) * 2).maxDecimals(4)}",
                            style: bodyTextStyle),
                      ]),
                      textAlign: TextAlign.end,
                    ),
                  ]);
            },
          ),
        ),
        const Gap(29).column,
        const CustomTitle(
          width: 305,
          topText: "SECURITY &",
          topTextAlign: Alignment.centerRight,
          bottomText: "RECOVERY",
          bottomTextAlign: Alignment.centerLeft,
          desc: "MOST SECURE (RECOMMENDED)",
          descAlign: Alignment.centerLeft,
          descTip: "",
        ),
        const Gap(16).column,
        CustomCard(
          backgroundColor: ThemeApp.colors(context).secondary,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SizedBox(
              width: 130,
              child: Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'LEDGER HARDWARE WALLET\n', style: titleTextStyle),
                WidgetSpan(child: const Gap(20).column),
                TextSpan(
                  text:
                      'Improve the security of your account by using a hardware wallet.',
                  style: bodyTextStyle,
                ),
              ])),
            ),
            const Gap(10).row,
            Button(
              text: "ENABLE",
              constraints: const BoxConstraints(maxWidth: 134),
              height: 34.26,
              onPressed: () {},
            )
          ]),
        ),
        const Gap(41).column,
        CustomCard(
          backgroundColor: ThemeApp.colors(context).secondary,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SizedBox(
              width: 140,
              child: Row(children: [
                Expanded(
                  child: Text.rich(TextSpan(children: [
                    TextSpan(text: 'SEND PHRASE\n', style: titleTextStyle),
                    TextSpan(
                      text: 'Enable jul 19 2023',
                      style: bodyTextStyle,
                    ),
                  ])),
                ),
                const Gap(8).row,
                AppTooltip(
                  message: "",
                  child: SvgPicture.asset("assets/icons/info-blue.svg"),
                )
              ]),
            ),
            const Gap(10).row,
            Button(
              text: "DISABLE",
              constraints: const BoxConstraints(maxWidth: 134),
              height: 34.26,
              onPressed: () {},
            )
          ]),
        ),
        const Gap(27).column,
        Button(
          text: "EXPORT LOCAL PRIVATE KEY",
          borderSide: BorderSide(color: ThemeApp.colors(context).primary),
          bgColor: ThemeApp.colors(context).secondary,
          color: ThemeApp.colors(context).primary,
          boxShadow: const [],
          onPressed: () {},
        ),
        const Gap(15).column,
        Button(
          text: "REMOVE ACCOUNT FROM WALLET",
          onPressed: () {
            // TODO used just for build development, can be removed
            context.goNamed("login");
          },
        ),
        const Gap(10).column
      ]),
      footer: const AppFooter(
          padding: EdgeInsets.only(top: Variables.gapWithFooter)),
    ));
  }
}
