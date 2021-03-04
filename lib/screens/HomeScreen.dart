import 'dart:async';
import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:music_app/values/MyTextStyle.dart';
import 'package:music_app/widgets/HomeTile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String result = '';
  var Colorsvalue = Colors.white;

  String output;
  List listResponse;
  Map mapResponse, track, header;

  Future fetchData() async {
    try {
      http.Response response;
      // response = await http.get("https://mechgesture.herokuapp.com/garage");
      response = await http.get(
          "https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7");

      if (response.statusCode == 200) {
        setState(() {
          mapResponse = json.decode(response.body);
          listResponse = mapResponse['message']['body']['track_list'];
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (listResponse != null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          leading: Icon(
            Icons.music_note,
            color: Colors.black,
            size: 30.0,
          ),
          title: Text(
            "Trendings",
            style: MyTextStyle.text2,
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (a, b, c) => HomeScreen(),
                transitionDuration: Duration(seconds: 1),
                maintainState: true,
              ),
            );
            return Future.value(false);
          },
          child: Container(
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return HomeTile(
                  trackId: listResponse[index]['track']['track_id'],
                  track_name: listResponse[index]['track']['track_name'],
                  album_name: listResponse[index]['track']['album_name'],
                  artist_name: listResponse[index]['track']['artist_name'],
                );
              },
              itemCount: listResponse.length == null ? 0 : listResponse.length,
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          leading: Icon(
            Icons.music_note,
            color: Colors.black,
            size: 30.0,
          ),
          title: Text(
            "Trending",
            style: MyTextStyle.text2,
          ),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
