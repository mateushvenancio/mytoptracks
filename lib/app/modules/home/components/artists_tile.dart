import 'package:flutter/material.dart';
import 'package:mytoptracks/models/artist.dart';

class ArtistsTile extends StatelessWidget {
  final Artist model;

  ArtistsTile(this.model);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          model.images.length > 0
              ? model.images[0]
              : 'https://www.bauducco.com.br/wp-content/uploads/2017/09/default-placeholder-1-2.png',
        ),
      ),
      title: Text(model.name ?? ''),
      subtitle: Text(model.genres.length > 0 ? model.genres[0] : ''),
    );
  }
}
