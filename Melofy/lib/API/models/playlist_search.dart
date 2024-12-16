/**
 * Class for a Search of a genre playlist, retrieved from the Spotify API.
 * Defines all of the attributes of a Search of a genre playlist.
 */

import 'dart:convert';

PlaylistSearch playlistSearchFromJson(String str) =>
    PlaylistSearch.fromJson(json.decode(str));

String playlistSearchToJson(PlaylistSearch data) => json.encode(data.toJson());

class PlaylistSearch {
  String? href;
  int? limit;
  String? next;
  int? offset;
  String? previous;
  int? total;
  List<Item>? items;

  PlaylistSearch({
    this.href,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.total,
    this.items,
  });

  factory PlaylistSearch.fromJson(Map<String, dynamic> json) => PlaylistSearch(
        href: json["href"],
        limit: json["limit"],
        next: json["next"],
        offset: json["offset"],
        previous: json["previous"],
        total: json["total"],
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
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

class Item {
  bool? collaborative;
  String? description;
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  List<Image>? images;
  String? name;
  Owner? owner;
  bool? public;
  String? snapshotId;
  Tracks? tracks;
  String? type;
  String? uri;

  Item({
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

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        collaborative: json["collaborative"],
        description: json["description"],
        externalUrls: json["external_urls"] == null
            ? null
            : ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        images: json["images"] == null
            ? []
            : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
        name: json["name"],
        owner: json["owner"] == null ? null : Owner.fromJson(json["owner"]),
        public: json["public"],
        snapshotId: json["snapshot_id"],
        tracks: json["tracks"] == null ? null : Tracks.fromJson(json["tracks"]),
        type: json["type"],
        uri: json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "collaborative": collaborative,
        "description": description,
        "external_urls": externalUrls?.toJson(),
        "href": href,
        "id": id,
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "name": name,
        "owner": owner?.toJson(),
        "public": public,
        "snapshot_id": snapshotId,
        "tracks": tracks?.toJson(),
        "type": type,
        "uri": uri,
      };
}

class ExternalUrls {
  String? spotify;

  ExternalUrls({
    this.spotify,
  });

  factory ExternalUrls.fromJson(Map<String, dynamic> json) => ExternalUrls(
        spotify: json["spotify"],
      );

  Map<String, dynamic> toJson() => {
        "spotify": spotify,
      };
}

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

class Owner {
  ExternalUrls? externalUrls;
  Tracks? followers;
  String? href;
  String? id;
  String? type;
  String? uri;
  String? displayName;

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
            : Tracks.fromJson(json["followers"]),
        href: json["href"],
        id: json["id"],
        type: json["type"],
        uri: json["uri"],
        displayName: json["display_name"],
      );

  Map<String, dynamic> toJson() => {
        "external_urls": externalUrls?.toJson(),
        "followers": followers?.toJson(),
        "href": href,
        "id": id,
        "type": type,
        "uri": uri,
        "display_name": displayName,
      };
}

class Tracks {
  String? href;
  int? total;

  Tracks({
    this.href,
    this.total,
  });

  factory Tracks.fromJson(Map<String, dynamic> json) => Tracks(
        href: json["href"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "total": total,
      };
}
