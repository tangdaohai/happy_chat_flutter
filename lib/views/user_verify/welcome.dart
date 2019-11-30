/**
 * 登录与注册的欢迎部分
 */
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          SvgPicture.asset('images/flutter-icon.svg', width: 210.0, height: 60.0,),
          Container(
            margin: const EdgeInsets.only(top: 40.0, bottom: 20.0),
            child: Text(
              'Welcome',
              textAlign: TextAlign.right,
              style: theme.textTheme.display1,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 40.0),
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