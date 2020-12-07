import 'package:email_app/MessageDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'ComposeMessage.dart';
import 'Message.dart';

class MessagesList extends StatefulWidget {
  MessagesList({Key key, this.title, this.status = "local"}) : super(key: key);
  final String title;
  final String status;

  @override
  _MessagesListState createState() => _MessagesListState();
}

class _MessagesListState extends State<MessagesList> {
  var messages = [];
  Future futureMessages;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    fetch();
  }

  void fetch() async {
    messages.clear();
    print(widget.status);
    futureMessages = Message.loadMessages(widget.status);
    messages = await futureMessages;
    print(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: FutureBuilder(
                future: futureMessages,
                // ignore: missing_return
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  messages = snapshot.data;
                  switch (snapshot.connectionState) {
                    case ConnectionState.active:
                    case ConnectionState.waiting:
                    case ConnectionState.none:
                      return Center(child: CircularProgressIndicator());
                    case ConnectionState.done:
                      {
                        if (snapshot.hasError)
                          return Center(
                            child: Text('Error , ${snapshot.error}'),
                          );
                        else
                          return ListView.separated(
                              itemBuilder: (context, index) {
                                Message message = messages[index];
                                return Slidable(
                                  actionPane: SlidableDrawerActionPane(),
                                  actionExtentRatio: 0.25,
                                  actions: <Widget>[
                                    IconSlideAction(
                                      caption: 'Archive',
                                      color: Colors.blue,
                                      icon: Icons.archive,
                                      onTap: () {
                                        print('Archive');
                                      },
                                    ),
                                    IconSlideAction(
                                      caption: 'Share',
                                      color: Colors.indigo,
                                      icon: Icons.share,
                                      onTap: () {
                                        print('Share');
                                      },
                                    ),
                                  ],
                                  secondaryActions: <Widget>[
                                    IconSlideAction(
                                      caption: 'More',
                                      color: Colors.black45,
                                      icon: Icons.more_horiz,
                                      onTap: () {
                                        print('More');
                                      },
                                    ),
                                    IconSlideAction(
                                      caption: 'Delete',
                                      color: Colors.red,
                                      icon: Icons.delete,
                                      onTap: () {
                                        setState(() {
                                          messages.removeAt(index);
                                        });
                                      },
                                    ),
                                  ],
                                  child: ListTile(
                                    title: Text(message.subject),
                                    subtitle: Text(
                                      message.body,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    leading: CircleAvatar(
                                      child: Text(message.leading),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  MessageDetails(
                                                      message.subject,
                                                      message.body)));
                                    },
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) => Divider(),
                              itemCount: messages.length);
                      }
                  }
                },
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Message message = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => ComposeMessage()));

            if (message != null) {
              setState(() {
                messages.add(message);
              });

              _scaffoldKey.currentState.showSnackBar(SnackBar(
                content: Text('Message sent !'),
                backgroundColor: Colors.green,
              ));
            }
          },
          child: Icon(
            Icons.messenger_outline_sharp,
            color: Colors.white,
          ),
        ));
  }
}
