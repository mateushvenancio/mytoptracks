import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mytoptracks/app/modules/home/components/artists_tile.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  PageController pageController;

  int _index = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    tabController = TabController(vsync: this, length: 2);
    // controller.store.getArtists();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Top Tracks'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              controller.store.getArtists();
            },
          ),
        ],
        bottom: TabBar(
          controller: tabController,
          tabs: [
            Tab(text: 'Artistas'),
            Tab(text: 'Faixas'),
          ],
        ),
      ),
      body: Observer(builder: (_) {
        return TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: tabController,
          children: [
            [
              ListView(
                children: controller.store.short.map((e) {
                  return ArtistsTile(e);
                }).toList(),
              ),
              ListView(
                children: controller.store.medium.map((e) {
                  return ArtistsTile(e);
                }).toList(),
              ),
              ListView(
                children: controller.store.long.map((e) {
                  return ArtistsTile(e);
                }).toList(),
              ),
            ][_index],
            Container(color: Colors.blue),
          ],
        );
      }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (value) {
          setState(() {
            _index = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            title: Text('Curto'),
            icon: Icon(Icons.calendar_today),
          ),
          BottomNavigationBarItem(
            title: Text('Médio'),
            icon: Icon(Icons.calendar_today),
          ),
          BottomNavigationBarItem(
            title: Text('Longo'),
            icon: Icon(Icons.calendar_today),
          ),
        ],
      ),
    );
  }
}
