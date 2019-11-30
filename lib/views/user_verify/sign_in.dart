/**
 * 登录页面
 */
import 'package:flutter/material.dart';

import './welcome.dart';

class SignIn extends StatefulWidget {
  @override
  SignInState createState() => SignInState();
}

class SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final _formKey = GlobalKey<FormState>();
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FlatButton(
                        child: Text(
                          'Forget Password?',
                          style: theme.textTheme.button.copyWith(color: theme.textTheme.button.color.withOpacity(0.6)),
                        ),
                        onPressed: () {}
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 20.0),
                          child: RaisedButton(
                            padding: new EdgeInsets.symmetric(vertical: 22.0),
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
                            child: Text('SIGN IN', style: theme.primaryTextTheme.title),
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
                        margin: const EdgeInsets.only(left: 10.0),
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