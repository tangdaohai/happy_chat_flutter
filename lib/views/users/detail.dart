import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserDetail extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<UserDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Image(
            image: AssetImage('images/126244.jpg'),
            width: ScreenUtil().setWidth(375),
            height: ScreenUtil().setHeight(280),
            fit: BoxFit.fitWidth,
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text('悠扬小Q'),
                  subtitle: Text('昵称：悠扬小Q'),
                ),
                Divider(height: 1,),
              ],
            ),
          )
        ],
      ),
    );
  }
}