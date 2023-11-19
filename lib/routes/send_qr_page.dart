import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet_p2p/utils/config/theme.dart';
import 'package:wallet_p2p/utils/extensions/type_extensions.dart';
import 'package:wallet_p2p/utils/helper_widgets/gap.dart';
import 'package:wallet_p2p/widgets/button.dart';
import 'package:wallet_p2p/widgets/button_aspect.dart';
import 'package:wallet_p2p/widgets/footer.dart';
import 'package:wallet_p2p/widgets/header.dart';
import 'package:wallet_p2p/widgets/scaffold.dart';

class SendQrPage extends StatelessWidget {
  const SendQrPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w700,
          letterSpacing: .4,
          fontFamily: FontFamily.karla("700"),
        );

    return AppScaffold(
      child: ScaffoldBody(
        bgImgTop: -70,
        // TODO fix this image
        bgImg: "assets/images/circle-qr.png",
        body: Column(children: [
          const AppHeader(
            showOptions: true,
            showArrow: false,
          ),
          const Gap(20).column,
          Row(children: [
            Expanded(
                child: Button.variant(
              text: "SEND",
              bgColor: ThemeApp.colors(context).secondary,
              onPressed: () {},
            )),
            const Gap(12).row,
            Expanded(
                child: Button(
              text: "RECIEVE",
              onPressed: () {},
            )),
          ]),
          const Gap(227).column,
          Align(
            alignment: Alignment.centerLeft,
            child: Text("ACCOUNT ID", style: titleStyle),
          ),
          const Gap(6).column,
          ButtonAspect.variant(
            text: "beesimple.near",
            textStyle: titleStyle,
            padding: const EdgeInsets.only(left: 23, right: 8),
            bgColor: ThemeApp.colors(context).secondary,
            trailingSpacer: true,
            trailing: Button.icon(
              size: 29,
              icon: Image.asset("assets/icons/copy.png", width: 14.82),
              boxShadow: [],
              onPressed: () =>
                  "beesimple.near".copyToClipboard(message: "text copied!"),
            ),
          ),
          const Gap(18).column,
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
              text: "CONTINUE",
              onPressed: () {},
            )),
          ]),
        ]),
        footer: AppFooter(padding: EdgeInsets.only(top: size.height * .3)),
      ),
    );
  }
}
