import 'dart:convert';

Track trackFromJson(String str) => Track.fromJson(json.decode(str));

String trackToJson(Track data) => json.encode(data.toJson());

class Track {
  Album? album;
  List<TrackArtist>? artists;
  List<String>? availableMarkets;
  int? discNumber;
  int? durationMs;
  bool? explicit;
  ExternalIds? externalIds;
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  bool? isPlayable;
  LinkedFrom? linkedFrom;
  Restrictions? restrictions;
  String? name;
  int? popularity;
  String? previewUrl;
  int? trackNumber;
  String? type;
  String? uri;
  bool? isLocal;

  Track({
    this.album,
    this.artists,
    this.availableMarkets,
    this.discNumber,
    this.durationMs,
    this.explicit,
    this.externalIds,
    this.externalUrls,
    this.href,
    this.id,
    this.isPlayable,
    this.linkedFrom,
    this.restrictions,
    this.name,
    this.popularity,
    this.previewUrl,
    this.trackNumber,
    this.type,
    this.uri,
    this.isLocal,
  });

  @override
  bool operator ==(Object other) {
    if (other is Track) {
      return this.id == other.id;
    }

    return false;
  }

  Track copyWith({
    Album? album,
    List<TrackArtist>? artists,
    List<String>? availableMarkets,
    int? discNumber,
    int? durationMs,
    bool? explicit,
    ExternalIds? externalIds,
    ExternalUrls? externalUrls,
    String? href,
    String? id,
    bool? isPlayable,
    LinkedFrom? linkedFrom,
    Restrictions? restrictions,
    String? name,
    int? popularity,
    String? previewUrl,
    int? trackNumber,
    String? type,
    String? uri,
    bool? isLocal,
  }) =>
      Track(
        album: album ?? this.album,
        artists: artists ?? this.artists,
        availableMarkets: availableMarkets ?? this.availableMarkets,
        discNumber: discNumber ?? this.discNumber,
        durationMs: durationMs ?? this.durationMs,
        explicit: explicit ?? this.explicit,
        externalIds: externalIds ?? this.externalIds,
        externalUrls: externalUrls ?? this.externalUrls,
        href: href ?? this.href,
        id: id ?? this.id,
        isPlayable: isPlayable ?? this.isPlayable,
        linkedFrom: linkedFrom ?? this.linkedFrom,
        restrictions: restrictions ?? this.restrictions,
        name: name ?? this.name,
        popularity: popularity ?? this.popularity,
        previewUrl: previewUrl ?? this.previewUrl,
        trackNumber: trackNumber ?? this.trackNumber,
        type: type ?? this.type,
        uri: uri ?? this.uri,
        isLocal: isLocal ?? this.isLocal,
      );

  factory Track.fromJson(Map<String, dynamic> json) => Track(
        album: json["album"] == null ? null : Album.fromJson(json["album"]),
        artists: json["artists"] == null
            ? []
            : List<TrackArtist>.from(
                json["artists"]!.map((x) => TrackArtist.fromJson(x))),
        availableMarkets: json["available_markets"] == null
            ? []
            : List<String>.from(json["available_markets"]!.map((x) => x)),
        discNumber: json["disc_number"],
        durationMs: json["duration_ms"],
        explicit: json["explicit"],
        externalIds: json["external_ids"] == null
            ? null
            : ExternalIds.fromJson(json["external_ids"]),
        externalUrls: json["external_urls"] == null
            ? null
            : ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        isPlayable: json["is_playable"],
        linkedFrom: json["linked_from"] == null
            ? null
            : LinkedFrom.fromJson(json["linked_from"]),
        restrictions: json["restrictions"] == null
            ? null
            : Restrictions.fromJson(json["restrictions"]),
        name: json["name"],
        popularity: json["popularity"],
        previewUrl: json["preview_url"],
        trackNumber: json["track_number"],
        type: json["type"],
        uri: json["uri"],
        isLocal: json["is_local"],
      );

