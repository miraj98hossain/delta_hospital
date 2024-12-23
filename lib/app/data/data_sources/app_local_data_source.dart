import 'dart:convert';

import 'package:delta_hospital/app/data/models/auth_response.dart';
import 'package:delta_hospital/app/data/models/user_details_response.dart';
import 'package:sembast/sembast.dart';

abstract class AppLocalDataSource {
  Future<void> saveAuthResponse({
    required AuthResponse response,
  });
  Future<AuthResponse?> getAuthResponse();
  Future<void> clearAuthResponse();

  Future<void> saveHisUser({
    required UserDetails userDetails,
  });
  Future<UserDetails?> getHisUser();
  Future<void> clearHisUser();
}

class AppLocalDataSourceImpl implements AppLocalDataSource {
  final Database _database;

  AppLocalDataSourceImpl({required Database database}) : _database = database;

  final String _authStore = 'auth';

  final String _appUserStore = 'appUser';
  final String _hisUserStore = 'hisUser';

  final String _companyStore = 'company';

  final String _cartStore = 'cart';

  @override
  Future<void> saveAuthResponse({
    required AuthResponse response,
  }) async {
    var store = intMapStoreFactory.store(_authStore);

    await store.delete(_database);

    await store.record(0).put(_database, response.toMap());

    return;
  }

  @override
  Future<AuthResponse?> getAuthResponse() async {
    var store = intMapStoreFactory.store(_authStore);

    var auth = await store.record(0).get(_database);

    if (auth != null) {
      return AuthResponse.fromJson(jsonEncode(auth));
    }
    return null;
  }

  @override
  Future<void> clearAuthResponse() async {
    var store = stringMapStoreFactory.store(_authStore);

    await store.delete(_database);
  }

  @override
  Future<void> saveHisUser({required UserDetails userDetails}) async {
    var store = intMapStoreFactory.store(_hisUserStore);

    await store.delete(_database);

    await store.record(0).put(_database, userDetails.toMap());

    return;
  }

  @override
  Future<void> clearHisUser() async {
    var store = stringMapStoreFactory.store(_hisUserStore);

    await store.delete(_database);
  }

  @override
  Future<UserDetails?> getHisUser() async {
    var store = intMapStoreFactory.store(_hisUserStore);

    var user = await store.record(0).get(_database);

    if (user != null) {
      return UserDetails.fromJson(jsonEncode(user));
    }
    return null;
  }
}
