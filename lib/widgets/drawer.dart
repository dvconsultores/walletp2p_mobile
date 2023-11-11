import 'package:flutter/material.dart';
import 'package:wallet_p2p/widgets/scaffold.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
        child: ScaffoldBody(
            body: Column(children: [
      Text("data"),
    ])));
  }
}
