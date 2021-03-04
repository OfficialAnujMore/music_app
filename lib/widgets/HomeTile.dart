import 'package:flutter/material.dart';
import 'package:music_app/screens/TrackPage.dart';
import 'package:music_app/values/MyTextStyle.dart';

class HomeTile extends StatefulWidget {
  // ignore: non_constant_identifier_names
  String track_name, album_name, artist_name;
  int trackId;

  HomeTile({
    // ignore: non_constant_identifier_names
    this.track_name,
    this.album_name,
    this.artist_name,
    this.trackId,
  });

  @override
  _HomeTileState createState() => _HomeTileState();
}

class _HomeTileState extends State<HomeTile> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, "/trackPage");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TrackPage(
              trackId: widget.trackId,
            ),
            // Pass the arguments as part of the RouteSettings. The
            // DetailScreen reads the arguments from these settings.
          ),
        );
      },
      child: Container(
        height: _height / 8,
        width: double.infinity,
        padding: EdgeInsets.only(
          left: 10.0,
          right: 10.0,
        ),
        margin: EdgeInsets.only(
          left: 15.0,
          right: 15.0,
          top: 10.0,
        ),
        decoration: BoxDecoration(
          color: Colors.amberAccent,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(right: 10.0),
              child: CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 30.0,
                backgroundImage: NetworkImage(
                    "https://media.wired.com/photos/5f9ca518227dbb78ec30dacf/master/w_2560%2Cc_limit/Gear-RIP-Google-Music-1194411695.jpg"),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  top: 10.0,
                  bottom: 10.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.track_name.toString(),
                      overflow: TextOverflow.clip,
                      style: MyTextStyle.text1,
                    ),
                    Text(
                      widget.album_name.toString(),
                      overflow: TextOverflow.clip,
                      style: MyTextStyle.text4,
                    ),
                    Text(
                      widget.artist_name.toString(),
                      maxLines: 5,
                      textAlign: TextAlign.end,
                      overflow: TextOverflow.ellipsis,
                      style: MyTextStyle.text4,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
