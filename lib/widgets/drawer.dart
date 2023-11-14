import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet_p2p/utils/config/theme.dart';
import 'package:wallet_p2p/utils/extensions/type_extensions.dart';
import 'package:wallet_p2p/utils/general/variables.dart';
import 'package:wallet_p2p/utils/helper_widgets/gap.dart';
import 'package:wallet_p2p/widgets/button.dart';
import 'package:wallet_p2p/widgets/input_field.dart';
import 'package:wallet_p2p/widgets/scaffold.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final textController = TextEditingController()..text = "test";

  bool visibleText = false;

  @override
  Widget build(BuildContext context) {
    const double buttonSize = 40;
    const double containerHeight = 454;

    final actionButtons = [
      {
        "icon": const Icon(Icons.close_rounded, size: 22),
        "action": () => Navigator.pop(context),
      },
      {
        "label": "WALLET",
        "icon": Image.asset("assets/icons/wallet.png"),
        "action": () {},
      },
      {
        "label": "STAKING",
        "icon": Image.asset("assets/icons/staking.png"),
        "action": () {
          Navigator.pop(context);
          context.goNamed("staking");
        },
      },
      {
        "label": "EXPLORE",
        "icon": const Icon(Icons.explore_outlined, size: 22),
        "action": () {
          Navigator.pop(context);
          context.goNamed("explore");
        },
      },
      {
        "label": "ACCOUNT",
        "icon": const Icon(Icons.person_2_outlined, size: 22),
        "action": () {
          Navigator.pop(context);
          context.goNamed("accountDetails");
        },
      },
      {
        "label": "SUPPORT",
        "icon": const Icon(Icons.question_mark_rounded, size: 22),
        "action": () {},
      },
      {
        "label": "ENG",
        "icon": const Icon(Icons.language_rounded, size: 22),
        "select": true,
        "action": () {},
      },
    ];

    actionButtons[0]["top"] = 0.0;
    actionButtons[0]["right"] = 0.0;

    actionButtons[1]["top"] = buttonSize + 3;
    actionButtons[1]["right"] = 135.0 - buttonSize;

    actionButtons[2]["top"] =
        (actionButtons[1]["top"] as double) + buttonSize + 35;
    actionButtons[2]["right"] = 201 - buttonSize;

    actionButtons[3]["top"] = containerHeight / 2;
    actionButtons[3]["right"] = 226.0 - buttonSize;

    actionButtons[6]["bottom"] = 0.0;
    actionButtons[6]["right"] = 0.0;

    actionButtons[5]["bottom"] = 32.0;
    actionButtons[5]["right"] = 135 - buttonSize;

    actionButtons[4]["bottom"] =
        (actionButtons[5]["bottom"] as double) + buttonSize / 2 + 37;
    actionButtons[4]["right"] = 201.0 - buttonSize;

    return AppScaffold(
        color: const Color.fromRGBO(229, 231, 235, 1),
        child: ScaffoldBody(
            bgImg: 'assets/images/circle-drawer.png',
            bgImgTop: -40,
            bgImgLeft: 6,
            padding: EdgeInsets.symmetric(
                horizontal: Variables.paddingScaffold.left),
            body: Column(children: [
              const Gap(96).column,
              SizedBox(
                width: double.maxFinite,
                height: containerHeight,
                child: Stack(children: [
                  for (final item in actionButtons)
                    Positioned(
                      top: item['top'] as double?,
                      left: item['left'] as double?,
                      bottom: item['bottom'] as double?,
                      right: item['right'] as double?,
                      child: Row(children: [
                        if ((item['label'] as String?).hasValue) ...[
                          Text(item['label'] as String,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontFamily: FontFamily.karla("700"),
                              )),
                          if (item['select'] == true)
                            Transform.translate(
                              offset: const Offset(-2, 0),
                              child: Icon(
                                Icons.arrow_drop_down,
                                color: ThemeApp.colors(context).primary,
                                size: 16,
                              ),
                            ),
                          const Gap(11).row
                        ],
                        Button.icon(
                          size: buttonSize,
                          icon: item['icon'] as Widget,
                          onPressed: item['action'] as void Function()?,
                        ),
                      ]),
                    ),
                ]),
              ),
              const Gap(53).column,
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "ACCOUNT",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: ThemeApp.colors(context).textVariant,
                        fontWeight: FontWeight.w700,
                        fontFamily: FontFamily.karla("700"),
                      ),
                ),
              ),
              const Gap(9).column,
              InputField(
                obscureText: !visibleText,
                controller: textController,
                textAlign: TextAlign.end,
                readOnly: true,
                focusedBorderColor: Theme.of(context).colorScheme.outline,
                textStyle: TextStyle(
                  fontSize: 16,
                  color: ThemeApp.colors(context).primary,
                  fontWeight: FontWeight.w800,
                  fontFamily: FontFamily.karla("800"),
                ),
                prefixPadding: const EdgeInsets.only(left: 18),
                prefixIcon: Text(
                  "patriciasilvab.near",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontFamily: FontFamily.karla("700"),
                  ),
                ),
                suffixIcon: IntrinsicWidth(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8, left: 11),
                    child: Row(children: [
                      Button.icon(
                        size: 29,
                        boxShadow: [],
                        icon: Image.asset("assets/icons/copy.png", width: 15),
                        onPressed: () {},
                      ),
                      const Gap(6).row,
                      Button.icon(
                          size: 29,
                          boxShadow: const [],
                          bgColor: ThemeApp.colors(context).secondary,
                          borderSide: BorderSide(
                              width: 1,
                              color: ThemeApp.colors(context).primary),
                          icon: Icon(
                            visibleText
                                ? Icons.remove_red_eye_outlined
                                : Icons.visibility_off_outlined,
                            size: 15,
                            color: ThemeApp.colors(context).primary,
                          ),
                          onPressed: () =>
                              setState(() => visibleText = !visibleText)),
                    ]),
                  ),
                ),
              ),
              const Gap(14).column,
              Button(
                text: "IMPORT ACCOUNT",
                onPressed: () {},
              ),
              const Gap(18).column,
              Button(
                text: "CREATE NEW ACCOUNT",
                color: ThemeApp.colors(context).primary,
                bgColor: ThemeApp.colors(context).secondary,
                boxShadow: const [],
                borderSide: BorderSide(
                    width: 1, color: ThemeApp.colors(context).primary),
                onPressed: () {},
              ),
            ])));
  }
}
