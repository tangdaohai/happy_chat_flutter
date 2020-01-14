/**
 * 登录页面
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './welcome.dart';

class SignIn extends StatefulWidget {
  @override
  SignInState createState() => SignInState();
}

class SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    var username;
    var password;
    return Scaffold(
      // 防止键盘弹出的时候 挤压元素发生位移
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.all(ScreenUtil().setWidth(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Welcome(),
            Expanded(
              flex: 3,
              child: Column(
                children: <Widget>[
                  Form(
                    key: _formKey,
                    child: Column(children: <Widget>[
                      Container(
                        constraints: BoxConstraints(
                          maxHeight: ScreenUtil().setHeight(75)
                        ),
                        margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
                        child: TextFormField(
                          onSaved: (val) => username = val,
                          validator: (value) {
                            return value.isEmpty ? 'please enter username' : null;
                          },
                          decoration: InputDecoration(
                            helperText: '',
                            labelText: 'username'
                          ),
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(
                          maxHeight: ScreenUtil().setHeight(75)
                        ),
                        margin: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(25)),
                        child: TextFormField(
                          onSaved: (val) => password = val,
                          showCursor: true,
                          obscureText: true,
                          validator: (value) {
                            return value.isEmpty ? 'please enter password' : null;
                          },
                          decoration: InputDecoration(
                            // 设置空格是固定高度的作用，否则在出现错误提示的时候高度会发生变化
                            helperText: '',
                            labelText: 'password'
                          )
                        )
                      ),
                    ],),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        constraints: BoxConstraints(maxHeight: ScreenUtil().setHeight(36)),
                        child: FlatButton(
                          child: Text(
                            'Forget Password?',
                            style: theme.textTheme.button.copyWith(color: theme.textTheme.button.color.withOpacity(0.6)),
                          ),
                          onPressed: () {}
                        )
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(20)),
                          child: RaisedButton(
                            padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(22)),
                            onPressed: () {
                              Navigator.pushNamed(context, '/message_list');
                              // if (_formKey.currentState.validate()) {
                              //   print('校验成功');
                              //   _formKey.currentState.save();
                              //   print(username);
                              //   print(password);
                              // } else {
                              //   print('校验失败');
                              // }
                            },
                            child: Text('SIGN IN', style: theme.primaryTextTheme.title.copyWith(fontSize: ScreenUtil().setSp(theme.primaryTextTheme.title.fontSize))),
                            // textTheme: 
                          )
                        )
                      )
                    ]
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'new user?',
                      ),
                      Container(
                        margin: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                        child: FlatButton (
                          onPressed: () => Navigator.pushNamed(context, '/sign_up'),
                          child: Text('SIGN UP', style: TextStyle(color: theme.primaryColor),),
                        ),
                      )
                    ],
                  )
                ]
              )
            )
          ],
        ),
      ),
    );
  }
}