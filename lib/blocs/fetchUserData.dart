import 'dart:convert';

import 'package:http/http.dart' as http;

String output;
List listResponse;
Map mapResponse, track, header;

class fetchHomeData {
  Future fetchData() async {
    try {
      http.Response response;
      response = await http.get(
          "https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7");

      if (response.statusCode == 200) {
        mapResponse = json.decode(response.body);
        listResponse = mapResponse['message']['body']['track_list'];
      }
    } catch (e) {
      print(e);
    }
    return listResponse;
  }
}
