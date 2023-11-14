import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet_p2p/utils/config/theme.dart';
import 'package:wallet_p2p/utils/general/functions.dart';
import 'package:wallet_p2p/utils/helper_widgets/gap.dart';
import 'package:wallet_p2p/widgets/button.dart';
import 'package:wallet_p2p/widgets/button_aspect.dart';
import 'package:wallet_p2p/widgets/custom_card.dart';
import 'package:wallet_p2p/widgets/footer.dart';
import 'package:wallet_p2p/widgets/header.dart';
import 'package:wallet_p2p/widgets/scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final floatingButtons = [
      {
        "label": "SEND",
        "icon": const Icon(Icons.arrow_upward_rounded),
        "action": () {},
      },
      {
        "label": "RECEIVE",
        "icon": const Icon(Icons.arrow_downward_rounded),
        "action": () {},
      },
      {
        "label": "TOP UP",
        "icon": const Icon(Icons.add),
        "action": () {},
      },
      {
        "label": "SWAP",
        "icon": const Icon(Icons.swap_horiz_rounded),
        "action": () {},
      },
    ];

    final recentActivities = [
      {
        "type": "receive",
        "coin": "NEAR",
        "amount": "1",
        "ago": "1d",
      },
      {
        "type": "access",
        "user": "patriciasilvab.near",
        "coin": "NEAR",
        "amount": "1",
        "ago": "1d",
      },
      {
        "type": "new-account",
        "user": "patriciasilvab.near",
        "coin": "NEAR",
        "amount": "1",
        "ago": "1d",
      },
      {
        "type": "receive",
        "coin": "NEAR",
        "amount": "1",
        "ago": "1d",
      },
    ];

    return AppScaffold(
      child: ScaffoldBody(
          bgImgTop: -70,
          scrollable: true,
          body: Column(children: [
            AppHeader(
              showOptions: true,
              leadingWidget: Image.asset("assets/logos/logo.png", width: 35),
            ),
            const Gap(26).column,
            Row(children: [
              Expanded(
                  child: Button.variant(
                context,
                text: "BALANCES",
                onPressed: () {},
              )),
              const Gap(12).row,
              Expanded(
                  child: Button(
                text: "COLLECTIBLES",
                onPressed: () {},
              )),
            ]),
            const Gap(64).column,
            IntrinsicWidth(
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text.rich(
                    TextSpan(children: [
                      TextSpan(
                          text: "\$",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: FontFamily.montserrat("400"),
                          )),
                      const TextSpan(text: "1.32"),
                    ]),
                    style: const TextStyle(fontSize: 48)),
                Transform.translate(
                  offset: const Offset(8, 0),
                  child: const Text("USD",
                      style: TextStyle(
                          fontSize: 16, letterSpacing: 1.76, height: .4)),
                ),
              ]),
            ),
            const Gap(14).column,
            Text("AVAILABLE BALANCE",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontFamily: FontFamily.karla("700"),
                    )),
            const Gap(6).column,
            SvgPicture.asset("assets/icons/info-blue.svg"),
            const Gap(18).column,
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (var i = 0; i < floatingButtons.length; i++)
                    Padding(
                      padding:
                          EdgeInsets.only(top: (i == 1 || i == 2) ? 60 : 0),
                      child: Column(children: [
                        Button.icon(
                          icon: floatingButtons[i]['icon'] as Icon,
                          onPressed:
                              floatingButtons[i]['action'] as void Function(),
                        ),
                        const Gap(8).column,
                        Text(
                          floatingButtons[i]['label'] as String,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: FontFamily.karla("700"),
                          ),
                        )
                      ]),
                    )
                ]),
            const Gap(64).column,
            // TODO missing card text over image
            SizedBox(
              width: double.maxFinite,
              child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    Image.asset("assets/images/bg-explore.png"),
                    Positioned.fill(
                      top: 18,
                      left: -135 - 24,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Button.variant(
                          context,
                          width: 145,
                          content: Text.rich(
                            TextSpan(children: [
                              const TextSpan(text: "EXPLORE "),
                              TextSpan(
                                  text: "NEAR",
                                  style: TextStyle(
                                    color: ThemeApp.colors(context).primary,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: FontFamily.karla("700"),
                                  ))
                            ]),
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontFamily: FontFamily.karla("400"),
                                    ),
                          ),
                          bgColor: ThemeApp.colors(context).secondary,
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 72,
                        right: 0,
                        child: CustomCard(
                          width: 133,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25)),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 7,
                          ),
                          child: Text(
                            "Earn, mint, and play! Discover the ecosystem of NEAR applications",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                  color: ThemeApp.colors(context).textVariant,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: FontFamily.karla("400"),
                                ),
                          ),
                        )),
                    Positioned.fill(
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Button(
                            width: 176,
                            text: "EXPLORE APPS",
                            onPressed: () => context.goNamed("explore"),
                          )),
                    ),
                  ]),
            ),
            const Gap(46).column,
            Stack(children: [
              Positioned.fill(
                  child: Transform.scale(
                      scaleX: 5,
                      child: const ColoredBox(
                        color: Color.fromRGBO(209, 196, 232, .65),
                      ))),
              Column(children: [
                const Gap(46).column,
                const CustomTitle(
                  width: 243,
                  topText: "RECENT",
                  topTextAlign: Alignment.centerLeft,
                  bottomText: "ACTIVITY",
                  bottomTextAlign: Alignment.centerRight,
                ),
                const Gap(18).column,
                for (final item in recentActivities) ...[
                  ButtonAspect(
                    bgColor: Colors.transparent,
                    boxShadow: const [],
                    leadingGap: 13,
                    trailingSpacer: true,
                    leading: Button.icon(
                      size: 40,
                      icon: Icon(
                          item['type'] == "receive"
                              ? Icons.arrow_downward_rounded
                              : item['type'] == "access"
                                  ? Icons.key_rounded
                                  : Icons.person_2_outlined,
                          color: ThemeApp.colors(context).primary),
                      bgColor: Colors.white,
                      boxShadow: [],
                      onPressed: () {},
                    ),
                    content: buildWidget(() {
                      TextSpan ts(String text) => TextSpan(
                          text: text,
                          style: TextStyle(
                            color: ThemeApp.colors(context).textVariant,
                            fontWeight: FontWeight.w500,
                            fontFamily: FontFamily.karla("500"),
                          ));
                      TextSpan ts2(String text) => TextSpan(
                          text: text,
                          style: ts(text).style?.copyWith(
                                fontWeight: FontWeight.w700,
                                fontFamily: FontFamily.karla("700"),
                              ));

                      return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['type'] == "receive"
                                  ? "RECEIVED ${item['coin']}"
                                  : item['type'] == "access"
                                      ? "ACCESS KEY"
                                      : "NEW ACCOUNT CREATED",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: ThemeApp.colors(context).textVariant,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: FontFamily.karla("700"),
                                  ),
                            ),
                            Text.rich(TextSpan(
                                children: item['type'] == "receive"
                                    ? [
                                        ts("from "),
                                        ts2(item['coin'] as String),
                                      ]
                                    : item['type'] == "access"
                                        ? [
                                            ts("for "),
                                            ts2(item['user'] as String),
                                          ]
                                        : [
                                            ts("Account "),
                                            ts2(item['user'] as String),
                                          ])),
                          ]);
                    }),
                    trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("+${item['amount']} ${item['coin']}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: ThemeApp.colors(context).primary,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: FontFamily.karla("700"),
                                  )),
                          Text("${item['ago']} ago",
                              style: TextStyle(
                                color: ThemeApp.colors(context).textVariant,
                                fontWeight: FontWeight.w500,
                                fontFamily: FontFamily.karla("500"),
                              )),
                        ]),
                  ),
                  const Gap(18).column
                ],
                const Gap(5).column,
                Button(
                  text: "VIEW ALL",
                  onPressed: () {},
                ),
                const AppFooter(padding: EdgeInsets.only(top: 25, bottom: 33))
              ]),
            ]),
          ])),
    );
  }
}
