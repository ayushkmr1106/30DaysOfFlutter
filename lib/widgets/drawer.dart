import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({ Key? key }) : super(key: key);
  final imgUrl = "https://rlv.zcache.com/ninja_ninjas_2_martial_arts_warrior_fantasy_art_classic_round_sticker-r03de4738595641aa8eb4bba6a5b8a256_0ugmp_8byvr_704.webp";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        // height: double.maxFinite,
        color: Theme.of(context).primaryColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              // decoration: BoxDecoration(
              //     color: Theme.of(context).primaryColor,
              //   ),
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                // decoration: BoxDecoration(
                //   color: Colors.grey[400],
                // ),
                margin: EdgeInsets.zero,
                accountName: const Text(
                  "Ayush Kumar",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.5,
                  ),
                  ),
                accountEmail: const Text(
                  "shubham.verma144@gmail.com",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                    letterSpacing: 1.3,
                    // fontWeight: FontWeight.bold,
                  )
                  ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imgUrl),
                ),
            )),
            
            const ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.3,
                ),
              )
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.3,
                ),
              )
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                "Mail",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.3,
                ),
              )
            ),
            const ListTile(
              leading: Icon(
                Icons.group_outlined,
                color: Colors.white,
              ),
              title: Text(
                "About Us",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.3,
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}