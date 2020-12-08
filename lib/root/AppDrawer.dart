import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Moaaz Elneshawy'),
            accountEmail: Text('m.elneshawy@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://scontent-sin6-2.xx.fbcdn.net/v/t1.0-9/100807855_1643915235782652_99796386916073472_n.jpg?_nc_cat=103&ccb=2&_nc_sid=a4a2d7&_nc_ohc=EbmkAOgkFUsAX-zWvir&_nc_ht=scontent-sin6-2.xx&oh=c649fd521f55822d8dd73f04fcb8bb2e&oe=5FF315E4"),
            ),
            // otherAccountsPictures: [
            //   GestureDetector(
            //     onTap: () {
            //       showDialog(
            //           context: context,
            //           builder: (context) => AlertDialog(
            //                 title: Text('Other Picture ...'),
            //               ));
            //     },
            //     child: CircleAvatar(
            //       backgroundImage: NetworkImage(
            //           "https://scontent-sin6-2.xx.fbcdn.net/v/t31.0-8/20286990_845303328977184_2329566532135267912_o.jpg?_nc_cat=108&ccb=2&_nc_sid=a4a2d7&_nc_ohc=-vHbh87l0aUAX_U_AFy&_nc_ht=scontent-sin6-2.xx&oh=b6025e30f9ad5e3094b0562b93731758&oe=5FF2F0FE"),
            //     ),
            //   ),
            // ],
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
    );
  }
}
