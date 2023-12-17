import 'package:flutter/material.dart';
import 'LiveCameraScreen.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'LiveStreamScreen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'LoginPage.dart';



/*
class NewBar extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Drawer(
      child: ListView(
        children:[
          UserAccountsDrawerHeader(accountName: Text('Oflutter.com'),
                                   accountEmail: Text('example@gmail.com'),
                                   currentAccountPicture: CircleAvatar(
                                    child: ClipOval(
                                     child: Image.asset(
                                      'avatar.png',
                                      fit: BoxFit.cover,
                                      width: 90,
                                      height: 90,

                                     ),
                                    ),
                                   ),
                                   decoration:  const BoxDecoration(
                                    color: Color(0xFF959af8),
                                    /*image:  DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage('https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')
                                    ),*/

                                   ),
          ),
          ListTile(
            //leading: Image.asset('cam.png'),

            /*leading: Container(
              width: 24, // Set the desired width
              height: 24, // Set the desired height
              child: Image.asset('cam.png'),),*/

            /*leading: Icon(
              Icon.videocam,
              size: 24.0,
              color: Colors.blue,
              ),*/
            title: Text('Live Camera'),
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) =>LiveCameraScreen()),
              );
            },

          ), 
          ListTile(
            //leading: Image.asset('cam.png'),
            title: Text('Intrusion History'),
            onTap: () => null,

          ),    
          ListTile(
            //leading: Image.asset('cam.png'),
            title: Text('Notifications'),
            onTap: () => null,
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                width: 20,
                height: 20,
                child: Center(
                  child: Text(
                    '8',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),

          ),  
          ListTile(
            //leading: Image.asset('cam.png'),
            title: Text('Settings'),
            onTap: () => null,

          ),     
          ListTile(
            //leading: Image.asset('cam.png'),
            title: Text('Logout'),
            onTap: () => null,

          ),             
        ],
      ),
    );
  }
}
*/



/*
class NewBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection('users').doc('wS1J13w88nvBqol0f9TV').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator(); // Loading indicator
          }
          print("Data from Firestore: ${snapshot.data?.data()}");
          var userData = (snapshot.data?.data() ?? {}) as Map<String, dynamic>;

          // Parse string data into the expected types if needed
          String name = userData['name'] ?? 'Default Name';
          
          //String email = userData['email'] ?? 'Default@example.com';
          //String email = userData['email']?.toString() ?? 'Default@example.com';
          String mmail= userData['mmail'] ?? 'mmail';

          return ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(name),
                accountEmail: Text(mmail),
                currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                    child: Image.asset(
                      'avatar.png',
                      fit: BoxFit.cover,
                      width: 90,
                      height: 90,
                    ),
                  ),
                ),
                decoration: const BoxDecoration(
                  color: Color(0xFF959af8),
                ),
              ),*/

class NewBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, userSnapshot) {
          if (!userSnapshot.hasData) {
            return CircularProgressIndicator(); // Loading indicator
          }

          User? user = userSnapshot.data;

          if (user == null) {
            // User is not logged in
            return Text('User is not logged in');
          }

          String name = user.displayName ?? 'Default Name';
          String mmail = user.email ?? 'Default@example.com';

          return ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(name),
                accountEmail: Text(mmail),
                currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                    child: Image.asset(
                      'avatar.png',
                      fit: BoxFit.cover,
                      width: 90,
                      height: 90,
                    ),
                  ),
                ),
                decoration: const BoxDecoration(
                  color: Color(0xFF959af8),
                ),
              ),

              ListTile(
                title: Text('Live Camera'),
                onTap: () {
                   Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) =>LiveCameraScreen()),
              );
                },
              ),
              ListTile(
                title: Text('Streaming'),
                onTap: () {
                Navigator.of(context).push(
                
                 MaterialPageRoute(builder: (context) => LiveStreamScreen()),
                );  
                },
              ),
              /*ListTile(
                title: Text('Streaming'),
                onTap: () {
                  
                },
              ),*/

              ListTile(
                title: Text('Notifications'),
                onTap: () {
                  
                  // Handle Notifications screen navigation.
                },
                trailing: ClipOval(
                  child: Container(
                    color: Colors.red,
                    width: 20,
                    height: 20,
                    child: Center(
                      child: Text(
                        '8',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text('Settings'),
                onTap: () {
                  // Handle Settings screen navigation.
                },
              ),
              ListTile(
                title: Text('Logout'),
                onTap: () {
                  
                   Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) =>LoginPage()),
              );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
