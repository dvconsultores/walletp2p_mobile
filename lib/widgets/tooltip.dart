import 'package:flutter/material.dart';
import 'package:wallet_p2p/utils/config/theme.dart';

class AppTooltip extends StatelessWidget {
  const AppTooltip({
    super.key,
    required this.child,
    this.message,
  });
  final Widget child;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      triggerMode: TooltipTriggerMode.longPress,
      decoration: BoxDecoration(
        color: ThemeApp.colors(context).primary,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      textStyle: TextStyle(
        fontSize: 12,
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontFamily: FontFamily.karla("400"),
      ),
      child: child,
    );
  }
}
