import 'dart:convert';

import 'package:delta_hospital/app/data/models/app_login_response.dart';
import 'package:delta_hospital/app/data/models/auth_response.dart';
import 'package:delta_hospital/app/data/models/user_details_response.dart';
import 'package:delta_hospital/features/items_booking/data/models/item_grid_list_response.dart';
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

  Future<void> saveAppUser({
    required AppUserDetails appUserDetails,
  });
  Future<AppUserDetails?> getAppUser();
  Future<void> clearAppUser();

  Future<void> saveHisSessionExpiryTime({
    required DateTime dateTime,
  });
  Future<DateTime?> getHisSessionExpiryTime();
  Future<void> clearHisSessionExpiryTime();

  Future<void> addItemToCart({required ItemInfo item});
  Future<void> removeItemFromCart({required ItemInfo item});
  Future<List<ItemInfo>> getAddedItemsOfCart();
  Future<void> clearCart();
}

class AppLocalDataSourceImpl implements AppLocalDataSource {
  final Database _database;

  AppLocalDataSourceImpl({required Database database}) : _database = database;

  final String _authStore = 'auth';

  final String _appUserStore = 'appUser';
  final String _hisUserStore = 'hisUser';
  final String _hisSesstionExpiryTime = 'hisSesstionExpiryTime';
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

  @override
  Future<void> saveAppUser({required AppUserDetails appUserDetails}) async {
    var store = intMapStoreFactory.store(_appUserStore);

    await store.delete(_database);

    await store.record(0).put(_database, appUserDetails.toMap());

    return;
  }

  @override
  Future<void> clearAppUser() async {
    var store = stringMapStoreFactory.store(_appUserStore);

    await store.delete(_database);
  }

  @override
  Future<AppUserDetails?> getAppUser() async {
    var store = intMapStoreFactory.store(_appUserStore);

    var user = await store.record(0).get(_database);

    if (user != null) {
      return AppUserDetails.fromJson(jsonEncode(user));
    }
    return null;
  }

  @override
  Future<void> saveHisSessionExpiryTime({required DateTime dateTime}) async {
    var store = intMapStoreFactory.store(_hisSesstionExpiryTime);

    await store.delete(_database);

    await store.record(0).put(_database, {
      'dateTime': dateTime.toIso8601String(),
    });

    return;
  }

  @override
  Future<void> clearHisSessionExpiryTime() async {
    var store = stringMapStoreFactory.store(_hisSesstionExpiryTime);

    await store.delete(_database);
  }

  @override
  Future<DateTime?> getHisSessionExpiryTime() async {
    var store = intMapStoreFactory.store(_hisSesstionExpiryTime);

    var dateTime = await store.record(0).get(_database);

    if (dateTime != null) {
      return DateTime.parse(dateTime['dateTime'] as String);
    }
    return null;
  }

  @override
  Future<void> addItemToCart({required ItemInfo item}) async {
    // List<ItemInfo> items = [];
    // items.add(item);
    var store = intMapStoreFactory.store(_cartStore);
    await store.add(_database, item.toMap());
  }

  @override
  Future<void> removeItemFromCart({required ItemInfo item}) async {
    // List<ItemInfo> items = [];
    var store = intMapStoreFactory.store(_cartStore);
    // var response = await store.record(0).get(_database);

    // items = response?['items'] as List<ItemInfo>;
    // items.remove(item);
    // await store.record(0).put(_database, {
    //   "items": items,
    // });
    final finder =
        Finder(filter: Filter.equals('itemId', item.itemId), limit: 1);
    await store.delete(_database, finder: finder);
  }

  @override
  Future<List<ItemInfo>> getAddedItemsOfCart() async {
    // List<ItemInfo> items = [];
    var store = intMapStoreFactory.store(_cartStore);
    // var response = await store.record(0).get(_database);

    // items = response?['items'] as List<ItemInfo>;
    // return items;
    final items = await store.find(_database);
    return items.map((e) => ItemInfo.fromJson(jsonEncode(e.value))).toList();
  }

  @override
  Future<void> clearCart() async {
    var store = intMapStoreFactory.store(_cartStore);
    await store.delete(_database);
  }
}
