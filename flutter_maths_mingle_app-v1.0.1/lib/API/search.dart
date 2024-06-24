// To parse this JSON data, do
//
//     final searchResult = searchResultFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_maths_mingle_app/API/track.dart';

SearchResult searchResultFromJson(String str) =>
    SearchResult.fromJson(json.decode(str));

String searchResultToJson(SearchResult data) => json.encode(data.toJson());

class SearchResult {
  Tracks? tracks;
  Artists? artists;
  Albums? albums;
  Playlists? playlists;
  Audiobooks? shows;
  Episodes? episodes;
  Audiobooks? audiobooks;

  SearchResult({
    this.tracks,
    this.artists,
    this.albums,
    this.playlists,
    this.shows,
    this.episodes,
    this.audiobooks,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) => SearchResult(
        tracks: json["tracks"] == null ? null : Tracks.fromJson(json["tracks"]),
        artists:
            json["artists"] == null ? null : Artists.fromJson(json["artists"]),
        albums: json["albums"] == null ? null : Albums.fromJson(json["albums"]),
        playlists: json["playlists"] == null
            ? null
            : Playlists.fromJson(json["playlists"]),
        shows:
            json["shows"] == null ? null : Audiobooks.fromJson(json["shows"]),
        episodes: json["episodes"] == null
            ? null
            : Episodes.fromJson(json["episodes"]),
        audiobooks: json["audiobooks"] == null
            ? null
            : Audiobooks.fromJson(json["audiobooks"]),
      );

  Map<String, dynamic> toJson() => {
        "tracks": tracks?.toJson(),
        "artists": artists?.toJson(),
        "albums": albums?.toJson(),
        "playlists": playlists?.toJson(),
        "shows": shows?.toJson(),
        "episodes": episodes?.toJson(),
        "audiobooks": audiobooks?.toJson(),
      };
}

class Albums {
  String? href;
  int? limit;
  String? next;
  int? offset;
  String? previous;
  int? total;
  List<AlbumElement>? items;

  Albums({
    this.href,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.total,
    this.items,
  });

