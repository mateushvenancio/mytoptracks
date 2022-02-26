import 'package:mytoptracks/src/domain/entities/album_entity.dart';
import 'package:mytoptracks/src/domain/entities/artist_entity.dart';

class TrackEntity {
  final String id;
  final String name;
  final String previewUrl;
  final String uri;
  final List<ArtistEntity> artists;
  final List<AlbumEntity> albums;

  TrackEntity({
    required this.id,
    required this.name,
    required this.previewUrl,
    required this.uri,
    required this.artists,
    required this.albums,
  });
}

/**
 * {
 * "name": "string",
  "popularity": 0,
  "preview_url": "string",
  "track_number": 0,
  "type": "string",
  "uri": "string",
  "is_local": true
  }
 */

/** ARTIST
 * {
      "external_urls": {
        "spotify": "string"
      },
      "followers": {
        "href": "string",
        "total": 0
      },
      "genres": [
        "Prog rock",
        "Grunge"
      ],
      "href": "string",
      "id": "string",
      "images": [
        {
          "url": "https://i.scdn.co/image/ab67616d00001e02ff9ca10b55ce82ae553c8228\n",
          "height": 300,
          "width": 300
        }
      ],
      "name": "string",
      "popularity": 0,
      "type": "artist",
      "uri": "string"
    }
 */


/*
    ALBUM

    "album_type": "compilation",
    "total_tracks": 9,
    "available_markets": [
      "CA",
      "BR",
      "IT"
    ],
    "external_urls": {
      "spotify": "string"
    },
    "href": "string",
    "id": "2up3OPMp9Tb4dAKM2erWXQ",
    "images": [
      {
        "url": "https://i.scdn.co/image/ab67616d00001e02ff9ca10b55ce82ae553c8228\n",
        "height": 300,
        "width": 300
      }
    ],
    "name": "string",
    "release_date": "1981-12",
    "release_date_precision": "year",
    "restrictions": {
      "reason": "market"
    },
    "type": "album",
    "uri": "spotify:album:2up3OPMp9Tb4dAKM2erWXQ",
    "album_group": "compilation",
    "artists": [
      {
        "external_urls": {
          "spotify": "string"
        },
        "href": "string",
        "id": "string",
        "name": "string",
        "type": "artist",
        "uri": "string"
      }
    ]
*/