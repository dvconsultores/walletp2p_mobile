import 'package:flutter/material.dart';
import 'package:wallet_p2p/utils/config/theme.dart';
import 'package:wallet_p2p/utils/helper_widgets/gap.dart';
import 'package:wallet_p2p/widgets/button.dart';
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
      "icon": Image.asset("assets/logos/ref-finance.png"),
      "name": "REF FINANCE",
      "color": const Color.fromRGBO(0, 0, 0, 1),
    },
    {
      "icon": Image.asset("assets/logos/paras.png"),
      "name": "PARAS",
      "color": const Color.fromRGBO(1, 0, 190, 1),
    },
    {
      "icon": Image.asset("assets/logos/burrow.png"),
      "name": "BURROW",
      "color": const Color.fromRGBO(89, 74, 66, 1),
    },
    {
      "icon": Image.asset("assets/logos/meta-pool.png"),
      "name": "META POOL",
      "color": const Color.fromRGBO(116, 93, 233, 1),
    },
    {
      "icon": Image.asset("assets/logos/astro-dao.png"),
      "name": "ASTRO DAO",
      "color": const Color.fromRGBO(96, 55, 207, 1),
    },
    {
      "icon": Image.asset("assets/logos/rainbow-bridge.png"),
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

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        child: ScaffoldBody(
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
              child: SelectField<String>(
            value: currentExchange,
            hintText: "EXCHANGES",
            items: exchangeList
                .map((exchange) => DropdownMenuItem(
                      value: exchange,
                      child: Text(exchange),
                    ))
                .toList(),
            onChanged: (value) {
              if (value != null) setState(() => currentExchange = value);
            },
          )),
          const Gap(13).row,
          Button.variant(
            context,
            height: 34.26,
            text: "ALL",
            bgColor: ThemeApp.colors(context).secondary,
            onPressed: () {},
          ),
        ]),
        const Gap(22).column,
      ]),
    ));
  }
}
