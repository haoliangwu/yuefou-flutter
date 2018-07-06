import 'package:flutter/material.dart';

class MajorText extends Text {
  MajorText(String content, {color = Colors.black87, size = 16.0})
      : super(content,
            style: TextStyle(
              fontSize: size,
              color: color,
            ));
}
