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
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              signOut().then((_) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => WidgetTree()),
                      (route) => false,
                );
              });
            },
          ),
        ],
      ),
      body: StreamBuilder<DocumentSnapshot>(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: avatarSize / 2, // Set the radius to half of the avatar size
                      backgroundImage: AssetImage('assets/album6.jpeg'), // Replace with the path to your avatar image
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          infoColumn('Email', user?.email),
                          SizedBox(height: 8),
                          infoColumn('Name', name),
                          SizedBox(height: 8),
                          infoColumn('Nickname', nickname),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget infoColumn(label, value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white54),
        ),
        Text(
          value ?? '',
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}

