// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artists_store.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ArtistsStore = BindInject(
  (i) => ArtistsStore(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ArtistsStore on _ArtistsStoreBase, Store {
  final _$shortAtom = Atom(name: '_ArtistsStoreBase.short');

  @override
  List<Artist> get short {
    _$shortAtom.reportRead();
    return super.short;
  }

  @override
  set short(List<Artist> value) {
    _$shortAtom.reportWrite(value, super.short, () {
      super.short = value;
    });
  }

  final _$mediumAtom = Atom(name: '_ArtistsStoreBase.medium');

  @override
  List<Artist> get medium {
    _$mediumAtom.reportRead();
    return super.medium;
  }

  @override
  set medium(List<Artist> value) {
    _$mediumAtom.reportWrite(value, super.medium, () {
      super.medium = value;
    });
  }

  final _$longAtom = Atom(name: '_ArtistsStoreBase.long');

  @override
  List<Artist> get long {
    _$longAtom.reportRead();
    return super.long;
  }

  @override
  set long(List<Artist> value) {
    _$longAtom.reportWrite(value, super.long, () {
      super.long = value;
    });
  }

  final _$getArtistsAsyncAction = AsyncAction('_ArtistsStoreBase.getArtists');

  @override
  Future getArtists() {
    return _$getArtistsAsyncAction.run(() => super.getArtists());
  }

  final _$getTokenAsyncAction = AsyncAction('_ArtistsStoreBase.getToken');

  @override
  Future getToken(String code) {
    return _$getTokenAsyncAction.run(() => super.getToken(code));
  }

  final _$saveCodeAsyncAction = AsyncAction('_ArtistsStoreBase.saveCode');

  @override
  Future saveCode(String code) {
    return _$saveCodeAsyncAction.run(() => super.saveCode(code));
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
