/**
 * 登录与注册的欢迎部分
 */
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Expanded(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SvgPicture.asset('images/flutter-icon.svg', width: ScreenUtil().setWidth(210), height: ScreenUtil().setHeight(60),),
          Container(
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(40), bottom: ScreenUtil().setHeight(20)),
            child: Text(
              'Welcome',
              textAlign: TextAlign.right,
              style: theme.textTheme.display1.copyWith(fontSize: ScreenUtil().setSp(theme.textTheme.display1.fontSize)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(40)),
            child: Text(
              'Code changes the world.',
              style: theme.textTheme.body1.copyWith(color: theme.textTheme.body1.color.withOpacity(0.6))
            ),
          )
        ]
      )
    );
  }
}