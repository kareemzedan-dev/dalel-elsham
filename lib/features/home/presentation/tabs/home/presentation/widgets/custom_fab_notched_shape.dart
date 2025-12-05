import 'dart:math' as math;
import 'package:flutter/material.dart';

class CustomFABNotchedShape extends NotchedShape {
  @override
  Path getOuterPath(Rect host, Rect? guest) {
    if (guest == null) {
      return Path()..addRect(host);
    }

    final double fabRadius = guest.width / 2.0;
    final double notchRadius = fabRadius + 3.0; // حجم القصّة
    final double notchCenter = guest.center.dx;

    final double notchStart = notchCenter - notchRadius;
    final double notchEnd = notchCenter + notchRadius;

    final path = Path()..moveTo(host.left, host.top);
    path.lineTo(notchStart, host.top);

    // 👇 قوس فعلي مقصوص
    path.arcTo(
      Rect.fromCircle(center: Offset(notchCenter, host.top), radius: notchRadius),
      math.pi, // يبدأ من اليسار
      -math.pi, // نصف دائرة لأعلى
      false,
    );

    path.lineTo(host.right, host.top);
    path.lineTo(host.right, host.bottom);
    path.lineTo(host.left, host.bottom);
    path.close();

    return path;
  }
}
