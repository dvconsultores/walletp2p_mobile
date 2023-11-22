import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet_p2p/utils/config/theme.dart';
import 'package:wallet_p2p/utils/extensions/type_extensions.dart';
import 'package:wallet_p2p/utils/general/variables.dart';
import 'package:wallet_p2p/utils/helper_widgets/custom_transition_wrapper.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:wallet_p2p/widgets/button.dart';
import 'package:wallet_p2p/widgets/drawer.dart';
import 'package:wallet_p2p/widgets/tooltip.dart';

/// ? Custom Application header
class AppHeader extends StatelessWidget {
  const AppHeader({
    super.key,
    this.showArrow = true,
    this.width,
    this.desc,
    this.descAlign,
    this.descTextAlign = TextAlign.center,
    this.descExpanded = false,
    this.descTip,
    this.topText,
    this.bottomText,
    this.topTextAlign,
    this.topTextPaddingLeft,
    this.topTextPaddingRight,
    this.bottomTextAlign,
    this.bottomTextPaddingLeft,
    this.bottomTextPaddingRight,
    this.leadingWidget,
    this.traillingWidget,
    this.showOptions = false,
    this.middleText,
    this.middleTextAlign,
    this.middleTextPaddingLeft,
    this.middleTextPaddingRight,
  });
  final bool showArrow;
  final double? width;
  final String? topText;
  final Alignment? topTextAlign;
  final double? topTextPaddingLeft;
  final double? topTextPaddingRight;
  final String? bottomText;
  final Alignment? bottomTextAlign;
  final double? bottomTextPaddingLeft;
  final double? bottomTextPaddingRight;
  final String? desc;
  final bool descExpanded;
  final AlignmentGeometry? descAlign;
  final TextAlign descTextAlign;
  final String? descTip;
  final Widget? leadingWidget;
  final Widget? traillingWidget;
  final bool showOptions;
  final String? middleText;
  final AlignmentGeometry? middleTextAlign;
  final double? middleTextPaddingLeft;
  final double? middleTextPaddingRight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          leadingWidget ??
              Align(
                  alignment: Alignment.centerLeft,
                  child: Opacity(
                    opacity: showArrow ? 1 : 0,
                    child: CircleAvatar(
                      radius: 15.5,
                      backgroundColor: ThemeApp.colors(context).primary,
                      child: IconButton(
                        splashRadius: 15.5,
                        icon: SvgPicture.asset('assets/icons/arrow_back.svg'),
                        color: Colors.white,
                        onPressed: context.pop,
                      ),
                    ),
                  )),
          if (traillingWidget != null)
            traillingWidget!
          else if (showOptions)
            Row(children: [
              Button.icon(
                size: Variables.headerButtonSize,
                icon: Image.asset("assets/icons/avatar-colored.png"),
                bgColor: Colors.transparent,
                boxShadow: [],
                onPressed: () => context.pushNamed("accountDetails"),
              ),
              const Gap(14).row,
              Button.icon(
                size: Variables.headerButtonSize,
                icon: SvgPicture.asset("assets/icons/options.svg"),
                boxShadow: [],
                onPressed: () => Navigator.of(context).push(PageRouteBuilder(
                  transitionDuration: const Duration(seconds: 2),
                  reverseTransitionDuration: const Duration(milliseconds: 600),
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const AppDrawer(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    final size = MediaQuery.of(context).size;

                    final x = size.width -
                        Variables.paddingScaffold.right -
                        (Variables.headerButtonSize / 2);
                    final y = Variables.paddingScaffold.top +
                        (Variables.headerButtonSize / 2);

                    const begin = Variables.headerButtonSize / 2;
                    final end = size.height + size.width / 2;

                    return CustomTransitionWrapper.circleFade(
                      radiusBegin: begin,
                      radiusEnd: end,
                      offset: Offset(x, y),
                      animation: animation,
                      child: child,
                    );
                  },
                )),
              )
            ])
        ]),
        if (topText.hasValue || bottomText.hasValue || desc.hasValue) ...[
          const Gap(16).column,
          CustomTitle(
            width: width,
            topText: topText,
            topTextAlign: topTextAlign,
            topTextPaddingLeft: topTextPaddingLeft,
            topTextPaddingRight: topTextPaddingRight,
            bottomText: bottomText,
            bottomTextAlign: bottomTextAlign,
            bottomTextPaddingLeft: bottomTextPaddingLeft,
            bottomTextPaddingRight: bottomTextPaddingRight,
            desc: desc,
            descAlign: descAlign,
            descTip: descTip,
            descTextAlign: descTextAlign,
            descExpanded: descExpanded,
            middleText: middleText,
            middleTextAlign: middleTextAlign,
            middleTextPaddingLeft: middleTextPaddingLeft,
            middleTextPaddingRight: middleTextPaddingRight,
          ),
        ]
      ]),
    );
  }
}

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
    this.width,
    this.topText,
    this.topTextAlign,
    this.topTextPaddingLeft,
    this.topTextPaddingRight,
    this.bigTextStyle,
    this.bottomText,
    this.bottomTextAlign,
    this.bottomTextPaddingLeft,
    this.bottomTextPaddingRight,
    this.desc,
    this.descAlign,
    this.descTip,
    this.descTextAlign = TextAlign.center,
    this.descExpanded = false,
    this.middleText,
    this.middleTextAlign,
    this.middleTextPaddingLeft,
    this.middleTextPaddingRight,
  });

  final double? width;
  final String? topText;
  final Alignment? topTextAlign;
  final double? topTextPaddingLeft;
  final double? topTextPaddingRight;
  final TextStyle? bigTextStyle;
  final String? bottomText;
  final Alignment? bottomTextAlign;
  final double? bottomTextPaddingLeft;
  final double? bottomTextPaddingRight;
  final String? desc;
  final AlignmentGeometry? descAlign;
  final TextAlign descTextAlign;
  final String? descTip;
  final bool descExpanded;
  final String? middleText;
  final AlignmentGeometry? middleTextAlign;
  final double? middleTextPaddingLeft;
  final double? middleTextPaddingRight;

  @override
  Widget build(BuildContext context) {
    final bigTextStyle = Theme.of(context).textTheme.titleLarge;

    final descStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: ThemeApp.colors(context).textVariant,
          fontWeight: FontWeight.w700,
          fontFamily: FontFamily.karla("700"),
          letterSpacing: 0.36,
        );

    final descWidget =
        Text(desc ?? '', textAlign: descTextAlign, style: descStyle);

    return SizedBox(
        width: width,
        child: Column(children: [
          if (topText.hasValue)
            Align(
                alignment: topTextAlign ?? Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: topTextPaddingLeft ?? 0,
                      right: topTextPaddingRight ?? 0),
                  child: Text(topText!, style: bigTextStyle),
                )),
          if (middleText.hasValue)
            Align(
                alignment: middleTextAlign ?? Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: middleTextPaddingLeft ?? 0,
                      right: middleTextPaddingRight ?? 0),
                  child: Text(middleText!, style: bigTextStyle),
                )),
          if (bottomText.hasValue)
            Align(
                alignment: bottomTextAlign ?? Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: bottomTextPaddingLeft ?? 0,
                      right: bottomTextPaddingRight ?? 0),
                  child: Text(bottomText!, style: bigTextStyle),
                )),
          if (desc.hasValue) ...[
            const Gap(16).column,
            Row(children: [
              if (descExpanded)
                Expanded(child: descWidget)
              else
                Align(
                  alignment: descAlign ?? Alignment.center,
                  child: descWidget,
                ),
              if (descTip != null) ...[
                const Gap(8).row,
                AppTooltip(
                  message: descTip,
                  child: SvgPicture.asset("assets/icons/info-blue.svg"),
                )
              ]
            ]),
          ]
        ]));
  }
}
