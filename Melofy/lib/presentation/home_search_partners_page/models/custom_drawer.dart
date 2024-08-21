import 'dart:ffi';
import 'package:Melofy/API/api_calls.dart';
import 'package:Melofy/API/models/artist.dart' as alias;
import 'package:Melofy/API/models/related.dart' as related;
import 'package:Melofy/API/models/track.dart';
import 'package:Melofy/core/app_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            related.RelatedArtists tempRelatedArtist = snapshot.data![2];
            List<related.Artist> relatedArtist = tempRelatedArtist.artists!;
            int? followers = artist.followers!.total;
            String artistImg = artist.images!.first.url;
            //String trackImg = tracks.first.album!.images![1].url;
            String trackImg1 = tracks[1].album!.images![2].url;
            String trackImg2 = tracks[2].album!.images![2].url;
            String trackImg3 = tracks[4].album!.images![2].url;
            String trackName1 = tracks[1].album!.name as String;
            String trackName2 = tracks[2].album!.name as String;
            String trackName3 = tracks[4].album!.name as String;
            related.Artist relatedArtist1 = relatedArtist[0];
            related.Artist relatedArtist2 = relatedArtist[1];
            related.Artist relatedArtist3 = relatedArtist[2];
            // Array artistPhoto = artist.images

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
                        child: Text(
                          "About This Artist",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
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
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 214, 246, 221)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(artistImg,
                                fit: BoxFit.cover,
                                width: MediaQuery.sizeOf(context).height * 0.21,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.21),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Popular Albums",
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Color.fromARGB(255, 232, 225, 239)),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.135,
                          width: 20,
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 20, bottom: 10),
                            child: Column(children: [
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                child: Image.network(
                                  trackImg1,
                                  width:
                                      MediaQuery.sizeOf(context).height * 0.135,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.135,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                  width:
                                      MediaQuery.sizeOf(context).height * 0.135,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      trackName1,
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: GoogleFonts.inter(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          height: 1.3),
                                    ),
                                  ))
                            ])),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 20, right: 20, top: 20, bottom: 10),
                            child: Column(children: [
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                child: Image.network(
                                  trackImg2,
                                  width:
                                      MediaQuery.sizeOf(context).height * 0.135,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.135,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                  width:
                                      MediaQuery.sizeOf(context).height * 0.135,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      trackName2,
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: GoogleFonts.inter(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          height: 1.3),
                                    ),
                                  ))
                            ])),
                        Padding(
                            padding: EdgeInsets.only(top: 20, bottom: 10),
                            child: Column(children: [
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                child: Image.network(
                                  trackImg3,
                                  width:
                                      MediaQuery.sizeOf(context).height * 0.135,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.135,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                  width:
                                      MediaQuery.sizeOf(context).height * 0.135,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      trackName3,
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: GoogleFonts.inter(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          height: 1.3),
                                    ),
                                  ))
                            ])),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.135,
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(0),
                      child: Text(
                        "Related Artists",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Color.fromARGB(255, 232, 225, 239)),
                      )),
                  /*
                  STARTS HERE 
                  WOOFNEWIOFNEWIFNOWENF
                  NWFOIEWNFIEWNFIEWN
                  FIEWFNIWENFINWEUF
                  FNUIEWINFIUEWNFi
                  */

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.135,
                          width: 20,
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Column(children: [
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                child: Image.network(
                                  relatedArtist1.images!.first.url!,
                                  width:
                                      MediaQuery.sizeOf(context).height * 0.135,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.135,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                  width:
                                      MediaQuery.sizeOf(context).height * 0.135,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      relatedArtist1.name!,
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: GoogleFonts.inter(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          height: 1.3),
                                    ),
                                  ))
                            ])),
                        Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(children: [
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                child: Image.network(
                                  relatedArtist2.images!.first.url!,
                                  width:
                                      MediaQuery.sizeOf(context).height * 0.135,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.135,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                  width:
                                      MediaQuery.sizeOf(context).height * 0.135,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      relatedArtist2.name!,
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: GoogleFonts.inter(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          height: 1.3),
                                    ),
                                  ))
                            ])),
                        Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Column(children: [
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                                child: Image.network(
                                  relatedArtist3.images!.first.url!,
                                  width:
                                      MediaQuery.sizeOf(context).height * 0.135,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.135,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                  width:
                                      MediaQuery.sizeOf(context).height * 0.135,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      relatedArtist3.name!,
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: GoogleFonts.inter(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          height: 1.3),
                                    ),
                                  ))
                            ])),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.135,
                          width: 20,
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
