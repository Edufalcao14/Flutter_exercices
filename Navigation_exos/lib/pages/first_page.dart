
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FirstPage extends StatelessWidget {
  const FirstPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     appBar: AppBar(title: Center(
         child:
         Text("1st Page" , style: TextStyle(color: Colors.white),)) ,
       backgroundColor: Colors.blue,
     ),
     drawer:  Drawer(

       child:Column(
         children: [
           const DrawerHeader(child: Icon(
             Icons.business,
             size: 50,
           )
           ),
           //Home Page
           ListTile(
             leading: Icon(Icons.home),
             title: Text("H O M E "),
             onTap: () => context.go("/"),
           ),
           ListTile(
             leading: Icon(Icons.person),
             title: Text("P R O F I L E "),
             onTap: () => context.go("/ProfilePage"),
           ),
           ListTile(
             leading: Icon(Icons.settings),
             title: Text("S E T T I N G S"),
             onTap: () => context.go("/SettingsPage"),
           ),
           //Profile Page

           //Settings Page

         ],
       ),
     ),
    );
  }
}
