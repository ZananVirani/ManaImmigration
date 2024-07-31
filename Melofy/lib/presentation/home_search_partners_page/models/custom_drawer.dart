import 'dart:ffi';
import 'package:Melofy/API/api_calls.dart';
import 'package:Melofy/API/models/artist.dart';
import 'package:Melofy/API/models/track.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  late final String? artistID;
  CustomDrawer(String? s) : artistID = s;

  @override
  Widget build(BuildContext context) {
  return Drawer(
    shape:
    const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(

                  topRight: Radius.circular(0),
                  topLeft: Radius.circular(0),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0)),
                  
    ),
    child: FutureBuilder(
      future: MakeAPICall.getArtistandTracks(artistID!),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          
          Artist artist = snapshot.data![0];
          List<Track> tracks = snapshot.data![1];        
          int? followers = artist.followers!.total;
         //Array artistPhoto = artist.images

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  artist.name! + "\n" + tracks.first.name!,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Followers: $followers',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                
              ],
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    ),
  );
}
}