import 'package:flutter/material.dart';
import 'package:mytoptracks/models/track.dart';

class TracksTile extends StatelessWidget {
  final Track model;

  TracksTile(this.model);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        model.name ?? '',
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        model.album.name +
            ' - ' +
            (model.artists.length > 0 ? model.artists.first.name : '' ?? ''),
        style: TextStyle(color: Colors.white),
      ),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          model.album.images.length > 0
              ? model.album.images[0].url
              : 'https://www.bauducco.com.br/wp-content/uploads/2017/09/default-placeholder-1-2.png',
        ),
      ),
    );
  }
}
