import 'dart:ffi';
import 'package:Melofy/API/api_calls.dart';
import 'package:Melofy/API/models/artist.dart';
import 'package:Melofy/API/models/track.dart';
import 'package:Melofy/core/app_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  late final String? artistID;
  CustomDrawer(String? s) : artistID = s;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(0),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(30)),
      ),
      child: FutureBuilder(
        future: MakeAPICall.getArtistandTracks(artistID!),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Artist artist = snapshot.data![0];
            List<Track> tracks = snapshot.data![1];
            int? followers = artist.followers!.total;
            //Array artistPhoto = artist.images

            return Container(
              child: Column(
                children: [
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(Icons.arrow_back),
                        ),
                      ),
                      Align(
                        
                        alignment: Alignment.center,
                        child: Text("About This Artist", textAlign: TextAlign.center),
                      )
                    ],
                  ), 
                  SizedBox( 
                    child: Column(
                    children:[
                  Text(
                    artist.name!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                  ),
                  Text(
                    '$followers Followers',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey
                      ),
                   ),
                    ],
                    ),
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
