import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet_p2p/pages/transfer_nft_add_page.dart';
import 'package:wallet_p2p/utils/config/theme.dart';
import 'package:wallet_p2p/utils/general/variables.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:wallet_p2p/widgets/button.dart';
import 'package:wallet_p2p/widgets/button_aspect.dart';
import 'package:wallet_p2p/widgets/header.dart';
import 'package:wallet_p2p/widgets/scaffold.dart';

class TransferNftPage extends StatelessWidget {
  const TransferNftPage({super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w700,
          letterSpacing: 1,
          fontFamily: FontFamily.karla("700"),
        );

    return AppScaffold(
      child: ScaffoldBody(
        bgImgTop: Variables.bgImgTop2,
        bgImg: "assets/images/circle-transfer.png",
        body: Column(children: [
          const AppHeader(
            width: 250,
            topText: "TRANSFER",
            bottomText: "NFT",
            bottomTextAlign: Alignment.centerRight,
          ),
          const Gap(282).column,
          Text(
            "Enter a recipient address, then proceed to confirm your transaction.",
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: ThemeApp.colors(context).textVariant,
                  fontWeight: FontWeight.w500,
                  fontFamily: FontFamily.karla("500"),
                ),
          ),
          const Gap(13).column,
          ButtonAspect(
            text: "SEND TO",
            textStyle: titleStyle,
            trailingSpacer: true,
            trailing: Text("ACCOUNT ID",
                style: titleStyle?.copyWith(
                  color: ThemeApp.colors(context).text,
                  letterSpacing: .3,
                  fontWeight: FontWeight.w400,
                  fontFamily: FontFamily.karla("400"),
                )),
            padding: const EdgeInsets.only(left: 23, right: 15),
            borderSide:
                BorderSide(color: ThemeApp.colors(context).accentVariant),
            bgColor: ThemeApp.colors(context).secondary,
            boxShadow: const [],
          ),
          const Gap(17).column,
          Row(children: [
            Expanded(
                child: Button.variant(
              text: "CANCEL",
              bgColor: ThemeApp.colors(context).secondary,
              onPressed: () => context.pop(),
            )),
            const Gap(12).row,
            Expanded(
                child: Button(
              text: "SEND",
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const TransferNftAddPage(),
              )),
            )),
          ]),
        ]),
      ),
    );
  }
}
