import 'package:flutter/material.dart';
import 'package:wallet_p2p/utils/helper_widgets/gap.dart';
import 'package:wallet_p2p/widgets/header.dart';
import 'package:wallet_p2p/widgets/scaffold.dart';

class AccountDetailsPage extends StatelessWidget {
  const AccountDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        child: ScaffoldBody(
      body: Column(children: [
        const AppHeader(),
        const Gap(20).column,
        const Text("data"),
      ]),
    ));
  }
}
