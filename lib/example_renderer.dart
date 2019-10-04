import 'dart:ui';
import 'animated_procedural_shape.dart';

class ExampleRenderer extends ProceduralShapeRenderer {
  @override
  void advance(double elapsed) {}

  @override
  void render(Size size, Offset offset, Canvas canvas) {
    Path path = Path();
    path.addOval(
      Rect.fromCenter(
        center: Offset(offset.dx + size.width / 2, offset.dy + size.height / 2),
        width: 200,
        height: 200,
      ),
    );

    // Trim by computing metrics...
    PathMetrics metrics = path.computeMetrics();
	PathMetric metric = metrics.first;
	// ... and then extracting the path.
    //Path trimmedPath = metric.extractPath(0, metric.length / 2);
    // PathMetric metric = metrics.first;
    Path trimmedPath = metric.extractPath(0, 0.00002);
    // // Path trimmedPath = metric.extractPath(0, 0.0003);
    // Path trimmedPath = metric.extractPath(0, metric.length/2);

    canvas.drawPath(
        trimmedPath,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 150
          ..color = const Color.fromRGBO(255, 255, 255, 1));
  }
}
