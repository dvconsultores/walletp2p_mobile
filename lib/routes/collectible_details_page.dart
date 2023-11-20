import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet_p2p/utils/config/theme.dart';
import 'package:wallet_p2p/utils/extensions/type_extensions.dart';
import 'package:wallet_p2p/utils/general/variables.dart';
import 'package:wallet_p2p/utils/helper_widgets/gap.dart';
import 'package:wallet_p2p/widgets/button.dart';
import 'package:wallet_p2p/widgets/button_aspect.dart';
import 'package:wallet_p2p/widgets/custom_card.dart';
import 'package:wallet_p2p/widgets/header.dart';
import 'package:wallet_p2p/widgets/scaffold.dart';

class CollectibleDetailsPage extends StatelessWidget {
  const CollectibleDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w700,
          fontFamily: FontFamily.karla("700"),
        );
    final textStyle = Theme.of(context).textTheme.bodyMedium;

    final tokenInfo = [
      {
        "field": "Smart Contract",
        "value": "x.paras-near",
      },
      {
        "field": "Image link",
        "value": "http://ips.fleek.com",
      },
    ];

    return AppScaffold(
      child: ScaffoldBody(
        bgImgTop: Variables.bgImgTop2,
        scrollable: true,
        padding: EdgeInsets.only(
          left: Variables.paddingScaffold.left,
          right: Variables.paddingScaffold.right,
          top: Variables.paddingScaffold.top,
        ),
        body: Column(children: [
          const AppHeader(),
          const Gap(26).column,
          Row(children: [
            Expanded(
                child: Button(
              text: "BALANCES",
              onPressed: () {},
            )),
            const Gap(12).row,
            Expanded(
                child: Button.variant(
              text: "COLLECTIBLES",
              onPressed: () {},
            )),
          ]),
          const Gap(58).column,
          ButtonAspect.iconVariant(
            size: 94,
            icon: null,
            borderSide: const BorderSide(color: Colors.white, width: 2),
            bgColor: ThemeApp.colors(context).primary,
          ),
          const Gap(13).column,
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ButtonAspect.icon(
              size: 16,
              icon: const Icon(
                Icons.check_rounded,
                size: 12,
                color: Colors.white,
              ),
              bgColor: const Color.fromRGBO(36, 200, 255, 1),
              borderSide: BorderSide.none,
              boxShadow: [],
            ),
            const Gap(7.9).row,
            Text("# 15 MONKEY ART", style: titleStyle),
          ]),
          Text("De: MonkeyBussiness",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ThemeApp.colors(context).textVariant,
                    fontWeight: FontWeight.w400,
                    fontFamily: FontFamily.karla("400"),
                  )),
          const Gap(20).column,
          CustomCard(
            width: double.maxFinite,
            borderSide:
                BorderSide(color: ThemeApp.colors(context).accentVariant),
            backgroundColor: ThemeApp.colors(context).secondary,
            padding:
                const EdgeInsets.only(left: 24, right: 17, top: 18, bottom: 18),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("HISTORY", style: titleStyle),
              const Gap(8).column,
              Text(
                "Bored Ape Yacht Club, NFT Monkey or BAYC for short, is a popular NFT project that has taken the cryptocurrency and digital art world by storm. Launched in April 2021, BAYC is a collection of 10,000 unique ape NFTs, each with its distinct item and characteristics. The project was created by a group of anonymous developers and has quickly become one of the most sought-after NFTs on the market.",
                textAlign: TextAlign.justify,
                style: textStyle?.copyWith(
                  color: ThemeApp.colors(context).textVariant,
                  fontWeight: FontWeight.w500,
                  fontFamily: FontFamily.karla("500"),
                ),
              ),
            ]),
          ),
          const Gap(19).column,
          CustomCard(
            width: double.maxFinite,
            height: 45,
            borderSide:
                BorderSide(color: ThemeApp.colors(context).accentVariant),
            backgroundColor: ThemeApp.colors(context).secondary,
            padding: const EdgeInsets.only(left: 24, right: 15),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("ROYALTY", style: titleStyle),
                  Text(
                    "1%",
                    style: titleStyle?.copyWith(
                        color: ThemeApp.colors(context).text),
                  ),
                ]),
          ),
          const Gap(19).column,
          CustomCard(
            width: double.maxFinite,
            borderSide:
                BorderSide(color: ThemeApp.colors(context).accentVariant),
            backgroundColor: ThemeApp.colors(context).secondary,
            padding:
                const EdgeInsets.only(left: 24, right: 15, top: 18, bottom: 18),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("TOKEN INFO", style: titleStyle),
              for (final item in tokenInfo) ...[
                const Gap(16).column,
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(item['field'] as String,
                          style: textStyle?.copyWith(
                            fontWeight: FontWeight.w700,
                            fontFamily: FontFamily.karla("700"),
                          )),
                      const Gap(8).row,
                      Row(children: [
                        Text(item['value'] as String,
                            style: textStyle?.copyWith(
                              fontWeight: FontWeight.w400,
                              fontFamily: FontFamily.karla("400"),
                            )),
                        const Gap(8).row,
                        Button.icon(
                          size: 29,
                          boxShadow: [],
                          icon: Image.asset(
                            "assets/icons/copy.png",
                            width: 14.82,
                          ),
                          onPressed: () => (item['value'] as String)
                              .copyToClipboard(message: "text copied!"),
                        )
                      ])
                    ])
              ]
            ]),
          ),
          const Gap(20).column,
          Button(
            text: "TRANSFER",
            onPressed: () => context.pushNamed("transferNft"),
          ),
          Gap(Variables.paddingScaffold.bottom).column
        ]),
      ),
    );
  }
}
