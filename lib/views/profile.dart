import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:nomad_player/widget_tree.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../auth.dart';
import 'login_register_page.dart';


class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  String? _membership;

  @override
  void dispose() {
    _nameController.dispose();
    _nicknameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .get();

    if (userData.exists) {
      final name = userData.get('name') as String?;
      final nickname = userData.get('nickname') as String?;
      final membership = userData.get('membership') as String?;

      print(membership);

      setState(() {
        _nameController.text = name ?? '';
        _nicknameController.text = nickname ?? '';
        _membership = membership;
      });
    }
  }

  Future<void> updateUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    final name = _nameController.text.trim();
    final nickname = _nicknameController.text.trim();

    await FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .set({'name': name, 'nickname': nickname, 'membership': _membership}, SetOptions(merge: true));
  }

  void updateMembership(String newMembership) {
    setState(() {
      _membership = newMembership;
      updateUserData();
    });
  }

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget page() {
    final user = FirebaseAuth.instance.currentUser;

    final double avatarSize = MediaQuery.of(context).size.width * 0.4; // Calculate the avatar size

    if (user != null) {
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
                TextFormField(
                  controller: _nameController,
                  style: TextStyle(fontSize: 24),
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white54,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  enabled: false,
                  initialValue: FirebaseAuth.instance.currentUser?.email ?? '',
                  style: TextStyle(fontSize: 24),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white54,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _nicknameController,
                  style: TextStyle(fontSize: 24),
                  decoration: InputDecoration(
                    labelText: 'Nickname',
                    labelStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white54,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  updateUserData().then((_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Profile saved!')),
                    );
                  });
                },
                child: Text('Save'),
              ),
            ],
          ),
          SizedBox(height: 16),
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
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You are in guest mode',
            style: TextStyle(fontSize: 24),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            child: Text('Sign In'),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color(0xFf1C7A74),
        actions: [
          if (_membership == 'membership-1')
            IconButton(
              onPressed: () {
                // Show dropdown menu for membership-1
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Select Membership'),
                      content: DropdownButton<String>(
                        value: _membership,
                        onChanged: (String? newValue) {
                          updateMembership(newValue!);
                          Navigator.of(context).pop();
                        },
                        items: <String>[
                          'membership-1',
                          'membership-2',
                          // Add more membership options here
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    );
                  },
                );
              },
              icon: Icon(Icons.person),
            ),
          if (_membership == 'membership-2')
            IconButton(
              onPressed: () {
                // Show dropdown menu for membership-2
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Select Membership'),
                      content: DropdownButton<String>(
                        value: _membership,
                        onChanged: (String? newValue) {
                          updateMembership(newValue!);
                          Navigator.of(context).pop();
                        },
                        items: <String>[
                          'membership-1',
                          'membership-2',
                          // Add more membership options here
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    );
                  },
                );
              },
              icon: Icon(Icons.person_add),
            ),
        ],
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
        child: page(),
      ),
    );
  }
}
