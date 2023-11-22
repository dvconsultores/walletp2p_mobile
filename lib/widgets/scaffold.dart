import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_p2p/utils/extensions/type_extensions.dart';
import 'package:wallet_p2p/utils/general/variables.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:wallet_p2p/utils/helper_widgets/responsive_layout.dart';

// * Custom background styled
class _BackgroundStyled extends StatelessWidget {
  const _BackgroundStyled({
    required this.child,
    required this.color,
    this.gradient,
    this.filterWidget,
    this.showBgDots = false,
  });
  final Color? color;
  final Gradient? gradient;
  final Positioned? filterWidget;
  final bool showBgDots;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Positioned.fill(
        child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              color: color,
              gradient: color == null
                  ? gradient ??
                      const SweepGradient(
                        center: Alignment.center,
                        transform: GradientRotation(-10.5),
                        colors: [
                          Color.fromRGBO(255, 255, 255, 0.53),
                          Color.fromRGBO(220, 220, 220, 0.48),
                          Color.fromRGBO(36, 200, 255, 0.35),
                          Color.fromRGBO(246, 246, 247, 1),
                        ],
                        stops: [0, 0.333, 0.666, 1],
                      )
                  : null,
            )),
      ),
      if (showBgDots)
        Positioned.fill(
          child: Image.asset('assets/images/bg-dots.png',
              height: Variables.mSize.height, fit: BoxFit.cover),
        ),
      if (filterWidget != null) filterWidget!,
      Positioned.fill(child: child),
    ]);
  }
}

// * Custom body background styled
class _BodyBackgroundStyled extends StatelessWidget {
  const _BodyBackgroundStyled({
    required this.child,
    this.footer,
    this.padding,
    required this.scrollable,
    required this.bgImgTop,
    required this.bgImg,
    required this.bgImgLeft,
    required this.heroTag,
  });
  final EdgeInsets? padding;
  final bool scrollable;
  final String? bgImg;
  final double? bgImgTop;
  final double? bgImgLeft;
  final String? heroTag;
  final Widget? footer;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final bgImgWidget = bgImg?.contains('.svg') ?? true
        ? SvgPicture.asset(bgImg ?? 'assets/images/circle.svg',
            fit: BoxFit.cover)
        : Image.asset(bgImg ?? 'assets/images/circle.png', fit: BoxFit.cover);

    final body = Stack(alignment: Alignment.topCenter, children: [
      // centered image
      Positioned(
        top: bgImgTop ?? Variables.bgImgTop1,
        left: bgImgLeft,
        child: heroTag.hasValue
            ? Hero(
                tag: heroTag!,
                child: bgImgWidget,
              )
            : bgImgWidget,
      ),
      Padding(
        padding: EdgeInsets.only(
          top: padding?.top ?? Variables.paddingScaffold.top,
          left: padding?.left ?? Variables.paddingScaffold.left,
          right: padding?.right ?? Variables.paddingScaffold.right,
          bottom: footer == null
              ? padding?.bottom ?? Variables.paddingScaffold.bottom
              : 0,
        ),
        child: child,
      ),
    ]);

    final scrollableBody =
        scrollable ? SingleChildScrollView(child: body) : body;

    return footer != null
        ? Column(children: [
            Expanded(child: scrollableBody),
            footer!,
            Gap(padding?.bottom ?? Variables.paddingScaffold.bottom).column
          ])
        : scrollableBody;
  }
}

/// ? Custom Application scaffold
class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.child,
    this.filterWidget,
    this.drawer,
    this.appBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.gradient,
    this.color,
    this.showBgDots = false,
  });
  final Widget? drawer;
  final PreferredSizeWidget? appBar;
  final Widget child;
  final Positioned? filterWidget;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final Gradient? gradient;
  final Color? color;
  final bool showBgDots;

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: drawer,
        appBar: appBar,
        body: _BackgroundStyled(
          color: color,
          gradient: gradient,
          filterWidget: filterWidget,
          showBgDots: showBgDots,
          child: child,
        ),
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
      );

  /// Responsive variant from `AppScaffold`
  static Widget responsive({
    Widget? Function(BuildContext context, BoxConstraints constraints)? mobile,
    Widget? Function(BuildContext context, BoxConstraints constraints)? tablet,
    Widget? Function(BuildContext context, BoxConstraints constraints)? desktop,
    Widget? Function(BuildContext context, BoxConstraints constraints)? tv,
    Positioned? filterWidget,
    Widget? drawer,
    PreferredSizeWidget? appBar,
    Widget? bottomNavigationBar,
    Widget? floatingActionButton,
    Gradient? gradient,
    Color? color,
    bool showBgDots = false,
  }) =>
      _AppScaffoldResponsive(
        drawer: drawer,
        appBar: appBar,
        mobile: mobile,
        tablet: tablet,
        desktop: desktop,
        tv: tv,
        filterWidget: filterWidget,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
        color: color,
        showBgDots: showBgDots,
        gradient: gradient,
      );
}

