import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet_p2p/models/crypto_model.dart';
import 'package:wallet_p2p/pages/select_crypo_page.dart';
import 'package:wallet_p2p/utils/config/theme.dart';
import 'package:wallet_p2p/utils/general/variables.dart';
import 'package:wallet_p2p/utils/helper_widgets/gap.dart';
import 'package:wallet_p2p/widgets/button.dart';
import 'package:wallet_p2p/widgets/button_aspect.dart';
import 'package:wallet_p2p/widgets/footer.dart';
import 'package:wallet_p2p/widgets/header.dart';
import 'package:wallet_p2p/widgets/input_field.dart';
import 'package:wallet_p2p/widgets/scaffold.dart';

class SendPage extends StatefulWidget {
  const SendPage({super.key});

  @override
  State<SendPage> createState() => _SendPageState();
}

class _SendPageState extends State<SendPage> {
  final amountController = TextEditingController();
  CryptoModel? selectedCrypto;

  @override
  Widget build(BuildContext context) {
    final amountStyle = TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.w700,
      fontFamily: FontFamily.montserrat("700"),
    );

    final titleStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w700,
          letterSpacing: 1,
          fontFamily: FontFamily.karla("700"),
        );

    return AppScaffold(
      child: ScaffoldBody(
        bgImgTop: -70,
        body: Column(children: [
          Expanded(
            child: SingleChildScrollView(
                child: Column(children: [
              const AppHeader(
                showOptions: true,
                showArrow: false,
              ),
              const Gap(20).column,
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
              const Gap(64).column,
              Container(
                constraints: const BoxConstraints(maxWidth: 250),
                child: InputField(
                  controller: amountController,
                  hintText: "0",
                  numeric: true,
                  textAlign: TextAlign.center,
                  textStyle: amountStyle,
                  hintStyle: amountStyle,
                  contentPadding: const EdgeInsets.all(0),
                  color: Colors.transparent,
                  borderColor: Colors.transparent,
                  focusedBorderColor: Colors.transparent,
                ),
              ),
              const Gap(20).column,
              Button(
                width: 121,
                height: 34,
                text: "USE MAX",
                borderSide: BorderSide(color: ThemeApp.colors(context).primary),
                bgColor: ThemeApp.colors(context).secondary,
                textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ThemeApp.colors(context).primary,
                      letterSpacing: .36,
                      fontWeight: FontWeight.w700,
                      fontFamily: FontFamily.karla("700"),
                    ),
                boxShadow: const [],
                onPressed: () {},
              ),
              const Gap(74).column,
              Button(
                text: "SELECT ASSET",
                textStyle: titleStyle,
                trailingSpacer: true,
                trailing: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (selectedCrypto != null) ...[
                        Image.asset(
                          selectedCrypto!.icon ?? '',
                          height: 29,
                          fit: BoxFit.cover,
                        ),
                        const Gap(10).row,
                        Text(selectedCrypto!.name,
                            style: titleStyle?.copyWith(
                                color: ThemeApp.colors(context).primary)),
                        const Gap(2).row
                      ],
                      Icon(
                        Icons.keyboard_double_arrow_right_rounded,
                        size: 20,
                        color: ThemeApp.colors(context).primary,
                      )
                    ]),
                padding: const EdgeInsets.only(left: 23, right: 14),
                borderSide:
                    BorderSide(color: ThemeApp.colors(context).accentVariant),
                bgColor: ThemeApp.colors(context).secondary,
                boxShadow: const [],
                onPressed: () => Navigator.of(context)
                    .push<CryptoModel>(MaterialPageRoute(
                  builder: (context) => const SelectCryptoPage(),
                ))
                    .then((value) {
                  if (value != null) setState(() => selectedCrypto = value);
                }),
              ),
              const Gap(12).column,
              ButtonAspect(
                text: "AVAILABLE TO SEND",
                textStyle: titleStyle,
                trailingSpacer: true,
                trailing: Text("25.74794 NEAR",
                    style: titleStyle?.copyWith(
                        color: ThemeApp.colors(context).text,
                        letterSpacing: .3)),
                padding: const EdgeInsets.only(left: 23, right: 15),
                borderSide:
                    BorderSide(color: ThemeApp.colors(context).accentVariant),
                bgColor: ThemeApp.colors(context).secondary,
                boxShadow: const [],
              ),
              const Gap(17).column,
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
                  text: "CONTINUE",
                  onPressed: () => context.pushNamed("sendDetails"),
                )),
              ]),
            ])),
          ),
        ]),
        footer: const AppFooter(
            padding: EdgeInsets.only(top: Variables.gapWithFooter)),
      ),
    );
  }
}
