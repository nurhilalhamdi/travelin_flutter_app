import 'package:flutter/cupertino.dart';

class RoundedRectangleTabIndicator extends Decoration {
  final BoxPainter _painter;

  RoundedRectangleTabIndicator(
      {required Color color, required double weight, required double width})
      : _painter = _RRectanglePainterColor(color, weight, width);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _painter;
}

class _RRectanglePainterColor extends BoxPainter {
  final Paint _paint;
  final double _weight;
  final double _width;

  _RRectanglePainterColor(Color color, this._weight, this._width)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // TODO: implement paint

    final Offset CustomOffset = offset +
        Offset(configuration.size!.width / 2 - (_width * 0.5),
            configuration.size!.height - _weight);

    //custom rectangle
    Rect myRect = CustomOffset & Size(_width, _weight);

    //custom Rounded rectangle
    RRect myRRect = RRect.fromRectXY(myRect, _weight, _weight);

    canvas.drawRRect(myRRect, _paint);
  }
}