// ? Responsive variant from `AppScaffold`
class _AppScaffoldResponsive extends StatelessWidget {
  const _AppScaffoldResponsive({
    this.drawer,
    this.appBar,
    this.mobile,
    this.tablet,
    this.desktop,
    this.tv,
    this.filterWidget,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.gradient,
    this.showBgDots = false,
    required this.color,
  });
  final Widget? Function(BuildContext context, BoxConstraints constraints)?
      mobile;
  final Widget? Function(BuildContext context, BoxConstraints constraints)?
      tablet;
  final Widget? Function(BuildContext context, BoxConstraints constraints)?
      desktop;
  final Widget? Function(BuildContext context, BoxConstraints constraints)? tv;
  final Positioned? filterWidget;
  final Widget? drawer;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final Gradient? gradient;
  final Color? color;
  final bool showBgDots;

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: drawer,
        appBar: appBar,
        body: _BackgroundStyled(
          color: color,
          gradient: gradient,
          filterWidget: filterWidget,
          showBgDots: showBgDots,
          child: ResponsiveLayout(
            mobile: mobile,
            tablet: tablet,
            desktop: desktop,
            tv: tv,
          ),
        ),
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
      );
}

/// ? Custom Application scaffold body to `ShellRoute`
class ScaffoldBody extends StatelessWidget {
  const ScaffoldBody({
    super.key,
    required this.body,
    this.padding,
    this.scrollable = false,
    this.bgImg,
    this.bgImgTop,
    this.bgImgLeft,
    this.heroTag,
    this.footer,
  });
  final Widget body;
  final EdgeInsets? padding;
  final bool scrollable;
  final String? bgImg;
  final double? bgImgTop;
  final double? bgImgLeft;
  final String? heroTag;
  final Widget? footer;

  @override
  Widget build(BuildContext context) => _BodyBackgroundStyled(
        padding: padding,
        scrollable: scrollable,
        bgImg: bgImg,
        bgImgTop: bgImgTop,
        bgImgLeft: bgImgLeft,
        heroTag: heroTag,
        footer: footer,
        child: body,
      );

  /// Responsive variant from `ScaffoldBody`
  static Widget responsive({
    Widget? Function(BuildContext context, BoxConstraints constraints)? mobile,
    Widget? Function(BuildContext context, BoxConstraints constraints)? tablet,
    Widget? Function(BuildContext context, BoxConstraints constraints)? desktop,
    Widget? Function(BuildContext context, BoxConstraints constraints)? tv,
    EdgeInsets? padding,
    bool scrollable = false,
    String? bgImg,
    double? bgImgTop,
    double? bgImgLeft,
    String? heroTag,
    Widget? footer,
  }) =>
      _ScaffoldBodyResponsive(
        padding: padding,
        mobile: mobile,
        desktop: desktop,
        tablet: tablet,
        tv: tv,
        scrollable: scrollable,
        bgImg: bgImg,
        bgImgTop: bgImgTop,
        bgImgLeft: bgImgLeft,
        heroTag: heroTag,
        footer: footer,
      );
}

// ? Responsive variant from `ScaffoldBody`
class _ScaffoldBodyResponsive extends StatelessWidget {
  const _ScaffoldBodyResponsive({
    this.padding,
    this.mobile,
    this.tablet,
    this.desktop,
    this.tv,
    required this.scrollable,
    required this.bgImg,
    required this.bgImgTop,
    required this.bgImgLeft,
    required this.heroTag,
    this.footer,
  });
  final Widget? Function(BuildContext context, BoxConstraints constraints)?
      mobile;
  final Widget? Function(BuildContext context, BoxConstraints constraints)?
      tablet;
  final Widget? Function(BuildContext context, BoxConstraints constraints)?
      desktop;
  final Widget? Function(BuildContext context, BoxConstraints constraints)? tv;
  final EdgeInsets? padding;
  final bool scrollable;
  final String? bgImg;
  final double? bgImgTop;
  final double? bgImgLeft;
  final String? heroTag;
  final Widget? footer;

  @override
  Widget build(BuildContext context) => _BodyBackgroundStyled(
        padding: padding,
        scrollable: scrollable,
        bgImg: bgImg,
        bgImgTop: bgImgTop,
        bgImgLeft: bgImgLeft,
        heroTag: heroTag,
        footer: footer,
        child: ResponsiveLayout(
          mobile: mobile,
          tablet: tablet,
          desktop: desktop,
          tv: tv,
        ),
      );
}
