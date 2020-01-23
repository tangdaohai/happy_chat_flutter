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
      body: Stack(
        // overflow: Overflow.visible,
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            top: 0,
            child: Image(
              image: AssetImage('images/126244.jpg'),
              width: ScreenUtil().setWidth(375),
            ),
          ),
          Positioned.fill(
            top: ScreenUtil().setHeight(280),
            child: ListView(
              children: <Widget>[
                Card(
                  // elevation: 0,
                  shape: RoundedRectangleBorder(),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text('悠扬小Q'),
                        subtitle: Text('昵称：悠扬小Q'),
                      ),
                      Divider(height: 1,),
                      ListTile(
                        title: Text('EA888'),
                        subtitle: Text('ID'),
                      ),
                      Divider(height: 1,),
                    ],
                  ),
                ),
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text('程序员'),
                        subtitle: Text('标签'),
                      ),
                      Divider(height: 1,),
                      ListTile(
                        title: Text('悠扬小Q'),
                        subtitle: Text('昵称：悠扬小Q'),
                      ),
                      Divider(height: 1,),
                      ListTile(
                        title: Text('悠扬小Q'),
                        subtitle: Text('昵称：悠扬小Q'),
                      ),
                      Divider(height: 1,),
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
          ),
        ],
      ),
    );
  }
}