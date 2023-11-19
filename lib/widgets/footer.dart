import 'package:flutter/material.dart';
import 'package:wallet_p2p/utils/config/theme.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key, this.child, this.padding});

  final Widget? Function(
          BuildContext context, TextStyle? ts, TextStyle? ts2, TextStyle? ts3)?
      child;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final ts = Theme.of(context).textTheme.bodySmall?.copyWith(
          letterSpacing: .36,
          fontWeight: FontWeight.w400,
          fontFamily: FontFamily.karla("400"),
        );

    final ts2 = Theme.of(context).textTheme.bodyLarge?.copyWith(
          letterSpacing: .36,
          fontWeight: FontWeight.w400,
          fontFamily: FontFamily.karla("400"),
        );

    final ts3 = Theme.of(context).textTheme.bodyLarge?.copyWith(
          letterSpacing: .36,
          fontWeight: FontWeight.w700,
          fontFamily: FontFamily.karla("700"),
        );

    void goTo() => debugPrint("on tap terms");

    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: child != null
          ? child!(context, ts, ts2, ts3)
          : Text.rich(
              TextSpan(children: [
                const TextSpan(
                    text: "© 2023 Near p2p LLC. all rights reserved\n"),
                TextSpan(
                    text: "Terms of Service // Privacy Policy",
                    recognizer: TapAndPanGestureRecognizer()
                      ..onTapDown = (_) => goTo(),
                    style: ts?.copyWith(
                      color: ThemeApp.colors(context).primary,
                      fontWeight: FontWeight.w700,
                      fontFamily: FontFamily.karla("700"),
                    )),
              ]),
              textAlign: TextAlign.center,
              style: ts,
            ),
    );
  }
}
