import 'package:flutter/material.dart';
import 'package:wallet_p2p/models/crypto_model.dart';
import 'package:wallet_p2p/utils/config/theme.dart';
import 'package:wallet_p2p/utils/extensions/type_extensions.dart';
import 'package:wallet_p2p/utils/general/variables.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:wallet_p2p/widgets/button.dart';
import 'package:wallet_p2p/widgets/custom_card.dart';
import 'package:wallet_p2p/widgets/header.dart';
import 'package:wallet_p2p/widgets/input_field.dart';
import 'package:wallet_p2p/widgets/scaffold.dart';

class SelectCryptoPage extends StatefulWidget {
  const SelectCryptoPage({super.key});

  @override
  State<SelectCryptoPage> createState() => _SelectCryptoPageState();
}

class _SelectCryptoPageState extends State<SelectCryptoPage> {
  final searchController = TextEditingController();

  final listCryto = [
    CryptoModel(
      icon: "assets/miscellaneous/near.png",
      coin: "NEAR",
      name: "NEAR",
      amount: 59.744,
    ),
    CryptoModel(
      icon: "assets/miscellaneous/eth.png",
      coin: "ETH",
      name: "ETHEREUM",
      amount: 59.744,
    ),
    CryptoModel(
      icon: "assets/miscellaneous/btc.png",
      coin: "BTC",
      name: "BITCOIN",
      amount: 0.259,
    ),
    CryptoModel(
      icon: "assets/miscellaneous/usdt.png",
      coin: "USDT",
      name: "THETHER",
      amount: 1938.47,
    ),
    CryptoModel(
      icon: "assets/miscellaneous/sol.png",
      coin: "SOL",
      name: "SOLANA",
      amount: 257.93,
    ),
    CryptoModel(
      icon: "assets/miscellaneous/matic.png",
      coin: "MATIC",
      name: "POLYGON",
      amount: 148.54,
    ),
    CryptoModel(
      icon: "assets/miscellaneous/usdc.png",
      coin: "USDC",
      name: "USD COIN",
      amount: 193.49,
    ),
    CryptoModel(
      icon: "assets/miscellaneous/dai.png",
      coin: "DAI",
      name: "DAI",
      amount: 327.44,
    ),
    CryptoModel(
      icon: "assets/miscellaneous/klay.png",
      coin: "KLAY",
      name: "KLAYTN",
      amount: 274.34,
    ),
    CryptoModel(
      icon: "assets/miscellaneous/shib.png",
      coin: "SHIB",
      name: "SHIBA INU",
      amount: 5277.86,
    ),
    CryptoModel(
      icon: "assets/miscellaneous/snx.png",
      coin: "SNX",
      name: "SYNTHETIX",
      amount: 538.25,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: ThemeApp.colors(context).text,
          fontWeight: FontWeight.w700,
          fontFamily: FontFamily.karla("700"),
        );

    double conversion(double value) {
      // TODO logic to conversion here

      return value / 2;
    }

    return AppScaffold(
      child: ScaffoldBody(
        bgImgTop: Variables.bgImgTop2,
        scrollable: true,
        body: Column(children: [
          AppHeader(
            traillingWidget: _CustomSearch(
              controller: searchController,
              onChanged: (value) {},
            ),
          ),
          const Gap(25).column,
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
          const Gap(28).column,
          SizedBox(
              height: size.height * .775,
              child: CustomCard(
                child: ListView.separated(
                  itemCount: listCryto.length,
                  itemBuilder: (context, index) {
                    final crypto = listCryto[index];

                    return Button(
                      height: 60,
                      leading: Image.asset(crypto.icon ?? ''),
                      leadingGap: 14,
                      text: crypto.name,
                      textStyle: titleStyle,
                      trailingSpacer: true,
                      trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("${crypto.amount} ${crypto.coin}",
                                style: titleStyle),
                            Text(
                                "\$${conversion(crypto.amount.toString().toDouble())}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color:
                                          ThemeApp.colors(context).textVariant,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: FontFamily.karla("400"),
                                    )),
                          ]),
                      bgColor: Colors.transparent,
                      splashFactory:
                          InkSparkle.constantTurbulenceSeedSplashFactory,
                      overlayColor:
                          ThemeApp.colors(context).primary.withOpacity(.2),
                      boxShadow: const [],
                      onPressed: () =>
                          Navigator.pop<CryptoModel>(context, crypto),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                    color: ThemeApp.colors(context).secondary,
                    thickness: 1,
                    height: 2,
                  ),
                ),
              )),
          const Gap(33).column,
        ]),
      ),
    );
  }
}

class _CustomSearch extends StatefulWidget {
  const _CustomSearch({required this.controller, this.onChanged});
  final TextEditingController controller;
  final void Function(String value)? onChanged;

  @override
  State<_CustomSearch> createState() => _CustomSearchState();
}

class _CustomSearchState extends State<_CustomSearch>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  final focusNode = FocusNode();

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..drive(CurveTween(curve: Curves.decelerate));
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          final animation =
              Tween<double>(begin: 31, end: 150).animate(animationController);

          final animation2 =
              Tween<double>(begin: 10, end: 11).animate(animationController);

          return SizedBox(
            width: animation.value,
            child: InputField(
              focusNode: focusNode,
              controller: widget.controller,
              onChanged: widget.onChanged,
              onTap: () => animationController.forward(),
              onTapOutside: (event) {
                focusNode.unfocus();
                animationController.reverse();
              },
              hintText: "Search by token",
              textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontFamily: FontFamily.karla("500"),
                  ),
              hintStyle: TextStyle(
                  color: ThemeApp.colors(context).text.withOpacity(.7)),
              contentPadding: EdgeInsets.all(animation2.value),
              prefixPadding: const EdgeInsets.only(left: 9, right: 5),
              color: ThemeApp.colors(context).secondary,
              prefixIcon: Image.asset("assets/icons/magnify-icon.png"),
            ),
          );
        });
  }
}
