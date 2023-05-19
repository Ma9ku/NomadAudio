import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFf1C7A74), Colors.white.withOpacity(0)]
                )
            ),
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Поиск",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Montserrat'
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _searchController,
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'Что хочешь послушать?',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: Colors.grey,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      borderSide: BorderSide.none,
                                    ),
                                    contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                                  ),
                                )
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            children: [
                              Text(
                                "Все остальное",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: Colors.black
                                ),
                              )

                            ],
                          ),
                          SizedBox(height: 20,),
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 4),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    _buildAlbumCard2(
                                      context: context,
                                      image: AssetImage("assets/album13.jpeg"),
                                      title: "RnB",
                                      color: Colors.black
                                    ),
                                    _buildAlbumCard2(
                                      context: context,
                                      image: AssetImage("assets/album7.jpeg"),
                                      title: "Pop",
                                      color: Colors.white
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 15,),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 4),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    _buildAlbumCard2(
                                        context: context,
                                        image: AssetImage("assets/album12.png"),
                                        title: "Новые релизы",
                                        color: Colors.white
                                    ),
                                    _buildAlbumCard2(
                                        context: context,
                                        image: AssetImage("assets/album5.jpeg"),
                                        title: "Для тебя",
                                        color: Colors.white
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 15,),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 4),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    _buildAlbumCard2(
                                        context: context,
                                        image: AssetImage("assets/album1.jpeg"),
                                        title: "Для геймеров",
                                        color: Colors.white
                                    ),
                                    _buildAlbumCard2(
                                        context: context,
                                        image: AssetImage("assets/album10.webp"),
                                        title: "Топ чарты",
                                        color: Colors.black
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 15,),


                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildAlbumCard2({
  required BuildContext context,
  required ImageProvider<Object> image,
  required String title,
  required Color color
}) {
  return Container(
    width: MediaQuery.of(context).size.width / 2 - 35,
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image(
            image: image,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.4),
                Colors.transparent,
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                title,
                style: TextStyle(
                  color: color,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
