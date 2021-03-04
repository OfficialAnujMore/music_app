import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:music_app/widgets/TrackContent.dart';

class TrackPage extends StatefulWidget {
  final int trackId;

  TrackPage({
    this.trackId,
  });
  @override
  _TrackPageState createState() => _TrackPageState();
}

class _TrackPageState extends State<TrackPage> {
  String output;
  List listResponse;
  Map mapResponse, track, lyrics;
  int rating;

  Future fetchData() async {
    try {
      http.Response response;

      response = await http.get(
          "https://api.musixmatch.com/ws/1.1/track.get?track_id=" +
              widget.trackId.toString() +
              "&apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7");

      if (response.statusCode == 200) {
        setState(() {
          mapResponse = json.decode(response.body);
          // output = mapResponse['message']['header']['status_code'];
          track = mapResponse['message']['body']['track'];
          // track = listResponse[0];

          print(track['track_id'].toString());
          // // mapResponse = listResponse[0];
          // message = mapResponse['body'];
          // // header = mapResponse['header'];
          // listResponse = message['track_list']['track']['track_id'];

          // output = header.toString();

          // print(output);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Future fetchLyrics() async {
    try {
      http.Response response;
      // response = await http.get("https://mechgesture.herokuapp.com/garage");
      response = await http.get(
          "https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=" +
              widget.trackId.toString() +
              "&apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7");

      if (response.statusCode == 200) {
        setState(() {
          mapResponse = json.decode(response.body);
          lyrics = mapResponse['message']['body']['lyrics'];
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    fetchData();
    fetchLyrics();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (a, b, c) => TrackPage(),
              transitionDuration: Duration(seconds: 1),
              maintainState: true,
            ),
          );
          return Future.value(false);
        },
        // child: Text(track['track_name'].toString()),
        child: TrackContent(
          track_name: track['track_name'],
          artist_name: track['artist_name'],
          album_name: track['album_name'],
          lyrics_body: lyrics['lyrics_body'],
          rating: track['track_rating'] / 20,
        ),
      ),
    );
  }
}
