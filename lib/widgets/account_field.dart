import 'package:flutter/material.dart';
import 'package:wallet_p2p/utils/config/theme.dart';
import 'package:wallet_p2p/utils/extensions/type_extensions.dart';
import 'package:wallet_p2p/utils/helper_widgets/gap.dart';
import 'package:wallet_p2p/widgets/button.dart';
import 'package:wallet_p2p/widgets/input_field.dart';

class AccountField extends StatelessWidget {
  const AccountField({
    super.key,
    required this.user,
    required this.controller,
    this.visibleText = false,
    this.onPressedVisibity,
  });
  final String user;
  final TextEditingController controller;
  final bool visibleText;
  final VoidCallback? onPressedVisibity;

  @override
  Widget build(BuildContext context) {
    return InputField(
      obscureText: !visibleText,
      controller: controller,
      textAlign: TextAlign.end,
      readOnly: true,
      focusedBorderColor: Theme.of(context).colorScheme.outline,
      textStyle: TextStyle(
        fontSize: 16,
        color: ThemeApp.colors(context).primary,
        fontWeight: FontWeight.w800,
        fontFamily: FontFamily.karla("800"),
      ),
      prefixPadding: const EdgeInsets.only(left: 18, right: 10),
      prefixIcon: Text(
        user,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontFamily: FontFamily.karla("700"),
        ),
      ),
      suffixIcon: IntrinsicWidth(
        child: Padding(
          padding: const EdgeInsets.only(right: 8, left: 11),
          child: Row(children: [
            Button.icon(
              size: 29,
              boxShadow: [],
              icon: Image.asset("assets/icons/copy.png", width: 15),
              onPressed: () =>
                  controller.text.copyToClipboard(message: "text copied!"),
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
              onPressed: onPressedVisibity,
            ),
          ]),
        ),
      ),
    );
  }
}
