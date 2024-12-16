import 'package:delta_hospital/app/data/data_sources/local_data_source.dart';
import 'package:delta_hospital/features/book_appointment/data/data_sources/book_apt_remote_data_source.dart';
import 'package:delta_hospital/features/book_appointment/domain/repositories/book_apt_repository.dart';

class BookAptRepositoryImpl implements BookAptRepository {
  final BookAptRemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  BookAptRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});
}
