import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet_p2p/utils/config/theme.dart';
import 'package:wallet_p2p/utils/general/variables.dart';
import 'package:wallet_p2p/utils/helper_widgets/gap.dart';
import 'package:wallet_p2p/widgets/button.dart';
import 'package:wallet_p2p/widgets/button_aspect.dart';
import 'package:wallet_p2p/widgets/header.dart';
import 'package:wallet_p2p/widgets/scaffold.dart';

class ApproveTransactionPage extends StatelessWidget {
  const ApproveTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w700,
          fontFamily: FontFamily.karla("700"),
        );

    return AppScaffold(
      child: ScaffoldBody(
        bgImgTop: Variables.bgImgTop3,
        body: Column(children: [
          const AppHeader(
            width: 320,
            topText: "APPROVE",
            topTextAlign: Alignment.centerRight,
            bottomText: "TRANSACTION",
            bottomTextAlign: Alignment.centerLeft,
          ),
          const Gap(19).column,
          IntrinsicWidth(
            child: Button.variant(
              height: 34,
              bgColor: ThemeApp.colors(context).secondary,
              leading: Icon(Icons.language_rounded,
                  color: ThemeApp.colors(context).primary, size: 20),
              leadingGap: 3,
              text: "app.nea--ramper.com",
              textStyle: titleStyle?.copyWith(fontSize: 10),
              onPressed: () {},
            ),
          ),
          const Gap(106).column,
          SizedBox(
            width: double.maxFinite,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("5", style: TextStyle(fontSize: 48)),
                  const Text("NEAR",
                      style: TextStyle(
                          fontSize: 16, letterSpacing: 1.76, height: .4)),
                  Text("\$5.45",
                      style: titleStyle?.copyWith(fontSize: 12, height: 1.7)),
                ]),
          ),
          const Gap(112).column,
          ButtonAspect.variant(
            text: "FROM",
            textStyle: titleStyle,
            trailingSpacer: true,
            trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "andresdom.near",
                    style: titleStyle?.copyWith(
                        color: ThemeApp.colors(context).text),
                  ),
                  Text(
                    "5.866717 near",
                    style: titleStyle?.copyWith(
                      color: ThemeApp.colors(context).accent,
                      fontWeight: FontWeight.w400,
                      fontFamily: FontFamily.karla("400"),
                    ),
                  ),
                ]),
            padding: const EdgeInsets.only(left: 23, right: 20),
            borderSide:
                BorderSide(color: ThemeApp.colors(context).accentVariant),
            bgColor: ThemeApp.colors(context).secondary,
          ),
          const Gap(12).column,
          ButtonAspect.variant(
            content:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Text("ESTIMATED FEES", style: titleStyle),
              const Gap(8).row,
              SvgPicture.asset("assets/icons/info-blue.svg", width: 22)
            ]),
            trailingSpacer: true,
            trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("< 0.000001 NEAR",
                      style: titleStyle?.copyWith(
                        color: ThemeApp.colors(context).text,
                        fontWeight: FontWeight.w400,
                        fontFamily: FontFamily.karla("400"),
                      )),
                  Text("< \$0.01",
                      style: titleStyle?.copyWith(
                        color: ThemeApp.colors(context).text,
                        fontWeight: FontWeight.w400,
                        fontFamily: FontFamily.karla("400"),
                      )),
                ]),
            padding: const EdgeInsets.only(left: 23, right: 20),
            borderSide:
                BorderSide(color: ThemeApp.colors(context).accentVariant),
            bgColor: ThemeApp.colors(context).secondary,
          ),
          const Gap(24).column,
          GestureDetector(
            onTap: () {},
            child: Text("+ MORE INFORMATION",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ThemeApp.colors(context).primary,
                      letterSpacing: .27,
                      fontWeight: FontWeight.w700,
                      fontFamily: FontFamily.karla("700"),
                    )),
          ),
          const Gap(24).column,
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
              text: "APPROVE",
              onPressed: () {},
            )),
          ]),
        ]),
      ),
    );
  }
}
