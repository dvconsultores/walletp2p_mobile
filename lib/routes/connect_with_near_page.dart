import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet_p2p/utils/config/theme.dart';
import 'package:wallet_p2p/utils/helper_widgets/gap.dart';
import 'package:wallet_p2p/widgets/account_field.dart';
import 'package:wallet_p2p/widgets/button.dart';
import 'package:wallet_p2p/widgets/custom_card.dart';
import 'package:wallet_p2p/widgets/header.dart';
import 'package:wallet_p2p/widgets/scaffold.dart';

class ConnectWithNearPage extends StatefulWidget {
  const ConnectWithNearPage({super.key});

  @override
  State<ConnectWithNearPage> createState() => _ConnectWithNearPageState();
}

class _ConnectWithNearPageState extends State<ConnectWithNearPage> {
  final accountList = <Map<String, dynamic>>[
    {"user": "fritzwagner.near", "amount": 0.001, "coin": "NEAR"},
    {"user": "1onduh47886002882hsghwoj", "amount": 0.110, "coin": "NEAR"},
    {"user": "746nwoknnbbllsnnsppmi018", "amount": 2.001, "coin": "NEAR"},
    {"user": "fritzwagner.near", "amount": 0.001, "coin": "NEAR"},
  ];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        child: ScaffoldBody(
      body: Column(children: [
        const AppHeader(
          topText: "CONNECT",
          bottomText: "WITH NEAR",
          desc:
              "AN APPLICATION IS REQUESTING LIMITED ACCESS TO YOUR NEAR ACCOUNT. SELECT THE ACCOUNT YOU WISH TO CONNECT.",
          descExpanded: true,
        ),
        IntrinsicWidth(
            child: Button.variant(
          margin: const EdgeInsets.symmetric(vertical: 23),
          height: 34,
          bgColor: ThemeApp.colors(context).secondary,
          leading: Icon(Icons.language_rounded,
              color: ThemeApp.colors(context).primary, size: 20),
          leadingGap: 3,
          text: "app.nea--ramper.com",
          textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                letterSpacing: 1,
                fontWeight: FontWeight.w700,
                fontFamily: FontFamily.karla("700"),
              ),
          onPressed: () {},
        )),
        CustomCard(
          backgroundColor: ThemeApp.colors(context).tertiary,
          width: double.maxFinite,
          height: 261,
          child: Column(children: [
            Expanded(
              child: ListView.separated(
                itemCount: accountList.length,
                itemBuilder: (context, index) {
                  final item = accountList[index];

                  return AccountField(
                    user: item['user'] as String,
                    amount: item['amount'] as double,
                    coin: item['coin'] as String,
                    visibleText: (item['visible'] as bool?) ?? false,
                    onPressedVisibity: (visibility) =>
                        setState(() => item['visible'] = !visibility),
                  );
                },
                separatorBuilder: (context, index) => const Gap(14).column,
              ),
            ),
            const Gap(14).column,
            Button(
              color: ThemeApp.colors(context).primary,
              bgColor: ThemeApp.colors(context).secondary,
              borderSide: BorderSide(color: ThemeApp.colors(context).primary),
              boxShadow: const [],
              text: "IMPORT A DIFFERENT ACCOUNT",
              onPressed: () {},
            ),
          ]),
        ),
        const Gap(23).column,
        Row(children: [
          Expanded(
              child: Button.variant(
            bgColor: ThemeApp.colors(context).secondary,
            text: "CANCEL",
            onPressed: () => context.pop(),
          )),
          const Gap(12).row,
          Expanded(
              child: Button(
            text: "NEXT",
            onPressed: () => context.pushNamed("limitedPermissions"),
          ))
        ])
      ]),
    ));
  }
}
