/**
 * Class for an artist's top 10 tracks, retrieved from the Spotify API.
 * Defines all of the attributes of an artist's top 10 tracks.
 */

import 'dart:convert';

import 'package:Melofy/API/models/track.dart';

ArtistTracks artistTracksFromJson(String str) =>
    ArtistTracks.fromJson(json.decode(str));

String artistTracksToJson(ArtistTracks data) => json.encode(data.toJson());

class ArtistTracks {
  List<Track>? tracks;

  ArtistTracks({
    this.tracks,
  });

  factory ArtistTracks.fromJson(Map<String, dynamic> json) => ArtistTracks(
        tracks: json["tracks"] == null
            ? []
            : List<Track>.from(json["tracks"]!.map((x) => Track.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tracks": tracks == null
            ? []
            : List<dynamic>.from(tracks!.map((x) => x.toJson())),
      };
}
