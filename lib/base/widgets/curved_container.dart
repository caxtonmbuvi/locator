import '../../exports.dart';

class CurvedSideContainerPainter extends CustomPainter {
  final Color color;
  final double topCurve;
  final double bottomCurve;

  CurvedSideContainerPainter({required this.color, required this.topCurve,required this.bottomCurve});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // Radius for all corners
    double cornerRadius = 5.0;

    Path path = Path()
      ..moveTo(0 + cornerRadius, 0) // Adjusted for top left corner radius
      // Top side curve
      ..quadraticBezierTo(
          size.width * 0.5,
          size.height * topCurve, // Control point for the top curve
          size.width - cornerRadius,
          0) // Adjusted for top right corner radius
      ..lineTo(size.width, cornerRadius) // Adjusted for top right corner radius
      // Right side
      ..lineTo(size.width,
          size.height - cornerRadius) // Adjusted for bottom right corner radius
      // Bottom side curve
      ..quadraticBezierTo(
          size.width * 0.5,
          size.height * bottomCurve, // Control point for the bottom curve
          cornerRadius,
          size.height) // Adjusted for bottom left corner radius
      ..lineTo(0,
          size.height - cornerRadius) // Adjusted for bottom left corner radius
      // Left side
      ..lineTo(0, cornerRadius) // Adjusted for top left corner radius
      // Rounded corners
      ..quadraticBezierTo(0, 0, cornerRadius, 0); // Top left corner curve

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
