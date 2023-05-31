import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:nomad_player/widget_tree.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../auth.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    Future<void> signOut() async {
      await Auth().signOut();
    }

    final double avatarSize = MediaQuery.of(context).size.width * 0.4; // Calculate the avatar size

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color(0xFf1C7A74), // Set the app bar color to dark teal
      ),
      body: Container(
        constraints: BoxConstraints.expand(), // Make the container fullscreen
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFf1C7A74), // Semi-transparent dark teal color
              Colors.white.withOpacity(0), // Fully transparent white color
            ],
          ),
        ),
        child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(user?.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            final userData = snapshot.data?.data() as Map<String, dynamic>?; // Specify the type of userData

            final name = userData?['name'] as String?; // Specify the type of name
            final nickname = userData?['nickname'] as String?; // Specify the type of nickname

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 24),
                Align(
                  alignment: Alignment.topCenter,
                  child: CircleAvatar(
                    radius: avatarSize / 2, // Set the radius to half of the avatar size
                    backgroundImage: AssetImage('assets/album6.jpeg'), // Replace with the path to your avatar image
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      infoColumn('Email', user?.email, fontSize: 24),
                      SizedBox(height: 8),
                      infoColumn('Name', name, fontSize: 24),
                      SizedBox(height: 8),
                      infoColumn('Nickname', nickname, fontSize: 24),
                    ],
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    signOut().then((_) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => WidgetTree()),
                            (route) => false,
                      );
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Text(
                      'Sign Out',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget infoColumn(label, value, {double fontSize = 18}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: Colors.white54),
        ),
        Text(
          value ?? '',
          style: TextStyle(fontSize: fontSize),
        ),
      ],
    );
  }
}
