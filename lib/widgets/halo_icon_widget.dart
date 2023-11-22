import 'package:flutter/material.dart';
import 'package:wallet_p2p/utils/config/theme.dart';
import 'package:wallet_p2p/utils/extensions/type_extensions.dart';
import 'package:flutter_gap/flutter_gap.dart';

class HaloIconWidget extends StatelessWidget {
  const HaloIconWidget({
    super.key,
    required this.icon,
    this.text,
    this.color = Colors.white,
    this.size = 42,
    this.firstHaloSize,
    this.secondHaloSize,
  });
  final Widget icon;
  final double size;
  final Color color;
  final String? text;
  final double? firstHaloSize;
  final double? secondHaloSize;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: ThemeApp.colors(context).primary,
          letterSpacing: .36,
          fontWeight: FontWeight.w700,
          fontFamily: FontFamily.karla("700"),
        );

    double haloSum() {
      final haloSize = (firstHaloSize ?? 0) + (secondHaloSize ?? 0);

      if (haloSize == 0) return 19;
      return haloSize;
    }

    return Column(children: [
      CustomPaint(
        painter: _CustomPainter(
          iconSize: size,
          color: color,
          firstHaloSize: firstHaloSize,
          secondHaloSize: secondHaloSize,
        ),
        child: SizedBox(
          width: size + haloSum(),
          height: size + haloSum(),
          child: Align(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              child: icon,
            ),
          ),
        ),
      ),
      const Gap(17).column,
      if (text.hasValue)
        SizedBox(
          width: 69,
          child: Text(text!, textAlign: TextAlign.center, style: textStyle),
        ),
    ]);
  }
}

class _CustomPainter extends CustomPainter {
  const _CustomPainter({
    required this.color,
    required this.iconSize,
    this.firstHaloSize,
    this.secondHaloSize,
  });
  final Color color;
  final double iconSize;
  final double? firstHaloSize;
  final double? secondHaloSize;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = iconSize / 2;

    final mainCirclePaint = Paint()..color = color;
    final rect = Rect.fromCircle(center: center, radius: radius);
    canvas.drawOval(rect, mainCirclePaint);

    final haloPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    final haloRect = Rect.fromCircle(
      center: center,
      radius: radius + (firstHaloSize ?? 6),
    );
    canvas.drawOval(haloRect, haloPaint);

    final haloRect2 = Rect.fromCircle(
      center: center,
      radius: radius + (secondHaloSize ?? 13),
    );
    canvas.drawOval(haloRect2, haloPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
