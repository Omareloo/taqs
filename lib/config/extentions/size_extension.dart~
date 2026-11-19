import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SizeExtension on num {
  ///[ScreenUtil.setWidth]
  double get w => ScreenUtil().setWidth(this);

  ///[ScreenUtil.setHeight]
  double get h => ScreenUtil().setHeight(this);

  ///[ScreenUtil.radius]
  double get r => ScreenUtil().radius(this);

  ///[ScreenUtil.diagonal]
  double get dg => ScreenUtil().diagonal(this);

  ///[ScreenUtil.diameter]
  double get dm => ScreenUtil().diameter(this);

  ///[ScreenUtil.setSp]
  double get sp => ScreenUtil().setSp(this);

  ///smart size :  it check your value - if it is bigger than your value it will set your value
  ///for example, you have set 16.sm() , if for your screen 16.sp() is bigger than 16 , then it will set 16 not 16.sp()
  ///I think that it is good for save size balance on big sizes of screen
  double get spMin => min(toDouble(), sp);

  @Deprecated('use spMin instead')
  double get sm => min(toDouble(), sp);

  double get spMax => max(toDouble(), sp);

  ///屏幕宽度的倍数
  ///Multiple of screen width
  double get sw => ScreenUtil().screenWidth * this;

  ///屏幕高度的倍数
  ///Multiple of screen height
  double get sh => ScreenUtil().screenHeight * this;

  ///[ScreenUtil.setHeight]
  SizedBox get verticalSpace => ScreenUtil().setVerticalSpacing(this);

  ///[ScreenUtil.setVerticalSpacingFromWidth]
  SizedBox get verticalSpaceFromWidth =>
      ScreenUtil().setVerticalSpacingFromWidth(this);

  ///[ScreenUtil.setWidth]
  SizedBox get horizontalSpace => ScreenUtil().setHorizontalSpacing(this);

  ///[ScreenUtil.radius]
  SizedBox get horizontalSpaceRadius =>
      ScreenUtil().setHorizontalSpacingRadius(this);

  ///[ScreenUtil.radius]
  SizedBox get verticalSpacingRadius =>
      ScreenUtil().setVerticalSpacingRadius(this);

  ///[ScreenUtil.diameter]
  SizedBox get horizontalSpaceDiameter =>
      ScreenUtil().setHorizontalSpacingDiameter(this);

  ///[ScreenUtil.diameter]
  SizedBox get verticalSpacingDiameter =>
      ScreenUtil().setVerticalSpacingDiameter(this);

  ///[ScreenUtil.diagonal]
  SizedBox get horizontalSpaceDiagonal =>
      ScreenUtil().setHorizontalSpacingDiagonal(this);

  ///[ScreenUtil.diagonal]
  SizedBox get verticalSpacingDiagonal =>
      ScreenUtil().setVerticalSpacingDiagonal(this);
}
