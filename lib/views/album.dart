import 'package:flutter/material.dart';

class AlbumView extends StatefulWidget {
  @override
  AlbumViewState createState() => AlbumViewState();
}

class AlbumViewState extends State<AlbumView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment. topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(1),
                        ]
                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 40),
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage("assets/header1.webp"),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.width - 200,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Illuminate",
                                              style: TextStyle(fontSize: 24, color: Colors.white),

                                            ),
                                            Text(
                                              "Shawn Mendes",
                                              style: TextStyle(fontSize: 16, color: Colors.white54)
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.shuffle, color: Colors.white38, size: 36,),
                                        SizedBox(width: 16,),
                                        Icon(Icons.play_arrow, color: Colors.white38, size: 36,),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    height: 500,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}