import 'package:flutter/material.dart';
import 'package:wallet_p2p/widgets/scaffold.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
        color: Color.fromRGBO(229, 231, 235, 1),
        child: ScaffoldBody(
            bgImg: 'assets/images/circle-drawer.png',
            bgImgTop: -40,
            bgImgLeft: 6,
            body: Column(children: [
              Text("data"),
            ])));
  }
}
