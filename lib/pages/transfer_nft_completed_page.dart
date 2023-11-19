import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_p2p/utils/config/theme.dart';
import 'package:wallet_p2p/utils/extensions/type_extensions.dart';
import 'package:wallet_p2p/utils/helper_widgets/gap.dart';
import 'package:wallet_p2p/widgets/button.dart';
import 'package:wallet_p2p/widgets/custom_card.dart';
import 'package:wallet_p2p/widgets/header.dart';
import 'package:wallet_p2p/widgets/scaffold.dart';

class TransferNftCompletedPage extends StatelessWidget {
  const TransferNftCompletedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w700,
          fontFamily: FontFamily.karla("700"),
        );
    final textStyle = Theme.of(context).textTheme.bodyMedium;

    final txInfo = [
      {
        "field": "TX ID:",
        "value": "x.paras-near",
      },
      {
        "field": "Link:",
        "value": "http://ips.fleek.com",
      },
    ];

    return AppScaffold(
      child: ScaffoldBody(
        body: Column(children: [
          AppHeader(
            width: 286,
            topText: "TRANSFER",
            topTextAlign: Alignment.centerLeft,
            middleText: "NFT",
            bottomText: "COMPLETE",
            bottomTextAlign: Alignment.centerRight,
            showArrow: false,
            traillingWidget: Button.icon(
              size: 31,
              boxShadow: [],
              icon: SvgPicture.asset("assets/icons/close-icon-white.svg",
                  width: 12.4),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          const Gap(36).column,
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "The NFT transfer has been successfully completed.",
              style: textStyle?.copyWith(
                color: ThemeApp.colors(context).textVariant,
                fontWeight: FontWeight.w500,
                fontFamily: FontFamily.karla("500"),
              ),
            ),
          ),
          const Gap(17).column,
          CustomCard(
            width: double.maxFinite,
            borderSide:
                BorderSide(color: ThemeApp.colors(context).accentVariant),
            backgroundColor: ThemeApp.colors(context).secondary,
            padding:
                const EdgeInsets.only(left: 24, right: 15, top: 18, bottom: 18),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("TRANSACTION INFO", style: titleStyle),
              for (final item in txInfo) ...[
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
          const Gap(23).column,
          Button(text: "WALLET", onPressed: () {}),
        ]),
      ),
    );
  }
}
