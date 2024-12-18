import 'package:delta_hospital/app/data/data_sources/local_data_source.dart';
import 'package:delta_hospital/core/exceptions/api_exceptions.dart';
import 'package:delta_hospital/features/items_booking/data/data_sources/items_booking_remote_data_source.dart';
import 'package:delta_hospital/features/items_booking/data/models/item_type_list_response.dart';
import 'package:delta_hospital/features/items_booking/domain/repositories/items_booking_repository.dart';

class ItemsBookingRepositoryImpl implements ItemsBookingRepository {
  final ItemsBookingRemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  ItemsBookingRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<ItemType>> getItemTypeList() async {
    var response = await remoteDataSource.getItemTypeList();
    if (response.success != true) {
      throw ApiDataException(response.message!);
    }
    return response.items ?? [];
  }
}
