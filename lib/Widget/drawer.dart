import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {

  MyDrawer(this.gmail);
  final String gmail;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.purple,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.purple),
                  margin: EdgeInsets.zero,
                  accountName: Text("Harsh Bhanderi"),
                  accountEmail: Text("$gmail"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("images/profile.png"),
                  )),
            ),
            DrawerEntry(CupertinoIcons.home, "Home"),
            DrawerEntry(CupertinoIcons.profile_circled, "Profile"),
            DrawerEntry(CupertinoIcons.phone, "Contact Us"),
          ],
        ),
      ),
    );
  }
}

class DrawerEntry extends StatelessWidget {
  DrawerEntry(this.tiltIcon, this.title);

  final IconData tiltIcon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        tiltIcon,
        color: Colors.white,
      ),
      title: Text("$title", style: TextStyle(
          fontSize: 20.0,
          color: Colors.white
      ),
      ),
    );
  }
}
