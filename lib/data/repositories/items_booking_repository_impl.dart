import 'package:delta_hospital/data/data_sources/app_local_data_source.dart';
import 'package:delta_hospital/core/exceptions/api_exceptions.dart';
import 'package:delta_hospital/data/data_sources/items_booking_remote_data_source.dart';
import 'package:delta_hospital/data/models/booking_info_model.dart';
import 'package:delta_hospital/data/models/item_grid_list_response.dart';
import 'package:delta_hospital/data/models/item_type_list_response.dart';
import 'package:delta_hospital/domain/repositories/items_booking_repository.dart';

class ItemsBookingRepositoryImpl implements ItemsBookingRepository {
  final ItemsBookingRemoteDataSource remoteDataSource;
  final AppLocalDataSource localDataSource;

  ItemsBookingRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<ItemType>> getItemTypeList() async {
    var response = await remoteDataSource.getItemTypeList();
    if (response.success != true) {
      throw ApiDataException(
          response.message ?? "Error Occured While Fetching");
    }
    return response.items ?? [];
  }

  @override
  Future<ItemGridList> getItemGridList({
    int start = 0,
    int length = 10,
    String searchValue = '',
    int? itemTypeNo,
    int? departmentNo,
  }) async {
    var response = await remoteDataSource.getItemGridList(
        start: start,
        length: length,
        searchValue: searchValue,
        itemTypeNo: itemTypeNo,
        departmentNo: departmentNo);
    if (response.success != true) {
      throw ApiDataException(
          response.message ?? "Error Occured While Fetching");
    }
    return response.obj ??
        ItemGridList(
          draw: "0",
          recordsFiltered: "0",
          recordsTotal: "0",
          data: [],
        );
  }

  @override
  Future<void> addItemToCart({required ItemInfo item}) async {
    await localDataSource.addItemToCart(item: item);
  }

  @override
  Future<void> clearCart() async {
    await localDataSource.clearCart();
  }

  @override
  Future<List<ItemInfo>> getAddedItemsOfCart() async {
    var response = await localDataSource.getAddedItemsOfCart();
    // if(response.isEmpty){
    //    throw const CustomException("Cart is Empty");
    // }
    return response;
  }

  @override
  Future<void> removeItemFromCart({required ItemInfo item}) async {
    await localDataSource.removeItemFromCart(item: item);
  }

  @override
  Future<void> createBooking({
    required BookingInfoModel bookingInfoModel,
  }) async {
    var response = await remoteDataSource.createBooking(
        bookingInfoModel: bookingInfoModel);
    if (response.success != true) {
      throw ApiDataException(response.message ?? "Error Occured While Booking");
    }
  }
}
