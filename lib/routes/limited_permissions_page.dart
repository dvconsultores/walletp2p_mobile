import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_p2p/utils/config/theme.dart';
import 'package:wallet_p2p/utils/helper_widgets/gap.dart';
import 'package:wallet_p2p/utils/helper_widgets/ordered_list.dart';
import 'package:wallet_p2p/widgets/button.dart';
import 'package:wallet_p2p/widgets/custom_card.dart';
import 'package:wallet_p2p/widgets/header.dart';
import 'package:wallet_p2p/widgets/scaffold.dart';

class LimitedPermissionsPage extends StatelessWidget {
  const LimitedPermissionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w700,
          fontFamily: FontFamily.karla("700"),
        );

    return AppScaffold(
        child: ScaffoldBody(
      body: Column(children: [
        const AppHeader(
          topText: "CONNECT",
        ),
        const Gap(30).column,
        Button.variant(
          width: 213,
          height: 34,
          text: "fritzwagner.near",
          textStyle: TextStyle(
            fontSize: 10,
            letterSpacing: 1,
            fontWeight: FontWeight.w700,
            fontFamily: FontFamily.karla("700"),
          ),
          bgColor: ThemeApp.colors(context).secondary,
          onPressed: () {},
        ),
        const Gap(19).column,
        SizedBox(
          width: 298,
          child: Text.rich(
            TextSpan(children: [
              const TextSpan(
                  text:
                      "ONLY CONNECT TO SITES THAT YOU TRUST. ONCE CONNECTED, "),
              TextSpan(
                  text: "APP.P2PWALLET.COM ",
                  style: TextStyle(
                    color: ThemeApp.colors(context).primary,
                  )),
              const TextSpan(text: "WILL HAVE "),
              TextSpan(text: "LIMITED PERMISSIONS:", style: titleStyle),
            ]),
            textAlign: TextAlign.center,
            style: titleStyle?.copyWith(
              fontWeight: FontWeight.w400,
              fontFamily: FontFamily.karla("400"),
            ),
          ),
        ),
        const Gap(23).column,
        OrderedList.item(
          [
            const OrderedListItem("View  the address of your permited account"),
            const OrderedListItem("View  the balance of your permited account"),
            const OrderedListItem(
                "Call methods on the smart contract on behalf of your permited account"),
            OrderedListItem(
              "This does not allow the app to transfer tokens",
              color: const Color.fromRGBO(140, 140, 140, 1),
              markdown: CircleAvatar(
                  maxRadius: 20,
                  backgroundColor: const Color.fromRGBO(217, 217, 217, 1),
                  child: SvgPicture.asset("assets/icons/close-icon.svg")),
            ),
          ],
          separation: 13,
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.center,
          textStyle: TextStyle(
            color: ThemeApp.colors(context).textVariant,
            fontWeight: FontWeight.w500,
            fontFamily: FontFamily.karla("500"),
          ),
          markdown: CircleAvatar(
              maxRadius: 20,
              backgroundColor: const Color.fromRGBO(36, 200, 255, 1),
              child: SvgPicture.asset("assets/icons/check-icon.svg")),
        ),
        const Gap(33).column,
        CustomCard(
          width: double.maxFinite,
          height: 45,
          borderSide: BorderSide(color: ThemeApp.colors(context).accentVariant),
          backgroundColor: ThemeApp.colors(context).secondary,
          padding: const EdgeInsets.only(left: 23, right: 15),
          borderRadius: const BorderRadius.all(Radius.circular(35)),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("CONTRACT", style: titleStyle),
            const Gap(10).row,
            Row(children: [
              Text(
                "sputnik-p2p.near",
                style: titleStyle?.copyWith(
                    color: ThemeApp.colors(context).primary),
              ),
              const Gap(8).row,
              CircleAvatar(
                  maxRadius: 11,
                  backgroundColor: ThemeApp.colors(context).primary,
                  child: const Icon(
                    Icons.arrow_outward_rounded,
                    size: 14,
                    color: Colors.white,
                  ))
            ])
          ]),
        ),
        const Gap(12).column,
        CustomCard(
          width: double.maxFinite,
          height: 81,
          borderSide: BorderSide(color: ThemeApp.colors(context).accentVariant),
          backgroundColor: ThemeApp.colors(context).secondary,
          padding: const EdgeInsets.only(left: 23, right: 15),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text("NETWORK FEE ALLOWARE", style: titleStyle),
              const Gap(10).row,
              Text(
                "0.25 NEAR",
                style: titleStyle?.copyWith(
                    color: ThemeApp.colors(context).accent),
              )
            ]),
            const Gap(8).column,
            Text.rich(
              TextSpan(children: [
                const TextSpan(
                    text:
                        "The application will begiven permission to spend up to      "),
                TextSpan(
                    text: "0.25 NEAR ",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontFamily: FontFamily.karla("900"),
                    )),
                const TextSpan(
                    text: "towards network fees incurred during use."),
              ]),
              style: TextStyle(
                color: ThemeApp.colors(context).textVariant,
                fontWeight: FontWeight.w500,
                fontFamily: FontFamily.karla("500"),
              ),
            ),
          ]),
        ),
        const Gap(33).column,
        Row(children: [
          Expanded(
              child: Button.variant(
            text: "CANCEL",
            bgColor: ThemeApp.colors(context).secondary,
            onPressed: () {},
          )),
          const Gap(12).row,
          Expanded(
              child: Button(
            text: "CONNECT",
            onPressed: () {},
          )),
        ])
      ]),
    ));
  }
}
