import 'package:flutter/material.dart';
import 'views/user_verify/sign_in.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 初始化分辨率自适应相关
    ScreenUtil.init(context, width: 375, height: 812, allowFontScaling: true);
    // 判断是否登录 跳转到对应的页面
    return SignIn();
  }
}