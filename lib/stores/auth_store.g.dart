// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStoreBase, Store {
  final _$getCodeAsyncAction = AsyncAction('_AuthStoreBase.getCode');

  @override
  Future getCode() {
    return _$getCodeAsyncAction.run(() => super.getCode());
  }

  final _$getTokenAsyncAction = AsyncAction('_AuthStoreBase.getToken');

  @override
  Future getToken(String code) {
    return _$getTokenAsyncAction.run(() => super.getToken(code));
  }

  final _$saveCodeAsyncAction = AsyncAction('_AuthStoreBase.saveCode');

  @override
  Future saveCode(String code) {
    return _$saveCodeAsyncAction.run(() => super.saveCode(code));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
