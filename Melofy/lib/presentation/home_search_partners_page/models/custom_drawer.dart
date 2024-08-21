import 'dart:ffi';
import 'package:Melofy/API/api_calls.dart';
import 'package:Melofy/API/models/artist.dart' as alias;
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
      backgroundColor: Colors.blueGrey,
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
            alias.Artist artist = snapshot.data![0];
            List<Track> tracks = snapshot.data![1];
            //List<alias.Artist> relatedArtist= snapshot.data![2];
            int? followers = artist.followers!.total;
            String artistImg = artist.images!.first.url;
            // String trackImg = tracks.first.album!.images![1].url;
            String trackImg1 = tracks[1].album!.images![2].url;
            String trackImg2 = tracks[2].album!.images![2].url;
            String trackImg3 = tracks[4].album!.images![2].url;
            String trackName1 = tracks[1].album!.name as String;
            String trackName2 = tracks[2].album!.name as String;
            String trackName3 = tracks[4].album!.name as String;
            //String relatedArtist1 = relatedArtist[1].images!.first.url;
            // String relatedArtist1 = relatedArtist.images!.first.url;
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
                        child: Text("About This Artist",
                            textAlign: TextAlign.center),
                      )
                    ],
                  ),
                  SizedBox(
                    child: Column(
                      children: [
                        Text(
                          artist.name!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text(
                          '$followers Followers',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(artistImg,
                                width: 200, height: 200),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text("Popular Albums"),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [ 
                            ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.network(
                                trackImg1,
                                width: 75, height: 75),
                          ),
                          Container(
                            width: 75,
                            child: Text(
                              trackName1,
                              textAlign: TextAlign.center,)
                          )
                          
                          ]
                        )
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [ 
                            ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.network(
                                trackImg2,
                                width: 75, height: 75),
                          ),
                          Container(
                            width: 75,
                            child: Text(
                              trackName2,
                              textAlign: TextAlign.center,)
                          )
                          
                          ]
                        )
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [ 
                            ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.network(
                                trackImg3,
                                width: 75, height: 75),
                          ),
                          Container(
                            width: 75,
                            child: Text(
                              trackName3,
                              textAlign: TextAlign.center,)
                          )
                          
                          ]
                        )
                      ),
                  ],),
// Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.all(10),
//                         child: Column(
//                           children: [ 
//                             ClipRRect(
//                             borderRadius: BorderRadius.circular(25),
//                             child: Image.network(
//                                 relatedArtist1,
//                                 width: 75, height: 75),
//                           ),
//                           // Container(
//                           //   width: 75,
//                           //   child: Text(
//                           //     //relatedArtist[1].name as String,
//                           //     textAlign: TextAlign.center,)
//                           // )
                          
//                           ]
//                         )
//                       ),
//                       // Padding(
//                       //   padding: EdgeInsets.all(10),
//                       //   child: Column(
//                       //     children: [ 
//                       //       ClipRRect(
//                       //       borderRadius: BorderRadius.circular(25),
//                       //       child: Image.network(
//                       //           trackImg2,
//                       //           width: 75, height: 75),
//                       //     ),
//                       //     Container(
//                       //       width: 75,
//                       //       child: Text(
//                       //         trackName2,
//                       //         textAlign: TextAlign.center,)
//                       //     )
                          
//                       //     ]
//                       //   )
//                       // ),
//                       // Padding(
//                       //   padding: EdgeInsets.all(10),
//                       //   child: Column(
//                       //     children: [ 
//                       //       ClipRRect(
//                       //       borderRadius: BorderRadius.circular(25),
//                       //       child: Image.network(
//                       //           trackImg3,
//                       //           width: 75, height: 75),
//                       //     ),
//                       //     Container(
//                       //       width: 75,
//                       //       child: Text(
//                       //         trackName3,
//                       //         textAlign: TextAlign.center,)
//                       //     )
                          
//                       //     ]
//                       //   )
//                       // ),
//                   ],)
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
