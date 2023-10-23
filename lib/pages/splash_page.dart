import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  final List<SplashLoader> loaders;
  const SplashPage(this.loaders, {super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  _load() async {
    await Future.wait(widget.loaders.map((e) => e.loader(context)));
    context.go('/login');
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _load();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Splash')),
    );
  }
}

class SplashLoader {
  final Future<void> Function(BuildContext context) loader;
  SplashLoader(this.loader);
}
