import 'package:delta_hospital/app/data/data_sources/app_local_data_source.dart';
import 'package:delta_hospital/app/data/data_sources/app_remote_data_source.dart';
import 'package:delta_hospital/app/domain/repositories/app_repository.dart';
import 'package:delta_hospital/app/data/repositories/app_repository_impl.dart';
import 'package:delta_hospital/core/app_config.dart';
import 'package:delta_hospital/core/sembast.dart';
import 'package:delta_hospital/features/book_appointment/data/data_sources/book_apt_remote_data_source.dart';
import 'package:delta_hospital/features/book_appointment/domain/repositories/book_apt_repository.dart';
import 'package:delta_hospital/features/doctor_portal/domain/repositories/doc_portal_repository.dart';
import 'package:delta_hospital/features/items_booking/data/data_sources/items_booking_remote_data_source.dart';
import 'package:delta_hospital/features/items_booking/data/repositories/items_booking_repository_impl.dart';
import 'package:delta_hospital/features/patient_portal/data/data_sources/pat_portal_remote_data_source.dart';
import 'package:delta_hospital/features/patient_portal/data/repositories/pat_portal_repository_impl.dart';
import 'package:delta_hospital/features/patient_portal/domain/repositories/pat_portal_repository.dart';
import 'package:get_it/get_it.dart';

import '../features/book_appointment/data/repositories/book_apt_repository_impl.dart';
import '../features/doctor_portal/data/data_sources/doc_portal_remote_data_source.dart';
import '../features/doctor_portal/data/repositories/doc_portal_repository_impl.dart';
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
    getIt.registerLazySingleton<AppLocalDataSource>(
      () => AppLocalDataSourceImpl(database: db),
    );

    // app remote
    getIt.registerLazySingleton<AppRemoteDataSource>(
      () => AppRemoteDataSourceImpl(
        appConfig: getIt<AppConfig>(),
      ),
    );
    getIt.registerLazySingleton<AppRepository>(
      () => AppRepositoryImpl(
        appRemoteDataSource: getIt<AppRemoteDataSource>(),
        appLocalDataSource: getIt<AppLocalDataSource>(),
      ),
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
        localDataSource: getIt<AppLocalDataSource>(),
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
        localDataSource: getIt<AppLocalDataSource>(),
      ),
    );
    // Patient Portal
    getIt.registerLazySingleton<PatPortalRemoteDataSource>(
      () => PatPortalRemoteDataSourceImpl(
        appConfig: getIt<AppConfig>(),
      ),
    );

    getIt.registerLazySingleton<PatPortalRepository>(
      () => PatPortalRepositoryImpl(
        appRemoteDataSource: getIt<AppRemoteDataSource>(),
        patRemoteDataSource: getIt<PatPortalRemoteDataSource>(),
        localDataSource: getIt<AppLocalDataSource>(),
      ),
    );
    // Doctor Portal
    getIt.registerLazySingleton<DocPortalRemoteDataSource>(
      () => DocPortalRemoteDataSourceImpl(
        appConfig: getIt<AppConfig>(),
      ),
    );

    getIt.registerLazySingleton<DocPortalRepository>(
      () => DocPortalRepositoryImpl(
        remoteDataSource: getIt<DocPortalRemoteDataSource>(),
        localDataSource: getIt<AppLocalDataSource>(),
      ),
    );
  }

  static void dispose() {
    getIt.reset();
  }
}
