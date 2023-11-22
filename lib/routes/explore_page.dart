import 'package:flutter/material.dart';
import 'package:wallet_p2p/utils/config/theme.dart';
import 'package:wallet_p2p/utils/general/variables.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:wallet_p2p/widgets/button.dart';
import 'package:wallet_p2p/widgets/custom_card.dart';
import 'package:wallet_p2p/widgets/footer.dart';
import 'package:wallet_p2p/widgets/header.dart';
import 'package:wallet_p2p/widgets/scaffold.dart';
import 'package:wallet_p2p/widgets/halo_icon_widget.dart';
import 'package:wallet_p2p/widgets/select_field.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  String? currentExchange;

  final tokenList = [
    {
      "icon": Image.asset("assets/miscellaneous/ref-finance.png"),
      "name": "REF FINANCE",
      "color": const Color.fromRGBO(0, 0, 0, 1),
    },
    {
      "icon": Image.asset("assets/miscellaneous/paras.png"),
      "name": "PARAS",
      "color": const Color.fromRGBO(1, 0, 190, 1),
    },
    {
      "icon": Image.asset("assets/miscellaneous/burrow.png"),
      "name": "BURROW",
      "color": const Color.fromRGBO(89, 74, 66, 1),
    },
    {
      "icon": Image.asset("assets/miscellaneous/meta-pool.png"),
      "name": "META POOL",
      "color": const Color.fromRGBO(116, 93, 233, 1),
    },
    {
      "icon": Image.asset("assets/miscellaneous/astro-dao.png"),
      "name": "ASTRO DAO",
      "color": const Color.fromRGBO(96, 55, 207, 1),
    },
    {
      "icon": Image.asset("assets/miscellaneous/rainbow-bridge.png"),
      "name": "RAINBOW BRIDGE",
      "color": const Color.fromRGBO(255, 255, 255, 1),
    },
  ];

  final exchangeList = [
    "Polygon",
    "Polkadot",
    "Harmony",
    "The Sandbox",
  ];

  final projectList = [
    {
      "icon": "assets/miscellaneous/ref-finance.png",
      "color": const Color.fromRGBO(0, 0, 0, 1),
      "type": "AMM DEX",
      "name": "REF FINANCE",
      "desc": "Multi-purpose DeFi plataform built on NEAR Protocol",
    },
    {
      "icon": "assets/miscellaneous/rainbow-bridge.png",
      "color": const Color.fromRGBO(225, 225, 225, 1),
      "type": "Cross-chain Bridge",
      "name": "RAINBOW BRIDGE",
      "desc": "Transfer tokens between Ethereum and NEAR",
    },
    {
      "icon": "assets/miscellaneous/ref-finance.png",
      "color": const Color.fromRGBO(0, 0, 0, 1),
      "type": "AMM DEX",
      "name": "REF FINANCE",
      "desc": "Multi-purpose DeFi plataform built on NEAR Protocol",
    },
    {
      "icon": "assets/miscellaneous/rainbow-bridge.png",
      "color": const Color.fromRGBO(225, 225, 225, 1),
      "type": "Cross-chain Bridge",
      "name": "RAINBOW BRIDGE",
      "desc": "Transfer tokens between Ethereum and NEAR",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        child: ScaffoldBody(
      scrollable: true,
      body: Column(children: [
        const AppHeader(
          topText: "EXPLORE",
          topTextAlign: Alignment.centerRight,
          desc: "TRENDING PROJECTS",
          descAlign: Alignment.centerLeft,
          showOptions: true,
        ),
        const Gap(16).column,
        SizedBox(
          width: double.maxFinite,
          child: Wrap(
              spacing: 39,
              runSpacing: 16,
              alignment: WrapAlignment.spaceEvenly,
              children: tokenList
                  .map(
                    (project) => HaloIconWidget(
                      icon: project['icon'] as Widget,
                      text: project['name'] as String,
                      color: project['color'] as Color,
                    ),
                  )
                  .toList()),
        ),
        const Gap(25).column,
        Button(
          text: "TOP UP YOUR WALLET",
          onPressed: () {},
        ),
        const Gap(15).column,
        Row(children: [
          Expanded(
              child: SelectField.sizedBox<String>(
            height: 34,
            value: currentExchange,
            hintText: "EXCHANGES",
            color: ThemeApp.colors(context).secondary,
            items: exchangeList
                .map((exchange) => DropdownMenuItem(
                      value: exchange,
                      child: Text(exchange),
                    ))
                .toList(),
            onChanged: (value) {
              if (value != null) setState(() => currentExchange = value);
            },
            contentPadding: const EdgeInsets.only(left: 15, right: 14),
          )),
          const Gap(13).row,
          Button.variant(
            height: 34.26,
            text: "ALL",
            bgColor: ThemeApp.colors(context).secondary,
            onPressed: () {},
          ),
        ]),
        const Gap(22).column,
        GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 17,
            crossAxisSpacing: 17,
            shrinkWrap: true,
            children: projectList
                .map((project) => CustomCard(
                      padding: const EdgeInsets.all(0),
                      borderSide: BorderSide(
                        color: ThemeApp.colors(context).textVariant,
                      ),
                      backgroundColor: ThemeApp.colors(context).secondary,
                      child: Column(children: [
                        Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              width: 91,
                              height: 20,
                              decoration: BoxDecoration(
                                color: ThemeApp.colors(context).textVariant,
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                              ),
                              child: Align(
                                  child: Text(project['type'] as String,
                                      style: TextStyle(
                                        fontSize: 7,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: FontFamily.karla("500"),
                                      ))),
                            )),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HaloIconWidget(
                                  size: 20,
                                  firstHaloSize: 4,
                                  secondHaloSize: 9,
                                  color: project['color'] as Color,
                                  icon: Image.asset(project['icon'] as String,
                                      width: 20),
                                ),
                                FractionallySizedBox(
                                  widthFactor: .5,
                                  child: Text(project['name'] as String,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            fontWeight: FontWeight.w700,
                                            fontFamily: FontFamily.karla("700"),
                                          )),
                                ),
                                const Gap(5).column,
                                Text(project['desc'] as String,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                    style: TextStyle(
                                      color:
                                          ThemeApp.colors(context).textVariant,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: FontFamily.karla("500"),
                                    ))
                              ]),
                        ),
                      ]),
                    ))
                .toList()),
      ]),
      footer: const AppFooter(
          padding: EdgeInsets.only(top: Variables.gapWithFooter)),
    ));
  }
}
