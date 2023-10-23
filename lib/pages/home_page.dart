import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytoptracks/blocs/auth_bloc/auth_bloc.dart';
import 'package:mytoptracks/blocs/auth_bloc/auth_event.dart';
import 'package:mytoptracks/blocs/items_bloc/items_bloc.dart';
import 'package:mytoptracks/blocs/items_bloc/items_event.dart';
import 'package:mytoptracks/blocs/items_bloc/items_state.dart';
import 'package:mytoptracks/components/yes_no_dialog.dart';
import 'package:mytoptracks/entities/artist_entity.dart';
import 'package:mytoptracks/entities/track_entity.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late final TabController tabController;
  final pageController = PageController();
  String? result;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ItemsBloc>().add(GetItemsEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<ItemsBloc>().add(GetItemsEvent());
            },
            icon: Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) {
                  return YesNoDialog(
                    title: 'Deseja sair?',
                    onYes: () {
                      context.read<AuthBloc>().add(LogoutAuthEvent());
                    },
                  );
                },
              );
            },
            icon: Icon(Icons.logout),
          ),
        ],
        bottom: TabBar(
          controller: tabController,
          onTap: (value) => pageController.animateToPage(
            value,
            duration: const Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          tabs: [
            Tab(text: 'Faixas'),
            Tab(text: 'Artistas'),
          ],
        ),
      ),
      body: BlocBuilder<ItemsBloc, ItemsState>(
        builder: (context, state) {
          if (state is! SuccessItemsState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: pageController,
            children: [
              TracksPage(state.tracks),
              ArtistsPage(state.artists),
            ],
          );
        },
      ),
    );
  }
}

class TracksPage extends StatelessWidget {
  final List<TrackEntity> tracks;
  const TracksPage(this.tracks, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Essas são as música que você mais ouviu!',
            style: TextStyle(fontSize: 16),
          ),
        ),
        Expanded(
          child: ListView(
            children: tracks.map((e) {
              return ListTile(
                onTap: () => launchUrl(Uri.parse(e.url)),
                leading: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    e.album.images.firstOrNull ?? 'https://community.mp3tag.de/uploads/default/original/2X/a/acf3edeb055e7b77114f9e393d1edeeda37e50c9.png',
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(e.name),
                subtitle: Text(e.artists.map((e) => e.name).join(', ')),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}

class ArtistsPage extends StatelessWidget {
  final List<ArtistEntity> artists;
  const ArtistsPage(this.artists, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Essas são os artistas que você mais ouviu!',
            style: TextStyle(fontSize: 16),
          ),
        ),
        Expanded(
          child: ListView(
            children: artists.map((e) {
              return ListTile(
                onTap: () => launchUrl(Uri.parse(e.url)),
                leading: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    e.images.firstOrNull ?? 'https://community.mp3tag.de/uploads/default/original/2X/a/acf3edeb055e7b77114f9e393d1edeeda37e50c9.png',
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(e.name),
                subtitle: Text(e.genres.join(', ')),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
