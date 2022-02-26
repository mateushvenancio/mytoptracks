// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artists_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ArtistsStore on _ArtistsStoreBase, Store {
  final _$shortAtom = Atom(name: '_ArtistsStoreBase.short');

  @override
  List<dynamic> get short {
    _$shortAtom.reportRead();
    return super.short;
  }

  @override
  set short(List<dynamic> value) {
    _$shortAtom.reportWrite(value, super.short, () {
      super.short = value;
    });
  }

  final _$mediumAtom = Atom(name: '_ArtistsStoreBase.medium');

  @override
  List<dynamic> get medium {
    _$mediumAtom.reportRead();
    return super.medium;
  }

  @override
  set medium(List<dynamic> value) {
    _$mediumAtom.reportWrite(value, super.medium, () {
      super.medium = value;
    });
  }

  final _$longAtom = Atom(name: '_ArtistsStoreBase.long');

  @override
  List<dynamic> get long {
    _$longAtom.reportRead();
    return super.long;
  }

  @override
  set long(List<dynamic> value) {
    _$longAtom.reportWrite(value, super.long, () {
      super.long = value;
    });
  }

  final _$getArtistsAsyncAction = AsyncAction('_ArtistsStoreBase.getArtists');

  @override
  Future getArtists(String token) {
    return _$getArtistsAsyncAction.run(() => super.getArtists(token));
  }

  final _$fetchArtistsAsyncAction =
      AsyncAction('_ArtistsStoreBase.fetchArtists');

  @override
  Future<List<dynamic>> fetchArtists(String token, String term) {
    return _$fetchArtistsAsyncAction.run(() => super.fetchArtists(token, term));
  }

  @override
  String toString() {
    return '''
short: ${short},
medium: ${medium},
long: ${long}
    ''';
  }
}
