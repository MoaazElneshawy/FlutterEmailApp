import 'package:email_app/MessageDetails.dart';
import 'package:flutter/material.dart';
import 'ComposeMessage.dart';
import 'Message.dart';

class MessagesList extends StatefulWidget {
  MessagesList({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MessagesListState createState() => _MessagesListState();
}

class _MessagesListState extends State<MessagesList> {
  List<Message> messages = [];
  Future futureMessages;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    fetch();
  }

  void fetch() async {
    futureMessages = Message.loadMessages();
    messages = await futureMessages;
  }

  @override
  Widget build(BuildContext context) {
    print(messages.length);
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(this.widget.title),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () async {
                var messages = await Message.loadMessages();
                setState(() {
                  this.messages = messages;
                });
              },
            )
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text('Moaaz Elneshawy'),
                accountEmail: Text('m.elneshawy@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://scontent-sin6-2.xx.fbcdn.net/v/t1.0-9/100807855_1643915235782652_99796386916073472_n.jpg?_nc_cat=103&ccb=2&_nc_sid=a4a2d7&_nc_ohc=EbmkAOgkFUsAX-zWvir&_nc_ht=scontent-sin6-2.xx&oh=c649fd521f55822d8dd73f04fcb8bb2e&oe=5FF315E4"),
                ),
                otherAccountsPictures: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text('Other Picture ...'),
                              ));
                    },
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://scontent-sin6-2.xx.fbcdn.net/v/t31.0-8/20286990_845303328977184_2329566532135267912_o.jpg?_nc_cat=108&ccb=2&_nc_sid=a4a2d7&_nc_ohc=-vHbh87l0aUAX_U_AFy&_nc_ht=scontent-sin6-2.xx&oh=b6025e30f9ad5e3094b0562b93731758&oe=5FF2F0FE"),
                    ),
                  ),
                ],
              ),
              ListTile(
                leading: Icon(Icons.inbox),
                title: Text('Inbox'),
                trailing: Chip(label: Text('12')),
              ),
              ListTile(leading: Icon(Icons.edit), title: Text('Draft')),
              ListTile(leading: Icon(Icons.send_sharp), title: Text('Send')),
              Divider(),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: ListTile(
                      leading: Icon(Icons.settings), title: Text('Settings')),
                ),
              ),
            ],
          ),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) {
              Message message = messages[index];
              return Dismissible(
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.redAccent,
                  alignment:Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Delete',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                ),
                key: UniqueKey(),
                onDismissed: (direction) {
                  setState(() {
                    messages.removeAt(index);
                  });
                },
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
                              builder: (BuildContext context) => MessageDetails(
                                  message.subject, message.body)));
                    }),
              );
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: messages.length),
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

// body: FutureBuilder(
//   future: futureMessages,
//   // ignore: missing_return
//   builder: (BuildContext context, AsyncSnapshot snapshot) {
//     print(snapshot.connectionState);
//     print(snapshot.hasError);
//     futureMessages = snapshot.data;
//     switch (snapshot.connectionState) {
//       case ConnectionState.active:
//       case ConnectionState.waiting:
//       case ConnectionState.none:
//         return Center(child: CircularProgressIndicator());
//       case ConnectionState.done:
//         {
//           if (snapshot.hasError)
//             return Center(
//               child: Text('Error , ${snapshot.error}'),
//             );
//           else
//             return ListView.separated(
//                 itemBuilder: (context, index) {
//                   Message message = messages[index];
//                   return ListTile(
//                     title: Text(message.subject),
//                     subtitle: Text(
//                       message.body,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     leading: CircleAvatar(
//                       child: Text(message.leading),
//                     ),
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (BuildContext context) =>
//                                   MessageDetails(
//                                       message.subject, message.body)));
//                     },
//                   );
//                 },
//                 separatorBuilder: (context, index) => Divider(),
//                 itemCount: messages.length);
//         }
//     }
//   },
// ),
