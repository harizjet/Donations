import 'package:flutter/material.dart';
import '../DictionaryPage/animaldict.dart';
import '../DonationPage/donation.dart';
import '../Test/test.dart';
import '../Graph/graph.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Side menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
              color: Colors.green,
              // image: DecorationImage(
              //   fit: BoxFit.fill,
              //   image: AssetImage('assets/images/cover.jpg'),
              // ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Welcome'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Animal Dictionary'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Animaldict()))
            },
          ),
          ListTile(
            leading: Icon(Icons.attach_money),
            title: Text('Donation'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DonationPage()))
            },
          ),
          ListTile(
            leading: Icon(Icons.linear_scale),
            title: Text('Donation Graph'),
            onTap: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => GraphPage()))
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Test()))
            },
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
