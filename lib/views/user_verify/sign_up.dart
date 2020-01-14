/**
 * 注册页面
 */
import 'package:flutter/material.dart';

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
        margin: const EdgeInsets.all(20.0),
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
                        margin: const EdgeInsets.only(top: 20),
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
                        margin: const EdgeInsets.symmetric(vertical: 25.0),
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
                          margin: const EdgeInsets.only(top: 56, bottom: 20),
                          child: RaisedButton(
                            padding: new EdgeInsets.symmetric(vertical: 22.0),
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
                        margin: const EdgeInsets.only(left: 10.0),
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