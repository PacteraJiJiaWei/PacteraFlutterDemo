import 'package:flutter/material.dart';
import 'dart:ui';

class BaseFrame {

  /// 安全高度
  static double safeHeight() {
    return BaseFrame.height()-BaseFrame.topSafe()-BaseFrame.bottomSafe();
  }

  /// 安全宽度
  static double safeWidth() {
    return BaseFrame.width()-BaseFrame.leftSafe()-BaseFrame.rightSafe();
  }

  /// 约束比例(根据屏幕安全宽度百分比)
  static double scale(double num) {
    return (BaseFrame.width()-BaseFrame.leftSafe()-BaseFrame.rightSafe())/100;
  }

  /// 左侧安全距离
  static double leftSafe() {
    return MediaQueryData.fromWindow(window).padding.left;
  }

  /// 右侧安全距离
  static double rightSafe() {
    return MediaQueryData.fromWindow(window).padding.right;
  }

  /// 顶部安全距离
  static double topSafe() {
    return MediaQueryData.fromWindow(window).padding.top;
  }

  /// 底部安全距离
  static double bottomSafe() {
    return MediaQueryData.fromWindow(window).padding.bottom;
  }

  /// 屏幕高度
  static double height() {
    return MediaQueryData.fromWindow(window).size.height;
  }

  /// 屏幕宽度
  static double width() {
    return MediaQueryData.fromWindow(window).size.width;
  }
}