  factory Albums.fromJson(Map<String, dynamic> json) => Albums(
        href: json["href"],
        limit: json["limit"],
        next: json["next"],
        offset: json["offset"],
        previous: json["previous"],
        total: json["total"],
        items: json["items"] == null
            ? []
            : List<AlbumElement>.from(
                json["items"]!.map((x) => AlbumElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "limit": limit,
        "next": next,
        "offset": offset,
        "previous": previous,
        "total": total,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class AlbumElement {
  String? albumType;
  int? totalTracks;
  List<String>? availableMarkets;
  ExternalUrls? externalUrls;
  Href? href;
  String? id;
  List<Image>? images;
  Href? name;
  String? releaseDate;
  String? releaseDatePrecision;
  Restrictions? restrictions;
  String? type;
  String? uri;
  List<Artist>? artists;

  AlbumElement({
    this.albumType,
    this.totalTracks,
    this.availableMarkets,
    this.externalUrls,
    this.href,
    this.id,
    this.images,
    this.name,
    this.releaseDate,
    this.releaseDatePrecision,
    this.restrictions,
    this.type,
    this.uri,
    this.artists,
  });

  factory AlbumElement.fromJson(Map<String, dynamic> json) => AlbumElement(
        albumType: json["album_type"],
        totalTracks: json["total_tracks"],
        availableMarkets: json["available_markets"] == null
            ? []
            : List<String>.from(json["available_markets"]!.map((x) => x)),
        externalUrls: json["external_urls"] == null
            ? null
            : ExternalUrls.fromJson(json["external_urls"]),
        href: hrefValues.map[json["href"]]!,
        id: json["id"],
        images: json["images"] == null
            ? []
            : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
        name: hrefValues.map[json["name"]]!,
        releaseDate: json["release_date"],
        releaseDatePrecision: json["release_date_precision"],
        restrictions: json["restrictions"] == null
            ? null
            : Restrictions.fromJson(json["restrictions"]),
        type: json["type"],
        uri: json["uri"],
        artists: json["artists"] == null
            ? []
            : List<Artist>.from(
                json["artists"]!.map((x) => Artist.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "album_type": albumType,
        "total_tracks": totalTracks,
        "available_markets": availableMarkets == null
            ? []
            : List<dynamic>.from(availableMarkets!.map((x) => x)),
        "external_urls": externalUrls?.toJson(),
        "href": hrefValues.reverse[href],
        "id": id,
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "name": hrefValues.reverse[name],
        "release_date": releaseDate,
        "release_date_precision": releaseDatePrecision,
        "restrictions": restrictions?.toJson(),
        "type": type,
        "uri": uri,
        "artists": artists == null
            ? []
            : List<dynamic>.from(artists!.map((x) => x.toJson())),
      };
}

class Artist {
  ExternalUrls? externalUrls;
  Href? href;
  Href? id;
  Href? name;
  String? type;
  Href? uri;

  Artist({
    this.externalUrls,
    this.href,
    this.id,
    this.name,
    this.type,
    this.uri,
  });

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        externalUrls: json["external_urls"] == null
            ? null
            : ExternalUrls.fromJson(json["external_urls"]),
        href: hrefValues.map[json["href"]]!,
        id: hrefValues.map[json["id"]]!,
        name: hrefValues.map[json["name"]]!,
        type: json["type"],
        uri: hrefValues.map[json["uri"]]!,
      );

  Map<String, dynamic> toJson() => {
        "external_urls": externalUrls?.toJson(),
        "href": hrefValues.reverse[href],
        "id": hrefValues.reverse[id],
        "name": hrefValues.reverse[name],
        "type": type,
        "uri": hrefValues.reverse[uri],
      };
}

class ExternalUrls {
  Href? spotify;

  ExternalUrls({
    this.spotify,
  });

  factory ExternalUrls.fromJson(Map<String, dynamic> json) => ExternalUrls(
        spotify: hrefValues.map[json["spotify"]]!,
      );

  Map<String, dynamic> toJson() => {
        "spotify": hrefValues.reverse[spotify],
      };
}

enum Href { STRING }

final hrefValues = EnumValues({"string": Href.STRING});

class Image {
  String? url;
  int? height;
  int? width;

  Image({
    this.url,
    this.height,
    this.width,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: json["url"],
        height: json["height"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "height": height,
        "width": width,
      };
}

class Restrictions {
  String? reason;

  Restrictions({
    this.reason,
  });

  factory Restrictions.fromJson(Map<String, dynamic> json) => Restrictions(
        reason: json["reason"],
      );

  Map<String, dynamic> toJson() => {
        "reason": reason,
      };
}

class Artists {
  String? href;
  int? limit;
  String? next;
  int? offset;
  String? previous;
  int? total;
  List<ArtistElement>? items;

  Artists({
    this.href,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.total,
    this.items,
  });

  factory Artists.fromJson(Map<String, dynamic> json) => Artists(
        href: json["href"],
        limit: json["limit"],
        next: json["next"],
        offset: json["offset"],
        previous: json["previous"],
        total: json["total"],
        items: json["items"] == null
            ? []
            : List<ArtistElement>.from(
                json["items"]!.map((x) => ArtistElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "limit": limit,
        "next": next,
        "offset": offset,
        "previous": previous,
        "total": total,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class ArtistElement {
  ExternalUrls? externalUrls;
  Followers? followers;
  List<String>? genres;
  Href? href;
  Href? id;
  List<Image>? images;
  Href? name;
  int? popularity;
  String? type;
  Href? uri;

  ArtistElement({
    this.externalUrls,
    this.followers,
    this.genres,
    this.href,
    this.id,
    this.images,
    this.name,
    this.popularity,
    this.type,
    this.uri,
  });

  factory ArtistElement.fromJson(Map<String, dynamic> json) => ArtistElement(
        externalUrls: json["external_urls"] == null
            ? null
            : ExternalUrls.fromJson(json["external_urls"]),
        followers: json["followers"] == null
            ? null
            : Followers.fromJson(json["followers"]),
        genres: json["genres"] == null
            ? []
            : List<String>.from(json["genres"]!.map((x) => x)),
        href: hrefValues.map[json["href"]]!,
        id: hrefValues.map[json["id"]]!,
        images: json["images"] == null
            ? []
            : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
        name: hrefValues.map[json["name"]]!,
        popularity: json["popularity"],
        type: json["type"],
        uri: hrefValues.map[json["uri"]]!,
      );

  Map<String, dynamic> toJson() => {
        "external_urls": externalUrls?.toJson(),
        "followers": followers?.toJson(),
        "genres":
            genres == null ? [] : List<dynamic>.from(genres!.map((x) => x)),
        "href": hrefValues.reverse[href],
        "id": hrefValues.reverse[id],
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "name": hrefValues.reverse[name],
        "popularity": popularity,
        "type": type,
        "uri": hrefValues.reverse[uri],
      };
}

class Followers {
  Href? href;
  int? total;

  Followers({
    this.href,
    this.total,
  });

  factory Followers.fromJson(Map<String, dynamic> json) => Followers(
        href: hrefValues.map[json["href"]]!,
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "href": hrefValues.reverse[href],
        "total": total,
      };
}

class Audiobooks {
  String? href;
  int? limit;
  String? next;
  int? offset;
  String? previous;
  int? total;
  List<AudiobooksItem>? items;

  Audiobooks({
    this.href,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.total,
    this.items,
  });

  factory Audiobooks.fromJson(Map<String, dynamic> json) => Audiobooks(
        href: json["href"],
        limit: json["limit"],
        next: json["next"],
        offset: json["offset"],
        previous: json["previous"],
        total: json["total"],
        items: json["items"] == null
            ? []
            : List<AudiobooksItem>.from(
                json["items"]!.map((x) => AudiobooksItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "limit": limit,
        "next": next,
        "offset": offset,
        "previous": previous,
        "total": total,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class AudiobooksItem {
  List<Author>? authors;
  List<Href>? availableMarkets;
  List<Copyright>? copyrights;
  Href? description;
  Href? htmlDescription;
  String? edition;
  bool? explicit;
  ExternalUrls? externalUrls;
  Href? href;
  Href? id;
  List<Image>? images;
  List<Href>? languages;
  Href? mediaType;
  Href? name;
  List<Author>? narrators;
  Href? publisher;
  String? type;
  Href? uri;
  int? totalChapters;
  bool? isExternallyHosted;
  int? totalEpisodes;

  AudiobooksItem({
    this.authors,
    this.availableMarkets,
    this.copyrights,
    this.description,
    this.htmlDescription,
    this.edition,
    this.explicit,
    this.externalUrls,
    this.href,
    this.id,
    this.images,
    this.languages,
    this.mediaType,
    this.name,
    this.narrators,
    this.publisher,
    this.type,
    this.uri,
    this.totalChapters,
    this.isExternallyHosted,
    this.totalEpisodes,
  });

  factory AudiobooksItem.fromJson(Map<String, dynamic> json) => AudiobooksItem(
        authors: json["authors"] == null
            ? []
            : List<Author>.from(
                json["authors"]!.map((x) => Author.fromJson(x))),
        availableMarkets: json["available_markets"] == null
            ? []
            : List<Href>.from(
                json["available_markets"]!.map((x) => hrefValues.map[x]!)),
        copyrights: json["copyrights"] == null
            ? []
            : List<Copyright>.from(
                json["copyrights"]!.map((x) => Copyright.fromJson(x))),
        description: hrefValues.map[json["description"]]!,
        htmlDescription: hrefValues.map[json["html_description"]]!,
        edition: json["edition"],
        explicit: json["explicit"],
        externalUrls: json["external_urls"] == null
            ? null
            : ExternalUrls.fromJson(json["external_urls"]),
        href: hrefValues.map[json["href"]]!,
        id: hrefValues.map[json["id"]]!,
        images: json["images"] == null
            ? []
            : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
        languages: json["languages"] == null
            ? []
            : List<Href>.from(
                json["languages"]!.map((x) => hrefValues.map[x]!)),
        mediaType: hrefValues.map[json["media_type"]]!,
        name: hrefValues.map[json["name"]]!,
        narrators: json["narrators"] == null
            ? []
            : List<Author>.from(
                json["narrators"]!.map((x) => Author.fromJson(x))),
        publisher: hrefValues.map[json["publisher"]]!,
        type: json["type"],
        uri: hrefValues.map[json["uri"]]!,
        totalChapters: json["total_chapters"],
        isExternallyHosted: json["is_externally_hosted"],
        totalEpisodes: json["total_episodes"],
      );

  Map<String, dynamic> toJson() => {
        "authors": authors == null
            ? []
            : List<dynamic>.from(authors!.map((x) => x.toJson())),
        "available_markets": availableMarkets == null
            ? []
            : List<dynamic>.from(
                availableMarkets!.map((x) => hrefValues.reverse[x])),
        "copyrights": copyrights == null
            ? []
            : List<dynamic>.from(copyrights!.map((x) => x.toJson())),
        "description": hrefValues.reverse[description],
        "html_description": hrefValues.reverse[htmlDescription],
        "edition": edition,
        "explicit": explicit,
        "external_urls": externalUrls?.toJson(),
        "href": hrefValues.reverse[href],
        "id": hrefValues.reverse[id],
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "languages": languages == null
            ? []
            : List<dynamic>.from(languages!.map((x) => hrefValues.reverse[x])),
        "media_type": hrefValues.reverse[mediaType],
        "name": hrefValues.reverse[name],
        "narrators": narrators == null
            ? []
            : List<dynamic>.from(narrators!.map((x) => x.toJson())),
        "publisher": hrefValues.reverse[publisher],
        "type": type,
        "uri": hrefValues.reverse[uri],
        "total_chapters": totalChapters,
        "is_externally_hosted": isExternallyHosted,
        "total_episodes": totalEpisodes,
      };
}

class Author {
  Href? name;

  Author({
    this.name,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        name: hrefValues.map[json["name"]]!,
      );

  Map<String, dynamic> toJson() => {
        "name": hrefValues.reverse[name],
      };
}

class Copyright {
  Href? text;
  Href? type;

  Copyright({
    this.text,
    this.type,
  });

  factory Copyright.fromJson(Map<String, dynamic> json) => Copyright(
        text: hrefValues.map[json["text"]]!,
        type: hrefValues.map[json["type"]]!,
      );

  Map<String, dynamic> toJson() => {
        "text": hrefValues.reverse[text],
        "type": hrefValues.reverse[type],
      };
}

class Episodes {
  String? href;
  int? limit;
  String? next;
  int? offset;
  String? previous;
  int? total;
  List<EpisodesItem>? items;

  Episodes({
    this.href,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.total,
    this.items,
  });

  factory Episodes.fromJson(Map<String, dynamic> json) => Episodes(
        href: json["href"],
        limit: json["limit"],
        next: json["next"],
        offset: json["offset"],
        previous: json["previous"],
        total: json["total"],
        items: json["items"] == null
            ? []
            : List<EpisodesItem>.from(
                json["items"]!.map((x) => EpisodesItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "limit": limit,
        "next": next,
        "offset": offset,
        "previous": previous,
        "total": total,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class EpisodesItem {
  String? audioPreviewUrl;
  String? description;
  String? htmlDescription;
  int? durationMs;
  bool? explicit;
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  List<Image>? images;
  bool? isExternallyHosted;
  bool? isPlayable;
  String? language;
  List<String>? languages;
  String? name;
  DateTime? releaseDate;
  String? releaseDatePrecision;
  ResumePoint? resumePoint;
  String? type;
  String? uri;
  Restrictions? restrictions;

  EpisodesItem({
    this.audioPreviewUrl,
    this.description,
    this.htmlDescription,
    this.durationMs,
    this.explicit,
    this.externalUrls,
    this.href,
    this.id,
    this.images,
    this.isExternallyHosted,
    this.isPlayable,
    this.language,
    this.languages,
    this.name,
    this.releaseDate,
    this.releaseDatePrecision,
    this.resumePoint,
    this.type,
    this.uri,
    this.restrictions,
  });

  factory EpisodesItem.fromJson(Map<String, dynamic> json) => EpisodesItem(
        audioPreviewUrl: json["audio_preview_url"],
        description: json["description"],
        htmlDescription: json["html_description"],
        durationMs: json["duration_ms"],
        explicit: json["explicit"],
        externalUrls: json["external_urls"] == null
            ? null
            : ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        images: json["images"] == null
            ? []
            : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
        isExternallyHosted: json["is_externally_hosted"],
        isPlayable: json["is_playable"],
        language: json["language"],
        languages: json["languages"] == null
            ? []
            : List<String>.from(json["languages"]!.map((x) => x)),
        name: json["name"],
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        releaseDatePrecision: json["release_date_precision"],
        resumePoint: json["resume_point"] == null
            ? null
            : ResumePoint.fromJson(json["resume_point"]),
        type: json["type"],
        uri: json["uri"],
        restrictions: json["restrictions"] == null
            ? null
            : Restrictions.fromJson(json["restrictions"]),
      );

  Map<String, dynamic> toJson() => {
        "audio_preview_url": audioPreviewUrl,
        "description": description,
        "html_description": htmlDescription,
        "duration_ms": durationMs,
        "explicit": explicit,
        "external_urls": externalUrls?.toJson(),
        "href": href,
        "id": id,
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "is_externally_hosted": isExternallyHosted,
        "is_playable": isPlayable,
        "language": language,
        "languages": languages == null
            ? []
            : List<dynamic>.from(languages!.map((x) => x)),
        "name": name,
        "release_date":
            "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "release_date_precision": releaseDatePrecision,
        "resume_point": resumePoint?.toJson(),
        "type": type,
        "uri": uri,
        "restrictions": restrictions?.toJson(),
      };
}

class ResumePoint {
  bool? fullyPlayed;
  int? resumePositionMs;

  ResumePoint({
    this.fullyPlayed,
    this.resumePositionMs,
  });

  factory ResumePoint.fromJson(Map<String, dynamic> json) => ResumePoint(
        fullyPlayed: json["fully_played"],
        resumePositionMs: json["resume_position_ms"],
      );

  Map<String, dynamic> toJson() => {
        "fully_played": fullyPlayed,
        "resume_position_ms": resumePositionMs,
      };
}

class Playlists {
  String? href;
  int? limit;
  String? next;
  int? offset;
  String? previous;
  int? total;
  List<PlaylistsItem>? items;

  Playlists({
    this.href,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.total,
    this.items,
  });

  factory Playlists.fromJson(Map<String, dynamic> json) => Playlists(
        href: json["href"],
        limit: json["limit"],
        next: json["next"],
        offset: json["offset"],
        previous: json["previous"],
        total: json["total"],
        items: json["items"] == null
            ? []
            : List<PlaylistsItem>.from(
                json["items"]!.map((x) => PlaylistsItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "limit": limit,
        "next": next,
        "offset": offset,
        "previous": previous,
        "total": total,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class PlaylistsItem {
  bool? collaborative;
  Href? description;
  ExternalUrls? externalUrls;
  Href? href;
  Href? id;
  List<Image>? images;
  Href? name;
  Owner? owner;
  bool? public;
  Href? snapshotId;
  Followers? tracks;
  Href? type;
  Href? uri;

  PlaylistsItem({
    this.collaborative,
    this.description,
    this.externalUrls,
    this.href,
    this.id,
    this.images,
    this.name,
    this.owner,
    this.public,
    this.snapshotId,
    this.tracks,
    this.type,
    this.uri,
  });

  factory PlaylistsItem.fromJson(Map<String, dynamic> json) => PlaylistsItem(
        collaborative: json["collaborative"],
        description: hrefValues.map[json["description"]]!,
        externalUrls: json["external_urls"] == null
            ? null
            : ExternalUrls.fromJson(json["external_urls"]),
        href: hrefValues.map[json["href"]]!,
        id: hrefValues.map[json["id"]]!,
        images: json["images"] == null
            ? []
            : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
        name: hrefValues.map[json["name"]]!,
        owner: json["owner"] == null ? null : Owner.fromJson(json["owner"]),
        public: json["public"],
        snapshotId: hrefValues.map[json["snapshot_id"]]!,
        tracks:
            json["tracks"] == null ? null : Followers.fromJson(json["tracks"]),
        type: hrefValues.map[json["type"]]!,
        uri: hrefValues.map[json["uri"]]!,
      );

  Map<String, dynamic> toJson() => {
        "collaborative": collaborative,
        "description": hrefValues.reverse[description],
        "external_urls": externalUrls?.toJson(),
        "href": hrefValues.reverse[href],
        "id": hrefValues.reverse[id],
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "name": hrefValues.reverse[name],
        "owner": owner?.toJson(),
        "public": public,
        "snapshot_id": hrefValues.reverse[snapshotId],
        "tracks": tracks?.toJson(),
        "type": hrefValues.reverse[type],
        "uri": hrefValues.reverse[uri],
      };
}

class Owner {
  ExternalUrls? externalUrls;
  Followers? followers;
  Href? href;
  Href? id;
  String? type;
  Href? uri;
  Href? displayName;

  Owner({
    this.externalUrls,
    this.followers,
    this.href,
    this.id,
    this.type,
    this.uri,
    this.displayName,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        externalUrls: json["external_urls"] == null
            ? null
            : ExternalUrls.fromJson(json["external_urls"]),
        followers: json["followers"] == null
            ? null
            : Followers.fromJson(json["followers"]),
        href: hrefValues.map[json["href"]]!,
        id: hrefValues.map[json["id"]]!,
        type: json["type"],
        uri: hrefValues.map[json["uri"]]!,
        displayName: hrefValues.map[json["display_name"]]!,
      );

  Map<String, dynamic> toJson() => {
        "external_urls": externalUrls?.toJson(),
        "followers": followers?.toJson(),
        "href": hrefValues.reverse[href],
        "id": hrefValues.reverse[id],
        "type": type,
        "uri": hrefValues.reverse[uri],
        "display_name": hrefValues.reverse[displayName],
      };
}

class Tracks {
  String? href;
  int? limit;
  String? next;
  int? offset;
  String? previous;
  int? total;
  List<Track>? items;

  Tracks({
    this.href,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.total,
    this.items,
  });

  factory Tracks.fromJson(Map<String, dynamic> json) => Tracks(
        href: json["href"],
        limit: json["limit"],
        next: json["next"],
        offset: json["offset"],
        previous: json["previous"],
        total: json["total"],
        items: json["items"] == null
            ? []
            : List<Track>.from(json["items"]!.map((x) => Track.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "limit": limit,
        "next": next,
        "offset": offset,
        "previous": previous,
        "total": total,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

// class TracksItem {
//   AlbumElement? album;
//   List<ArtistElement>? artists;
//   List<Href>? availableMarkets;
//   int? discNumber;
//   int? durationMs;
//   bool? explicit;
//   ExternalIds? externalIds;
//   ExternalUrls? externalUrls;
//   Href? href;
//   Href? id;
//   bool? isPlayable;
//   LinkedFrom? linkedFrom;
//   Restrictions? restrictions;
//   Href? name;
//   int? popularity;
//   Href? previewUrl;
//   int? trackNumber;
//   String? type;
//   Href? uri;
//   bool? isLocal;

//   TracksItem({
//     this.album,
//     this.artists,
//     this.availableMarkets,
//     this.discNumber,
//     this.durationMs,
//     this.explicit,
//     this.externalIds,
//     this.externalUrls,
//     this.href,
//     this.id,
//     this.isPlayable,
//     this.linkedFrom,
//     this.restrictions,
//     this.name,
//     this.popularity,
//     this.previewUrl,
//     this.trackNumber,
//     this.type,
//     this.uri,
//     this.isLocal,
//   });

//   factory TracksItem.fromJson(Map<String, dynamic> json) => TracksItem(
//         album:
//             json["album"] == null ? null : AlbumElement.fromJson(json["album"]),
//         artists: json["artists"] == null
//             ? []
//             : List<ArtistElement>.from(
//                 json["artists"]!.map((x) => ArtistElement.fromJson(x))),
//         availableMarkets: json["available_markets"] == null
//             ? []
//             : List<Href>.from(
//                 json["available_markets"]!.map((x) => hrefValues.map[x]!)),
//         discNumber: json["disc_number"],
//         durationMs: json["duration_ms"],
//         explicit: json["explicit"],
//         externalIds: json["external_ids"] == null
//             ? null
//             : ExternalIds.fromJson(json["external_ids"]),
//         externalUrls: json["external_urls"] == null
//             ? null
//             : ExternalUrls.fromJson(json["external_urls"]),
//         href: hrefValues.map[json["href"]]!,
//         id: hrefValues.map[json["id"]]!,
//         isPlayable: json["is_playable"],
//         linkedFrom: json["linked_from"] == null
//             ? null
//             : LinkedFrom.fromJson(json["linked_from"]),
//         restrictions: json["restrictions"] == null
//             ? null
//             : Restrictions.fromJson(json["restrictions"]),
//         name: hrefValues.map[json["name"]]!,
//         popularity: json["popularity"],
//         previewUrl: hrefValues.map[json["preview_url"]]!,
//         trackNumber: json["track_number"],
//         type: json["type"],
//         uri: hrefValues.map[json["uri"]]!,
//         isLocal: json["is_local"],
//       );

//   Map<String, dynamic> toJson() => {
//         "album": album?.toJson(),
//         "artists": artists == null
//             ? []
//             : List<dynamic>.from(artists!.map((x) => x.toJson())),
//         "available_markets": availableMarkets == null
//             ? []
//             : List<dynamic>.from(
//                 availableMarkets!.map((x) => hrefValues.reverse[x])),
//         "disc_number": discNumber,
//         "duration_ms": durationMs,
//         "explicit": explicit,
//         "external_ids": externalIds?.toJson(),
//         "external_urls": externalUrls?.toJson(),
//         "href": hrefValues.reverse[href],
//         "id": hrefValues.reverse[id],
//         "is_playable": isPlayable,
//         "linked_from": linkedFrom?.toJson(),
//         "restrictions": restrictions?.toJson(),
//         "name": hrefValues.reverse[name],
//         "popularity": popularity,
//         "preview_url": hrefValues.reverse[previewUrl],
//         "track_number": trackNumber,
//         "type": type,
//         "uri": hrefValues.reverse[uri],
//         "is_local": isLocal,
//       };
// }

class ExternalIds {
  Href? isrc;
  Href? ean;
  Href? upc;

  ExternalIds({
    this.isrc,
    this.ean,
    this.upc,
  });

  factory ExternalIds.fromJson(Map<String, dynamic> json) => ExternalIds(
        isrc: hrefValues.map[json["isrc"]]!,
        ean: hrefValues.map[json["ean"]]!,
        upc: hrefValues.map[json["upc"]]!,
      );

  Map<String, dynamic> toJson() => {
        "isrc": hrefValues.reverse[isrc],
        "ean": hrefValues.reverse[ean],
        "upc": hrefValues.reverse[upc],
      };
}

class LinkedFrom {
  LinkedFrom();

  factory LinkedFrom.fromJson(Map<String, dynamic> json) => LinkedFrom();

  Map<String, dynamic> toJson() => {};
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
