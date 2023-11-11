import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallet_p2p/utils/general/variables.dart';
import 'package:wallet_p2p/utils/helper_widgets/responsive_layout.dart';

// * Custom background styled
class _BackgroundStyled extends StatelessWidget {
  const _BackgroundStyled({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Positioned.fill(
        child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: const BoxDecoration(
              gradient: SweepGradient(
                center: Alignment.center,
                transform: GradientRotation(-10.5),
                colors: [
                  Color.fromRGBO(255, 255, 255, 0.53),
                  Color.fromRGBO(220, 220, 220, 0.48),
                  Color.fromRGBO(36, 200, 255, 0.35),
                  Color.fromRGBO(246, 246, 247, 1),
                ],
                stops: [0, 0.333, 0.666, 1],
              ),
            )),
      ),
      Positioned.fill(child: child),
    ]);
  }
}

// * Custom body background styled
class _BodyBackgroundStyled extends StatelessWidget {
  const _BodyBackgroundStyled({
    required this.child,
    this.color,
    this.padding,
    required this.scrollable,
    required this.bgImgTop,
    required this.bgImg,
    required this.showBgDots,
  });
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final bool scrollable;
  final String? bgImg;
  final double? bgImgTop;
  final bool showBgDots;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final widget = Stack(alignment: Alignment.topCenter, children: [
      if (showBgDots)
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Image.asset('assets/images/bg-dots.png',
              height: Variables.mSize.height, fit: BoxFit.cover),
        ),

      // centered image
      Positioned(
        top: bgImgTop ?? 109,
        child: bgImg?.contains('.svg') ?? true
            ? SvgPicture.asset(bgImg ?? 'assets/images/circle.svg',
                fit: BoxFit.cover)
            : Image.asset(bgImg ?? 'assets/images/circle.png',
                fit: BoxFit.cover),
      ),
      Container(
        color: color,
        padding: padding ?? Variables.paddingScaffold,
        child: child,
      ),
    ]);

    return scrollable ? SingleChildScrollView(child: widget) : widget;
  }
}

/// ? Custom Application scaffold
class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.child,
    this.drawer,
    this.appBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
  });
  final Widget? drawer;
  final PreferredSizeWidget? appBar;
  final Widget child;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: drawer,
        appBar: appBar,
        body: _BackgroundStyled(child: child),
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
      );

  /// Responsive variant from `AppScaffold`
  static Widget responsive({
    Widget? Function(BuildContext context, BoxConstraints constraints)? mobile,
    Widget? Function(BuildContext context, BoxConstraints constraints)? tablet,
    Widget? Function(BuildContext context, BoxConstraints constraints)? desktop,
    Widget? Function(BuildContext context, BoxConstraints constraints)? tv,
    Widget? drawer,
    PreferredSizeWidget? appBar,
    Widget? bottomNavigationBar,
    Widget? floatingActionButton,
  }) =>
      _AppScaffoldResponsive(
        drawer: drawer,
        appBar: appBar,
        mobile: mobile,
        tablet: tablet,
        desktop: desktop,
        tv: tv,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
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
    this.bottomNavigationBar,
    this.floatingActionButton,
  });
  final Widget? Function(BuildContext context, BoxConstraints constraints)?
      mobile;
  final Widget? Function(BuildContext context, BoxConstraints constraints)?
      tablet;
  final Widget? Function(BuildContext context, BoxConstraints constraints)?
      desktop;
  final Widget? Function(BuildContext context, BoxConstraints constraints)? tv;
  final Widget? drawer;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: drawer,
        appBar: appBar,
        body: _BackgroundStyled(
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
    this.color,
    this.scrollable = false,
    this.bgImg,
    this.bgImgTop,
    this.showBgDots = false,
  });
  final Widget body;
  final EdgeInsetsGeometry? padding;
  final bool scrollable;
  final Color? color;
  final String? bgImg;
  final double? bgImgTop;
  final bool showBgDots;

  @override
  Widget build(BuildContext context) => _BodyBackgroundStyled(
        color: color,
        padding: padding,
        scrollable: scrollable,
        bgImg: bgImg,
        bgImgTop: bgImgTop,
        showBgDots: showBgDots,
        child: body,
      );

  /// Responsive variant from `ScaffoldBody`
  static Widget responsive({
    Widget? Function(BuildContext context, BoxConstraints constraints)? mobile,
    Widget? Function(BuildContext context, BoxConstraints constraints)? tablet,
    Widget? Function(BuildContext context, BoxConstraints constraints)? desktop,
    Widget? Function(BuildContext context, BoxConstraints constraints)? tv,
    EdgeInsetsGeometry? padding,
    bool scrollable = false,
    Color? color,
    String? bgImg,
    double? bgImgTop,
    bool showBgDots = false,
  }) =>
      _ScaffoldBodyResponsive(
        color: color,
        padding: padding,
        mobile: mobile,
        desktop: desktop,
        tablet: tablet,
        tv: tv,
        scrollable: scrollable,
        bgImg: bgImg,
        bgImgTop: bgImgTop,
        showBgDots: showBgDots,
      );
}

// ? Responsive variant from `ScaffoldBody`
class _ScaffoldBodyResponsive extends StatelessWidget {
  const _ScaffoldBodyResponsive({
    this.padding,
    this.color,
    this.mobile,
    this.tablet,
    this.desktop,
    this.tv,
    required this.scrollable,
    required this.bgImg,
    required this.bgImgTop,
    required this.showBgDots,
  });
  final Widget? Function(BuildContext context, BoxConstraints constraints)?
      mobile;
  final Widget? Function(BuildContext context, BoxConstraints constraints)?
      tablet;
  final Widget? Function(BuildContext context, BoxConstraints constraints)?
      desktop;
  final Widget? Function(BuildContext context, BoxConstraints constraints)? tv;
  final EdgeInsetsGeometry? padding;
  final bool scrollable;
  final Color? color;
  final String? bgImg;
  final double? bgImgTop;
  final bool showBgDots;

  @override
  Widget build(BuildContext context) => _BodyBackgroundStyled(
        color: color,
        padding: padding,
        scrollable: scrollable,
        bgImg: bgImg,
        bgImgTop: bgImgTop,
        showBgDots: showBgDots,
        child: ResponsiveLayout(
          mobile: mobile,
          tablet: tablet,
          desktop: desktop,
          tv: tv,
        ),
      );
}
