import 'package:Melofy/API/api_calls.dart';
import 'package:Melofy/API/models/artist.dart';
import 'package:Melofy/API/models/track.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  late final String? artistID;
  CustomDrawer(String? s) : artistID = s;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: FutureBuilder(
            future: MakeAPICall.getArtistandTracks(artistID!),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Artist artist = snapshot.data![0];
                List<Track> tracks = snapshot.data![1];
                return Center(
                    child: Text(artist.name! + "\n" + tracks.first.name!));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
