import 'package:flutter/material.dart';
import 'package:wallet_p2p/utils/config/theme.dart';
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
    return AppScaffold(
        color: const Color.fromRGBO(229, 231, 235, 1),
        child: ScaffoldBody(
            bgImg: 'assets/images/circle-drawer.png',
            bgImgTop: -40,
            bgImgLeft: 6,
            body: Column(children: [
              // TODO build here other buttons
              const Gap(500).column,
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
                            Icons.remove_red_eye_outlined,
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
