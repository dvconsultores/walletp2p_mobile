import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet_p2p/utils/config/theme.dart';
import 'package:wallet_p2p/utils/extensions/type_extensions.dart';
import 'package:wallet_p2p/utils/helper_widgets/gap.dart';
import 'package:wallet_p2p/widgets/button.dart';
import 'package:wallet_p2p/widgets/button_aspect.dart';
import 'package:wallet_p2p/widgets/footer.dart';
import 'package:wallet_p2p/widgets/header.dart';
import 'package:wallet_p2p/widgets/scaffold.dart';

class CollectiblesPage extends StatefulWidget {
  const CollectiblesPage({super.key});

  @override
  State<CollectiblesPage> createState() => _CollectiblesPageState();
}

class _CollectiblesPageState extends State<CollectiblesPage> {
  final collectibles = <String?>["", "", "", "", ""];

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w700,
          fontFamily: FontFamily.karla("700"),
        );

    return AppScaffold(
      child: ScaffoldBody(
        bgImgTop: -70,
        body: Column(children: [
          AppHeader(
            showOptions: true,
            leadingWidget: GestureDetector(
              onTap: () => context.goNamed("home"),
              child: Image.asset("assets/logos/logo.png", width: 35),
            ),
          ),
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
          // TODO validate to show this section
          if (true) ...[
            const Gap(33).column,
            const CustomTitle(
              width: 140,
              topText: "MAIL",
              topTextAlign: Alignment.centerLeft,
              bottomText: "BOX",
              bottomTextAlign: Alignment.centerRight,
            ),
            const Gap(17).column,
            Button.variant(
              text: "UNREAD",
              textStyle:
                  titleStyle?.copyWith(color: ThemeApp.colors(context).primary),
              trailingSpacer: true,
              trailing: Text("1",
                  style: titleStyle?.copyWith(
                      color: ThemeApp.colors(context).text)),
              bgColor: ThemeApp.colors(context).secondary,
              padding: const EdgeInsets.only(left: 23, right: 20),
              onPressed: () {},
            ),
            const Gap(13).column,
            Button.variant(
              text: "TOTAL",
              trailingSpacer: true,
              trailing: Text("1",
                  style: titleStyle?.copyWith(
                      color: ThemeApp.colors(context).text)),
              textStyle:
                  titleStyle?.copyWith(color: ThemeApp.colors(context).primary),
              bgColor: ThemeApp.colors(context).secondary,
              padding: const EdgeInsets.only(left: 23, right: 20),
              onPressed: () {},
            ),
            const Gap(28).column,
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SvgPicture.asset("assets/icons/info-blue.svg", width: 20),
              const Gap(10).row,
              Text("Open in new tab to read mail or t.me/nearmailbot",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: ThemeApp.colors(context).textVariant,
                        fontWeight: FontWeight.w500,
                        fontFamily: FontFamily.karla("500"),
                      ))
            ])
          ],
          const Gap(53).column,
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("(L) Earner nft ", style: titleStyle),
            ButtonAspect.icon(
                borderSide: BorderSide.none,
                boxShadow: [],
                constraints: const BoxConstraints(minWidth: 22, maxHeight: 22),
                icon: Align(
                  child: Text(collectibles.length.toString(),
                      style: titleStyle?.copyWith(color: Colors.white)),
                ))
          ]),
          const Gap(17).column,
          Expanded(
            child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 17,
                children: collectibles
                    .map((collectible) => Button.iconVariant(
                          size: 94,
                          icon: collectible.hasValue
                              ? Image.asset(collectible!)
                              : null,
                          borderSide:
                              const BorderSide(color: Colors.white, width: 2),
                          bgColor: ThemeApp.colors(context).primary,
                          onPressed: () =>
                              context.pushNamed("collectibleDetails"),
                        ))
                    .toList()),
          ),
          const AppFooter(padding: EdgeInsets.only(top: 33, bottom: 33)),
        ]),
      ),
    );
  }
}
