import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_p2p/pages/transfer_nft_completed_page.dart';
import 'package:wallet_p2p/utils/config/theme.dart';
import 'package:wallet_p2p/utils/helper_widgets/gap.dart';
import 'package:wallet_p2p/widgets/button.dart';
import 'package:wallet_p2p/widgets/scaffold.dart';

class TransferNftAddPage extends StatelessWidget {
  const TransferNftAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AppScaffold(
      filterWidget: const Positioned.fill(
        child: ColoredBox(color: Color.fromRGBO(79, 71, 59, .5)),
      ),
      gradient: const RadialGradient(
          center: Alignment(0, -1.42),
          radius: 0.7906,
          colors: [
            Color(0xFFD9D9D9),
            Color(0xFF7C7B7F),
          ]),
      child: ScaffoldBody(
        bgImgTop: -500,
        bgImg: "assets/images/circle-transparent.png",
        body: Column(children: [
          Align(
            alignment: Alignment.centerRight,
            child: Button.icon(
              size: 31,
              boxShadow: [],
              bgColor: Colors.white,
              icon: SvgPicture.asset("assets/icons/close-icon-blue.svg",
                  width: 12.4),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          Gap(size.height * .26).column,
          SvgPicture.asset("assets/icons/info-white.svg", width: 76),
          const Gap(27).column,
          Text(
              "You are going to transfer an NFT and it is going to spend XXX amount on the network fee.",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontFamily: FontFamily.karla("500"),
                  )),
          const Gap(27).column,
          Button.variant(
            text: "ADD + SEND",
            onPressed: () =>
                Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const TransferNftCompletedPage(),
            )),
          )
        ]),
      ),
    );
  }
}
