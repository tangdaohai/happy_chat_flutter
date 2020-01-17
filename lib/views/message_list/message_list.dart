import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class MessageList extends StatefulWidget {
  @override
  MessageListState createState() => MessageListState();
}

class MessageListState extends State<MessageList> {
  final SlidableController slidableController = SlidableController();
  _showSnackBar (str) {
    print(str);
  }
  Slidable _msgTile (BuildContext context, int index) {
    return Slidable(
      controller: slidableController,
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, '/conversation');
        },
        enabled: true,
        // leading: Image(image: AssetImage('images/126244.jpg'),),
        leading: CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage('images/126244.jpg'),
        ),
        title: Text('养猫的人' + index.toString()),
        subtitle: Text('早上好'),      
        trailing: Container(
          // padding: const EdgeInsets.symmetric(vertical: 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('9:20'),
              CircleAvatar(
                backgroundColor: Colors.deepPurple,
                radius: 14,
                child: Text('99+', style: Theme.of(context).textTheme.caption.copyWith(color: Colors.white)),
              )
            ],
          ),
        ),
      ),
      actions: <Widget>[
        IconSlideAction(
          caption: '置顶',
          color: Colors.blue,
          icon: Icons.vertical_align_top,
          onTap: () => _showSnackBar('Archive'),
        ),
        // IconSlideAction(
        //   caption: 'Share',
        //   color: Colors.indigo,
        //   icon: Icons.share,
        //   onTap: () => _showSnackBar('Share'),
        // ),
      ],
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: '标记未读',
          color: Colors.black45,
          icon: Icons.more_horiz,
          onTap: () => _showSnackBar('More'),
        ),
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => _showSnackBar('Delete'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        elevation: 0,
        title: Text('Happy Chat'),
        leading: new IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => print('菜单..'),
        ),
        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.search),
            onPressed: () => print('搜索..'),
          )
        ]
      ),
      body: Card(
        margin: const EdgeInsets.all(0.0),
        shape: RoundedRectangleBorder(),
        elevation: 0,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(-30, -30),
                  child: Transform.rotate(
                    angle: pi/4,
                    child: SizedBox(
                      height: 60,
                      width: 60,
                      child: Container(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
                Expanded(child: Text('2位好友的消息位未读', style: Theme.of(context).textTheme.body2,))
              ],
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return _msgTile(context, index);
                },
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 65),
                    child: Divider(height: 1,),
                  );
                },
              ),
            )
          ],
        )
      )
      // body: ListView(
      //   children: <Widget>[
          
      //     Divider()
      //   ]
      // ),
    );
  }
}