import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mytoptracks/blocs/auth_bloc/auth_bloc.dart';
import 'package:mytoptracks/blocs/auth_bloc/auth_event.dart';
import 'package:mytoptracks/blocs/auth_bloc/auth_state.dart';
import 'package:mytoptracks/blocs/items_bloc/items_bloc.dart';
import 'package:mytoptracks/datasources/api_spotify_repository.dart';
import 'package:mytoptracks/datasources/sp_local_repository.dart';
import 'package:mytoptracks/pages/home_page.dart';
import 'package:mytoptracks/pages/login_page.dart';
import 'package:mytoptracks/pages/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) {
            return AuthBloc(
              localRepository: SpLocalRepository(),
              spotifyRepository: ApiSpotifyRepository(),
            );
          },
        ),
        BlocProvider(
          create: (_) {
            return ItemsBloc(
              localRepository: SpLocalRepository(),
              spotifyRepository: ApiSpotifyRepository(),
            );
          },
        ),
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listener: (_, state) {
          if (state is AuthenticatedAuthState) {
            router.go('/home');
          }
          if (state is UnauthenticatedAuthState) {
            router.go('/login');
          }
        },
        child: MaterialApp.router(
          title: 'My Top Tracks',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.green,
            brightness: Brightness.dark,
          ),
          routerConfig: router,
        ),
      ),
    );
  }
}

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) {
        return SplashPage(
          [
            SplashLoader(
              (context) async {
                context.read<AuthBloc>().add(InitAuthEvent());
              },
            )
          ],
        );
      },
    ),
    GoRoute(
      path: '/login',
      builder: (_, __) {
        return LoginPage();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (_, __) {
        return HomePage();
      },
    ),
  ],
);
