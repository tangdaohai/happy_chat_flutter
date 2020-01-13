import 'package:flutter/material.dart';

import './index.dart';
import 'views/user_verify/sign_in.dart';
import 'views/user_verify/sign_up.dart';
import 'views/message_list/message_list.dart';
import 'views/conversation/conversation.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF6200EE),
        buttonColor: Color(0xFF6200EE)
      ),
      home: Index(),
      routes: <String, WidgetBuilder>{
        '/sign_in': (BuildContext context) => SignIn(),
        '/sign_up': (BuildContext context) => SignUp(),
        '/message_list': (BuildContext context) => MessageList(),
        '/conversation': (BuildContext contextt) => Conversation()
      },
    );
  }
}