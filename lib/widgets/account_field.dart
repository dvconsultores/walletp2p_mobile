import 'package:flutter/material.dart';
import 'package:wallet_p2p/utils/config/theme.dart';
import 'package:wallet_p2p/utils/extensions/type_extensions.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:wallet_p2p/widgets/button.dart';
import 'package:wallet_p2p/widgets/button_aspect.dart';

class AccountField extends StatelessWidget {
  const AccountField({
    super.key,
    required this.user,
    required this.coin,
    required this.amount,
    this.visibleText = false,
    this.onPressedVisibity,
  });
  final String user;
  final double amount;
  final String coin;
  final bool visibleText;
  final void Function(bool visibility)? onPressedVisibity;

  @override
  Widget build(BuildContext context) {
    return ButtonAspect.variant(
      textAlign: TextAlign.end,
      padding: const EdgeInsets.only(left: 10, top: 8, right: 8, bottom: 8),
      content: Expanded(
        child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.spaceBetween,
            spacing: 8,
            children: [
              Text(
                user,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: FontFamily.karla("700"),
                ),
              ),
              FittedBox(
                child: Text(visibleText ? "$amount $coin" : '●●●●●●',
                    style: TextStyle(
                      fontSize: 12,
                      color: ThemeApp.colors(context).primary,
                      fontWeight: FontWeight.w800,
                      fontFamily: FontFamily.karla("800"),
                    )),
              ),
            ]),
      ),
      trailingGap: 11,
      trailing: Row(children: [
        Button.icon(
          size: 29,
          boxShadow: [],
          icon: Image.asset("assets/icons/copy.png", width: 15),
          onPressed: () => user.copyToClipboard(message: "text copied!"),
        ),
        const Gap(6).row,
        Button.icon(
          size: 29,
          boxShadow: const [],
          bgColor: ThemeApp.colors(context).secondary,
          borderSide:
              BorderSide(width: 1, color: ThemeApp.colors(context).primary),
          icon: Icon(
            visibleText
                ? Icons.remove_red_eye_outlined
                : Icons.visibility_off_outlined,
            size: 15,
            color: ThemeApp.colors(context).primary,
          ),
          onPressed: onPressedVisibity != null
              ? () => onPressedVisibity!(visibleText)
              : null,
        ),
      ]),
    );
  }
}
