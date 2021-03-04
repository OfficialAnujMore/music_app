import 'package:flutter/material.dart';
import 'package:music_app/values/MyTextStyle.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TrackContent extends StatefulWidget {
  final int trackId;
  double rating;
  // ignore: non_constant_identifier_names
  String track_name, artist_name, album_name, lyrics_body;

  TrackContent({
    this.trackId,
    this.track_name,
    this.artist_name,
    this.album_name,
    this.lyrics_body,
    this.rating,
  });

  @override
  _TrackContentState createState() => _TrackContentState();
}

class _TrackContentState extends State<TrackContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        leading: Icon(
          Icons.music_note,
          color: Colors.black,
          size: 30.0,
        ),
        title: Text(
          widget.track_name,
          style: MyTextStyle.text2,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            top: 10.0,
            bottom: 10.0,
          ),
          margin: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 200,
                  height: 200,
                  margin: EdgeInsets.only(
                    bottom: 20.0,
                  ),
                  decoration: BoxDecoration(
                    image: new DecorationImage(
                        image: NetworkImage(
                            "https://media.wired.com/photos/5f9ca518227dbb78ec30dacf/master/w_2560%2Cc_limit/Gear-RIP-Google-Music-1194411695.jpg"),
                        fit: BoxFit.cover),
                    color: Colors.amber,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 10.0,
                ),
                child: Text(
                  widget.track_name.toString(),
                  maxLines: 5,
                  textAlign: TextAlign.end,
                  overflow: TextOverflow.ellipsis,
                  style: MyTextStyle.text2,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 10.0,
                ),
                child: Text(
                  widget.artist_name.toString(),
                  maxLines: 5,
                  textAlign: TextAlign.end,
                  overflow: TextOverflow.ellipsis,
                  style: MyTextStyle.text1,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 10.0,
                ),
                child: Text(
                  widget.album_name.toString(),
                  maxLines: 5,
                  textAlign: TextAlign.end,
                  overflow: TextOverflow.ellipsis,
                  style: MyTextStyle.text1,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 10.0,
                ),
                child: RatingBar.builder(
                  initialRating: widget.rating.toDouble(),
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ),
              Text(
                widget.lyrics_body.toString(),
                maxLines: 20,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: MyTextStyle.text3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
