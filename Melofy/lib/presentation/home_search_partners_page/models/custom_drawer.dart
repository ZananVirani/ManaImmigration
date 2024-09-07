import 'package:Melofy/API/api_calls.dart';
import 'package:Melofy/API/models/artist.dart' as alias;
import 'package:Melofy/API/models/related.dart' as related;
import 'package:Melofy/API/models/track.dart';
import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CustomDrawer extends StatelessWidget {
  late final String? artistID;
  CustomDrawer(String? s) : artistID = s;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 204, 187, 156),
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
            var f = NumberFormat("###,###,###");
            String followers = f.format(artist.followers!.total);
            String artistImg = artist.images!.first.url;
            List<String> genres = artist.genres as List<String>;
            String genre1 = "";
            String genre2 = "";
            String genre3 = "";
            if (genres.length >= 3) {
              genre1 = genres[0].toCapitalCase() + ', ';
              genre2 = genres[1].toCapitalCase() + ', ';
              genre3 = genres[2].toCapitalCase();
            } else if (genres.length == 2) {
              genre1 = genres[0].toCapitalCase() + ', ';
              genre2 = genres[1].toCapitalCase();
            } else {
              genre1 = genres[0].toCapitalCase();
            }

            //String trackImg = tracks.first.album!.images![1].url;
            String trackImg1 = tracks[1].album!.images![0].url;
            String trackImg2 = tracks[2].album!.images![0].url;
            String trackImg3 = tracks[3].album!.images![0].url;
            String trackImg4 = tracks[4].album!.images![0].url;
            String trackName1 = tracks[1].album!.name as String;
            String trackName2 = tracks[2].album!.name as String;
            String trackName3 = tracks[3].album!.name as String;
            String trackName4 = tracks[4].album!.name as String;

            related.Artist relatedArtist1 = relatedArtist[0];
            related.Artist relatedArtist2 = relatedArtist[1];
            related.Artist relatedArtist3 = relatedArtist[2];
            related.Artist relatedArtist4 = relatedArtist[3];
            // Array artistPhoto = artist.images

            return Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
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
                            padding: EdgeInsets.all(15),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(artistImg,
                                  fit: BoxFit.cover,
                                  width:
                                      MediaQuery.sizeOf(context).height * 0.21,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.21),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Text("This Artist's Genres",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Color.fromARGB(234, 201, 35, 35),
                            )),
                        Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(genre1 + genre2 + genre3,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold, fontSize: 16)))
                      ],
                    ),
                    ExpansionTile(
                      backgroundColor: Colors.lightGreen,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Popular Albums",
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color.fromARGB(255, 232, 225, 239)),
                          ),
                        ],
                      ),
                      children: <Widget>[
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            child: Image.network(
                              trackImg2,
                              width: MediaQuery.sizeOf(context).height * 0.135,
                              height: MediaQuery.sizeOf(context).height * 0.135,
                              fit: BoxFit.contain,
                            ),
                          ),
                          title: Text(
                            trackName2,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                height: 1.3),
                          ),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            child: Image.network(
                              trackImg1,
                              width: MediaQuery.sizeOf(context).height * 0.135,
                              height: MediaQuery.sizeOf(context).height * 0.135,
                              fit: BoxFit.contain,
                            ),
                          ),
                          title: Text(
                            trackName1,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                height: 1.3),
                          ),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            child: Image.network(
                              trackImg3,
                              width: MediaQuery.sizeOf(context).height * 0.135,
                              height: MediaQuery.sizeOf(context).height * 0.135,
                              fit: BoxFit.contain,
                            ),
                          ),
                          title: Text(
                            trackName3,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                height: 1.3),
                          ),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            child: Image.network(
                              trackImg4,
                              width: MediaQuery.sizeOf(context).height * 0.135,
                              height: MediaQuery.sizeOf(context).height * 0.135,
                              fit: BoxFit.contain,
                            ),
                          ),
                          title: Text(
                            trackName4,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                height: 1.3),
                          ),
                        ),
                      ],
                    ),
                    ExpansionTile(
                      backgroundColor: Colors.lightGreen,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Related Artists",
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color.fromARGB(255, 232, 225, 239)),
                          ),
                        ],
                      ),
                      children: <Widget>[
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            child: Image.network(
                              relatedArtist1.images!.first.url!,
                              width: MediaQuery.sizeOf(context).height * 0.135,
                              height: MediaQuery.sizeOf(context).height * 0.135,
                              fit: BoxFit.contain,
                            ),
                          ),
                          title: Text(
                            relatedArtist1.name as String,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                height: 1.3),
                          ),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            child: Image.network(
                              relatedArtist2.images!.first.url!,
                              width: MediaQuery.sizeOf(context).height * 0.135,
                              height: MediaQuery.sizeOf(context).height * 0.135,
                              fit: BoxFit.contain,
                            ),
                          ),
                          title: Text(
                            relatedArtist2.name as String,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                height: 1.3),
                          ),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            child: Image.network(
                              relatedArtist3.images!.first.url!,
                              width: MediaQuery.sizeOf(context).height * 0.135,
                              height: MediaQuery.sizeOf(context).height * 0.135,
                              fit: BoxFit.contain,
                            ),
                          ),
                          title: Text(
                            relatedArtist3.name as String,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                height: 1.3),
                          ),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            child: Image.network(
                              relatedArtist4.images!.first.url!,
                              width: MediaQuery.sizeOf(context).height * 0.135,
                              height: MediaQuery.sizeOf(context).height * 0.135,
                              fit: BoxFit.contain,
                            ),
                          ),
                          title: Text(
                            relatedArtist4.name as String,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                height: 1.3),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
