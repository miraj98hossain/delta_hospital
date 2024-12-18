import 'package:delta_hospital/app/data/data_sources/local_data_source.dart';
import 'package:delta_hospital/app/data/data_sources/local_data_source_impl.dart';
import 'package:delta_hospital/core/app_config.dart';
import 'package:delta_hospital/core/sembast.dart';
import 'package:delta_hospital/features/book_appointment/data/data_sources/book_apt_remote_data_source.dart';
import 'package:delta_hospital/features/book_appointment/domain/repositories/book_apt_repository.dart';
import 'package:delta_hospital/features/items_booking/data/data_sources/items_booking_remote_data_source.dart';
import 'package:delta_hospital/features/items_booking/data/repositories/items_booking_repository_impl.dart';
import 'package:get_it/get_it.dart';

import '../features/book_appointment/data/repositories/book_apt_repository_impl.dart';
import '../features/items_booking/domain/repositories/items_booking_repository.dart';

GetIt getIt = GetIt.instance;

T getService<T extends Object>() {
  return getIt<T>();
}

abstract class DIContainer {
  static Future<void> configureServices({String env = "test"}) async {
    switch (env) {
      case 'prod':
        getIt.registerSingleton<AppConfig>(AppConfigImplProd.instance);
        break;
      case 'test':
        getIt.registerSingleton<AppConfig>(AppConfigImplTest.instance);
        break;
      default:
        getIt.registerSingleton<AppConfig>(AppConfigImpl.instance);
        break;
    }

    final db = await SembastDatabase.instance.database;
    getIt.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImpl(database: db),
    );
    //book appointment
    getIt.registerLazySingleton<BookAptRemoteDataSource>(
      () => BookAptRemoteDataSourceImpl(
        appConfig: getIt<AppConfig>(),
      ),
    );

    getIt.registerLazySingleton<BookAptRepository>(
      () => BookAptRepositoryImpl(
        remoteDataSource: getIt<BookAptRemoteDataSource>(),
        localDataSource: getIt<LocalDataSource>(),
      ),
    );
    //items booking
    getIt.registerLazySingleton<ItemsBookingRemoteDataSource>(
      () => ItemsBookingRemoteDataSourceImpl(
        appConfig: getIt<AppConfig>(),
      ),
    );

    getIt.registerLazySingleton<ItemsBookingRepository>(
      () => ItemsBookingRepositoryImpl(
        remoteDataSource: getIt<ItemsBookingRemoteDataSource>(),
        localDataSource: getIt<LocalDataSource>(),
      ),
    );
  }

  static void dispose() {
    getIt.reset();
  }
}
