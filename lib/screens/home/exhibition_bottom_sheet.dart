import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

const double minHeight = 220;

class ExhibitionBottomSheet extends StatefulWidget {
  final bool show;
  const ExhibitionBottomSheet({Key key, @required this.show});

  @override
  _ExhibitionBottomSheetState createState() => _ExhibitionBottomSheetState();
}

class _ExhibitionBottomSheetState extends State<ExhibitionBottomSheet>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  double get maxHeight => MediaQuery.of(context).size.height;

  double get headerTopMargin =>
      lerp(20, 20 + MediaQuery.of(context).padding.top);

  double get headerFontSize => lerp(14, 24);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double lerp(double min, double max) =>
      lerpDouble(min, max, _controller.value);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Positioned(
          height: lerp(minHeight, maxHeight),
          left: 0,
          right: 0,
          bottom: 0,
          child: AnimatedOpacity(
            opacity: 1,
            duration: const Duration(milliseconds: 100),
            child: GestureDetector(
              onVerticalDragUpdate: _handleDragUpdate,
              onVerticalDragEnd: _handleDragEnd,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                decoration: const BoxDecoration(
                  color: Color(0xFF162A49),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                child: Stack(
                  children: <Widget>[
                    SheetHeader(
                      fontSize: headerFontSize,
                      topMargin: headerTopMargin,
                    ),
                    Positioned(
                      child: Text('data'),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    _controller.value -= details.primaryDelta / maxHeight;
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_controller.isAnimating ||
        _controller.status == AnimationStatus.completed) return;

    final double flingVelocity =
        details.velocity.pixelsPerSecond.dy / maxHeight;
    if (flingVelocity < 0.0)
      _controller.fling(velocity: math.max(2.0, -flingVelocity));
    else if (flingVelocity > 0.0)
      _controller.fling(velocity: math.min(-2.0, -flingVelocity));
    else
      _controller.fling(velocity: _controller.value < 0.5 ? -2.0 : 2.0);
  }
}

class SheetHeader extends StatelessWidget {
  final double fontSize;
  final double topMargin;

  const SheetHeader(
      {Key key, @required this.fontSize, @required this.topMargin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: topMargin,
      child: Text(
        'Booked Exhibition',
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
