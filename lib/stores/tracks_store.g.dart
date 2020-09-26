// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracks_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TracksStore on _TracksStoreBase, Store {
  final _$shortAtom = Atom(name: '_TracksStoreBase.short');

  @override
  List<Track> get short {
    _$shortAtom.reportRead();
    return super.short;
  }

  @override
  set short(List<Track> value) {
    _$shortAtom.reportWrite(value, super.short, () {
      super.short = value;
    });
  }

  final _$mediumAtom = Atom(name: '_TracksStoreBase.medium');

  @override
  List<Track> get medium {
    _$mediumAtom.reportRead();
    return super.medium;
  }

  @override
  set medium(List<Track> value) {
    _$mediumAtom.reportWrite(value, super.medium, () {
      super.medium = value;
    });
  }

  final _$longAtom = Atom(name: '_TracksStoreBase.long');

  @override
  List<Track> get long {
    _$longAtom.reportRead();
    return super.long;
  }

  @override
  set long(List<Track> value) {
    _$longAtom.reportWrite(value, super.long, () {
      super.long = value;
    });
  }

  final _$getTracksAsyncAction = AsyncAction('_TracksStoreBase.getTracks');

  @override
  Future getTracks() {
    return _$getTracksAsyncAction.run(() => super.getTracks());
  }

  final _$fetchTracksAsyncAction = AsyncAction('_TracksStoreBase.fetchTracks');

  @override
  Future<List<Track>> fetchTracks(String token, String term) {
    return _$fetchTracksAsyncAction.run(() => super.fetchTracks(token, term));
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
