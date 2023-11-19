import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet_p2p/pages/approve_transaction_page.dart';
import 'package:wallet_p2p/utils/config/theme.dart';
import 'package:wallet_p2p/utils/helper_widgets/gap.dart';
import 'package:wallet_p2p/widgets/button.dart';
import 'package:wallet_p2p/widgets/button_aspect.dart';
import 'package:wallet_p2p/widgets/header.dart';
import 'package:wallet_p2p/widgets/scaffold.dart';

class SendDetailsPage extends StatefulWidget {
  const SendDetailsPage({super.key});

  @override
  State<SendDetailsPage> createState() => _SendDetailsPageState();
}

class _SendDetailsPageState extends State<SendDetailsPage> {
  var listCommonPayee = [
    {
      "avatar": "assets/images/woman-avatar.png",
      "account": "mariangelahdezp@gmail.com",
      "name": "María Ángela Hernández",
    },
    {
      "avatar": "assets/images/man-avatar.png",
      "account": "arturoadelante.near",
    },
    {
      "avatar": "assets/images/woman-avatar.png",
      "account": "patriciasilvab.near",
    },
    {
      "avatar": "assets/images/man-avatar.png",
      "account": "Miguel.marinan@gmail.com",
      "name": "Miguel Marinan González",
    },
    {
      "avatar": "assets/images/woman-avatar.png",
      "account": "danielaruiz.near",
    },
  ];

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
        scrollable: true,
        body: Column(children: [
          const AppHeader(),
          const Gap(134).column,
          SizedBox(
            width: double.maxFinite,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("1", style: amountStyle),
                  const Text("USD",
                      style: TextStyle(
                          fontSize: 16, letterSpacing: 1.76, height: .4)),
                ]),
          ),
          const Gap(123).column,
          ButtonAspect(
            text: "SEND TO",
            textStyle:
                titleStyle?.copyWith(color: ThemeApp.colors(context).primary),
            trailingSpacer: true,
            trailing: Text("ACCOUNT ID",
                style: titleStyle?.copyWith(
                    color: ThemeApp.colors(context).text, letterSpacing: .3)),
            padding: const EdgeInsets.only(left: 23, right: 15),
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.outline),
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
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ApproveTransactionPage(),
              )),
            )),
          ]),
          const Gap(43).column,
          Align(
            alignment: Alignment.centerLeft,
            child: Text("COMMON PAYEE", style: titleStyle),
          ),
          const Gap(12).column,
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: listCommonPayee.length,
            itemBuilder: (context, index) {
              final item = listCommonPayee[index];

              return Row(children: [
                CircleAvatar(
                  child: Image.asset(
                    item['avatar'] ?? "assets/images/man-avatar.png",
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                const Gap(13).row,
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['account'] as String,
                        style: titleStyle?.copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          fontFamily: FontFamily.karla("700"),
                        ),
                      ),
                      if (item['name'] != null)
                        Text(
                          item['name'] as String,
                          style: titleStyle?.copyWith(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            height: 1.2,
                            fontFamily: FontFamily.karla("500"),
                          ),
                        ),
                    ])
              ]);
            },
            separatorBuilder: (context, index) => const Gap(12).column,
          ),
        ]),
      ),
    );
  }
}