  Map<String, dynamic> toJson() => {
        "album": album?.toJson(),
        "artists": artists == null
            ? []
            : List<dynamic>.from(artists!.map((x) => x.toJson())),
        "available_markets": availableMarkets == null
            ? []
            : List<dynamic>.from(availableMarkets!.map((x) => x)),
        "disc_number": discNumber,
        "duration_ms": durationMs,
        "explicit": explicit,
        "external_ids": externalIds?.toJson(),
        "external_urls": externalUrls?.toJson(),
        "href": href,
        "id": id,
        "is_playable": isPlayable,
        "linked_from": linkedFrom?.toJson(),
        "restrictions": restrictions?.toJson(),
        "name": name,
        "popularity": popularity,
        "preview_url": previewUrl,
        "track_number": trackNumber,
        "type": type,
        "uri": uri,
        "is_local": isLocal,
      };
}

class Album {
  String? albumType;
  int? totalTracks;
  List<String>? availableMarkets;
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  List<_Image>? images;
  String? name;
  String? releaseDate;
  String? releaseDatePrecision;
  Restrictions? restrictions;
  String? type;
  String? uri;
  List<AlbumArtist>? artists;

  Album({
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

  Album copyWith({
    String? albumType,
    int? totalTracks,
    List<String>? availableMarkets,
    ExternalUrls? externalUrls,
    String? href,
    String? id,
    List<_Image>? images,
    String? name,
    String? releaseDate,
    String? releaseDatePrecision,
    Restrictions? restrictions,
    String? type,
    String? uri,
    List<AlbumArtist>? artists,
  }) =>
      Album(
        albumType: albumType ?? this.albumType,
        totalTracks: totalTracks ?? this.totalTracks,
        availableMarkets: availableMarkets ?? this.availableMarkets,
        externalUrls: externalUrls ?? this.externalUrls,
        href: href ?? this.href,
        id: id ?? this.id,
        images: images ?? this.images,
        name: name ?? this.name,
        releaseDate: releaseDate ?? this.releaseDate,
        releaseDatePrecision: releaseDatePrecision ?? this.releaseDatePrecision,
        restrictions: restrictions ?? this.restrictions,
        type: type ?? this.type,
        uri: uri ?? this.uri,
        artists: artists ?? this.artists,
      );

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        albumType: json["album_type"],
        totalTracks: json["total_tracks"],
        availableMarkets: json["available_markets"] == null
            ? []
            : List<String>.from(json["available_markets"]!.map((x) => x)),
        externalUrls: json["external_urls"] == null
            ? null
            : ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        images: json["images"] == null
            ? []
            : List<_Image>.from(json["images"]!.map((x) => _Image.fromJson(x))),
        name: json["name"],
        releaseDate: json["release_date"],
        releaseDatePrecision: json["release_date_precision"],
        restrictions: json["restrictions"] == null
            ? null
            : Restrictions.fromJson(json["restrictions"]),
        type: json["type"],
        uri: json["uri"],
        artists: json["artists"] == null
            ? []
            : List<AlbumArtist>.from(
                json["artists"]!.map((x) => AlbumArtist.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "album_type": albumType,
        "total_tracks": totalTracks,
        "available_markets": availableMarkets == null
            ? []
            : List<dynamic>.from(availableMarkets!.map((x) => x)),
        "external_urls": externalUrls?.toJson(),
        "href": href,
        "id": id,
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "name": name,
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

class AlbumArtist {
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  String? name;
  String? type;
  String? uri;

  AlbumArtist({
    this.externalUrls,
    this.href,
    this.id,
    this.name,
    this.type,
    this.uri,
  });

  AlbumArtist copyWith({
    ExternalUrls? externalUrls,
    String? href,
    String? id,
    String? name,
    String? type,
    String? uri,
  }) =>
      AlbumArtist(
        externalUrls: externalUrls ?? this.externalUrls,
        href: href ?? this.href,
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        uri: uri ?? this.uri,
      );

  factory AlbumArtist.fromJson(Map<String, dynamic> json) => AlbumArtist(
        externalUrls: json["external_urls"] == null
            ? null
            : ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        name: json["name"],
        type: json["type"],
        uri: json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "external_urls": externalUrls?.toJson(),
        "href": href,
        "id": id,
        "name": name,
        "type": type,
        "uri": uri,
      };
}

class ExternalUrls {
  String? spotify;

  ExternalUrls({
    this.spotify,
  });

  ExternalUrls copyWith({
    String? spotify,
  }) =>
      ExternalUrls(
        spotify: spotify ?? this.spotify,
      );

  factory ExternalUrls.fromJson(Map<String, dynamic> json) => ExternalUrls(
        spotify: json["spotify"],
      );

  Map<String, dynamic> toJson() => {
        "spotify": spotify,
      };
}

class _Image {
  String url;
  int? height;
  int? width;

  _Image({
    required this.url,
    required this.height,
    required this.width,
  });

  _Image copyWith({
    String? url,
    int? height,
    int? width,
  }) =>
      _Image(
        url: url ?? this.url,
        height: height ?? this.height,
        width: width ?? this.width,
      );

  factory _Image.fromJson(Map<String, dynamic> json) => _Image(
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

  Restrictions copyWith({
    String? reason,
  }) =>
      Restrictions(
        reason: reason ?? this.reason,
      );

  factory Restrictions.fromJson(Map<String, dynamic> json) => Restrictions(
        reason: json["reason"],
      );

  Map<String, dynamic> toJson() => {
        "reason": reason,
      };
}

class TrackArtist {
  ExternalUrls? externalUrls;
  Followers? followers;
  List<String>? genres;
  String? href;
  String? id;
  List<_Image>? images;
  String? name;
  int? popularity;
  String? type;
  String? uri;

  TrackArtist({
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

  TrackArtist copyWith({
    ExternalUrls? externalUrls,
    Followers? followers,
    List<String>? genres,
    String? href,
    String? id,
    List<_Image>? images,
    String? name,
    int? popularity,
    String? type,
    String? uri,
  }) =>
      TrackArtist(
        externalUrls: externalUrls ?? this.externalUrls,
        followers: followers ?? this.followers,
        genres: genres ?? this.genres,
        href: href ?? this.href,
        id: id ?? this.id,
        images: images ?? this.images,
        name: name ?? this.name,
        popularity: popularity ?? this.popularity,
        type: type ?? this.type,
        uri: uri ?? this.uri,
      );

  factory TrackArtist.fromJson(Map<String, dynamic> json) => TrackArtist(
        externalUrls: json["external_urls"] == null
            ? null
            : ExternalUrls.fromJson(json["external_urls"]),
        followers: json["followers"] == null
            ? null
            : Followers.fromJson(json["followers"]),
        genres: json["genres"] == null
            ? []
            : List<String>.from(json["genres"]!.map((x) => x)),
        href: json["href"],
        id: json["id"],
        images: json["images"] == null
            ? []
            : List<_Image>.from(json["images"]!.map((x) => _Image.fromJson(x))),
        name: json["name"],
        popularity: json["popularity"],
        type: json["type"],
        uri: json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "external_urls": externalUrls?.toJson(),
        "followers": followers?.toJson(),
        "genres":
            genres == null ? [] : List<dynamic>.from(genres!.map((x) => x)),
        "href": href,
        "id": id,
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "name": name,
        "popularity": popularity,
        "type": type,
        "uri": uri,
      };
}

class Followers {
  String? href;
  int? total;

  Followers({
    this.href,
    this.total,
  });

  Followers copyWith({
    String? href,
    int? total,
  }) =>
      Followers(
        href: href ?? this.href,
        total: total ?? this.total,
      );

  factory Followers.fromJson(Map<String, dynamic> json) => Followers(
        href: json["href"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "total": total,
      };
}

class ExternalIds {
  String? isrc;
  String? ean;
  String? upc;

  ExternalIds({
    this.isrc,
    this.ean,
    this.upc,
  });

  ExternalIds copyWith({
    String? isrc,
    String? ean,
    String? upc,
  }) =>
      ExternalIds(
        isrc: isrc ?? this.isrc,
        ean: ean ?? this.ean,
        upc: upc ?? this.upc,
      );

  factory ExternalIds.fromJson(Map<String, dynamic> json) => ExternalIds(
        isrc: json["isrc"],
        ean: json["ean"],
        upc: json["upc"],
      );

  Map<String, dynamic> toJson() => {
        "isrc": isrc,
        "ean": ean,
        "upc": upc,
      };
}

class LinkedFrom {
  LinkedFrom();

  LinkedFrom copyWith({dynamic}) => LinkedFrom();

  factory LinkedFrom.fromJson(Map<String, dynamic> json) => LinkedFrom();

  Map<String, dynamic> toJson() => {};
}
