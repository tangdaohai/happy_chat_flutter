/**
 * 注册页面
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './welcome.dart';

class SignUp extends StatefulWidget {
  @override
  SignInState createState() => SignInState();
}

class SignInState extends State<SignUp> {
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
                        margin: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(25)),
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
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: ScreenUtil().setHeight(56), bottom: ScreenUtil().setHeight(20)),
                          child: RaisedButton(
                            padding: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(22)),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                print('校验成功');
                                _formKey.currentState.save();
                                print(username);
                                print(password);
                              } else {
                                print('校验失败');
                              }
                            },
                            child: Text('SIGN UP', style: theme.primaryTextTheme.title),
                            // textTheme: 
                          )
                        )
                      )
                    ]
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                        child: FlatButton (
                          onPressed: () => Navigator.pushNamed(context, '/sign_in'),
                          child: Text('SIGN IN', style: TextStyle(color: theme.primaryColor),),
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