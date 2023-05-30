import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nomad_player/models/albumModel.dart';

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class AlbumDataProvider with ChangeNotifier {
  AlbumModel album = AlbumModel(id: 1, artistId: 1, title: "1", imageUrl: "", tracks: "");
  bool loading = false;

  Future<AlbumModel> getSingleAlbumData(context) async {
    late AlbumModel result;
    try {
      final response = await http.get(
        Uri.parse("spoify api"),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
      );
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        result = AlbumModel.fromJson(item);
      } else {
        Fluttertoast.showToast(
          msg: "Data not found",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
        );
      }
    } catch (e) {
      log(e.toString());
    }

    return result;
  }

  getPostData(context) async {
    loading = true;
    album = await getSingleAlbumData(context);
    loading = false;

    notifyListeners();
  }
}