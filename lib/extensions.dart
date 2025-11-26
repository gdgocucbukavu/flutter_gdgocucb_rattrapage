import 'package:flutter/material.dart';

extension OnWidgetExtension on Widget {
  Container bottomGap([double gap = 16.0]) {
    return Container(
      margin: EdgeInsets.only(bottom: gap),
      child: this,
    );
  }

  Expanded get expanded {
    return Expanded(flex: 1, child: this);
  }
}
