import 'package:flutter/material.dart';
import 'package:wallet_p2p/utils/config/theme.dart';
import 'package:wallet_p2p/utils/extensions/type_extensions.dart';
import 'package:wallet_p2p/utils/helper_widgets/gap.dart';

class ButtonAspect extends StatelessWidget {
  const ButtonAspect({
    super.key,
    this.text,
    this.textStyle,
    this.width,
    this.height = 45,
    this.constraints,
    this.shape,
    this.borderRadius = const BorderRadius.all(Radius.circular(40)),
    this.border,
    this.boxShadow = const [
      BoxShadow(
        offset: Offset(-1, 6),
        blurRadius: 3,
        spreadRadius: 0,
        color: Color.fromRGBO(0, 0, 0, 0.2),
      ),
    ],
    this.color = Colors.white,
    this.bgColor,
    this.bgColorDisabled,
    this.padding,
    this.margin,
    this.child,
    this.leading,
    this.trailing,
    this.buttonAxisAlignment,
    this.gap,
    this.leadingGap,
    this.trailingGap,
    this.leadingSpacer = false,
    this.trailingSpacer = false,
    this.textSoftWrap,
    this.textOverflow,
    this.content,
    this.textAlign = TextAlign.center,
    this.textExpanded = false,
  });
  final String? text;
  final TextStyle? textStyle;
  final double? width;
  final double height;
  final BoxConstraints? constraints;
  final BorderRadius? borderRadius;
  final BoxBorder? border;
  final BoxShape? shape;
  final List<BoxShadow> boxShadow;
  final Color color;
  final Color? bgColor;
  final Color? bgColorDisabled;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final MainAxisAlignment? buttonAxisAlignment;
  final double? gap;
  final double? leadingGap;
  final double? trailingGap;
  final bool leadingSpacer;
  final bool trailingSpacer;
  final Widget? leading;
  final Widget? trailing;
  final bool? textSoftWrap;
  final TextOverflow? textOverflow;
  final TextAlign textAlign;
  final bool textExpanded;
  final Widget? content;
  final Widget? child;

  static ButtonAspect variant(
    BuildContext context, {
    String? text,
    TextStyle? textStyle,
    double? width,
    double height = 45,
    BoxConstraints? constraints,
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(40)),
    BoxShape? shape,
    BoxBorder border = const Border.symmetric(
      horizontal: BorderSide(width: 1),
      vertical: BorderSide(width: 1),
    ),
    List<BoxShadow> boxShadow = const [],
    Color? color,
    Color? bgColor,
    Color? bgColorDisabled,
    EdgeInsets? padding,
    EdgeInsets? margin,
    MainAxisAlignment? buttonAxisAlignment,
    double? gap,
    double? leadingGap,
    double? trailingGap,
    bool leadingSpacer = false,
    bool trailingSpacer = false,
    Widget? leading,
    Widget? trailing,
    bool? textSoftWrap,
    TextOverflow? textOverflow,
    TextAlign textAlign = TextAlign.center,
    bool textExpanded = false,
    Widget? content,
    Widget? child,
  }) =>
      ButtonAspect(
        text: text,
        textStyle: textStyle,
        width: width,
        height: height,
        constraints: constraints,
        shape: shape,
        borderRadius: borderRadius,
        border: border,
        boxShadow: boxShadow,
        color: color ?? ThemeApp.colors(context).text,
        bgColor: bgColor ?? ThemeApp.colors(context).tertiary,
        bgColorDisabled: bgColorDisabled,
        padding: padding,
        margin: margin,
        leading: leading,
        trailing: trailing,
        buttonAxisAlignment: buttonAxisAlignment,
        gap: gap,
        leadingGap: leadingGap,
        trailingGap: trailingGap,
        leadingSpacer: leadingSpacer,
        trailingSpacer: trailingSpacer,
        textSoftWrap: textSoftWrap,
        textOverflow: textOverflow,
        content: content,
        textAlign: textAlign,
        textExpanded: textExpanded,
        child: child,
      );

  static ButtonAspect icon({
    double size = 45,
    BoxConstraints? constraints,
    BorderRadius? borderRadius,
    BoxShape shape = BoxShape.circle,
    BoxBorder border = const Border.symmetric(
      horizontal: BorderSide(width: 1),
      vertical: BorderSide(width: 1),
    ),
    List<BoxShadow> boxShadow = const [
      BoxShadow(
        offset: Offset(0, 6),
        blurRadius: 3,
        spreadRadius: 0,
        color: Color.fromRGBO(0, 0, 0, 0.2),
      ),
    ],
    Color color = Colors.white,
    Color? bgColor,
    Color? bgColorDisabled,
    EdgeInsets padding = const EdgeInsets.all(0),
    EdgeInsets? margin,
    required Widget? icon,
  }) =>
      ButtonAspect(
        width: size,
        height: size,
        shape: shape,
        border: border,
        margin: margin,
        borderRadius: borderRadius,
        boxShadow: boxShadow,
        color: color,
        bgColor: bgColor,
        bgColorDisabled: bgColorDisabled,
        padding: padding,
        constraints: constraints,
        child: icon,
      );

  static ButtonAspect iconVariant(
    BuildContext context, {
    double size = 45,
    BoxConstraints? constraints,
    BorderRadius? borderRadius,
    BoxBorder border = const Border.symmetric(
      horizontal: BorderSide(width: 1),
      vertical: BorderSide(width: 1),
    ),
    BoxShape shape = BoxShape.circle,
    List<BoxShadow> boxShadow = const [],
    Color? color,
    Color? bgColor,
    Color? bgColorDisabled,
    EdgeInsets padding = const EdgeInsets.all(0),
    EdgeInsets? margin,
    required Widget? icon,
  }) =>
      ButtonAspect(
        width: size,
        height: size,
        shape: shape,
        border: border,
        margin: margin,
        borderRadius: borderRadius,
        boxShadow: boxShadow,
        color: color ?? ThemeApp.colors(context).text,
        bgColor: bgColor ?? ThemeApp.colors(context).tertiary,
        bgColorDisabled: bgColorDisabled,
        padding: padding,
        constraints: constraints,
        child: icon,
      );

  @override
  Widget build(BuildContext context) {
    final ts = textStyle ??
        TextStyle(
          color: color,
          fontSize: 10,
          letterSpacing: 3.9,
          fontWeight: FontWeight.w700,
          fontFamily: FontFamily.karla("700"),
        );

    final widgetText = Text(
      text ?? '',
      textAlign: textAlign,
      softWrap: textSoftWrap,
      overflow: textOverflow,
      style: ts,
    );

    return Container(
      margin: margin,
      padding: padding,
      width: width,
      height: height,
      constraints: constraints,
      decoration: BoxDecoration(
        color: bgColor ?? ThemeApp.colors(context).primary,
        shape: shape ?? BoxShape.rectangle,
        borderRadius: borderRadius,
        border: border,
        boxShadow: boxShadow,
      ),
      child: child ??
          Row(
              mainAxisAlignment:
                  buttonAxisAlignment ?? MainAxisAlignment.center,
              children: [
                if (leading != null) leading!,
                //
                if (leadingSpacer)
                  const Spacer()
                else if (leadingGap != null || gap != null)
                  Gap(leadingGap ?? gap!).row,
                //
                if (content != null)
                  content!
                else if (text.hasValue)
                  textExpanded ? Expanded(child: widgetText) : widgetText,
                //
                if (trailingSpacer)
                  const Spacer()
                else if (trailingGap != null || gap != null)
                  Gap(trailingGap ?? gap!).row,
                //
                if (trailing != null) trailing!,
              ]),
    );
  }
}
