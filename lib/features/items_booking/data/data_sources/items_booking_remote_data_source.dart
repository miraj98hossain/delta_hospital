import 'dart:convert';

import 'package:delta_hospital/app/data/models/generic_reponse.dart';
import 'package:delta_hospital/core/app_config.dart';
import 'package:delta_hospital/core/services/decoder_service_mixin.dart';
import 'package:delta_hospital/features/items_booking/data/models/booking_info_model.dart';
import 'package:delta_hospital/features/items_booking/data/models/item_grid_list_response.dart';
import 'package:delta_hospital/features/items_booking/data/models/item_type_list_response.dart';

import 'package:http/http.dart' as http;

abstract class ItemsBookingRemoteDataSource {
  Future<ItemTypeListResponse> getItemTypeList();
  Future<ItemGridListResponse> getItemGridList({
    int start = 0,
    int length = 10,
    String searchValue = '',
    int? itemTypeNo,
    int? departmentNo,
  });
  Future<GenericResponse> createBooking({
    required BookingInfoModel bookingInfoModel,
  });
}

class ItemsBookingRemoteDataSourceImpl
    with DecoderServiceMixin
    implements ItemsBookingRemoteDataSource {
  final AppConfig _appConfig;

  ItemsBookingRemoteDataSourceImpl({required AppConfig appConfig})
      : _appConfig = appConfig;

  @override
  Future<ItemTypeListResponse> getItemTypeList() async {
    var request = http.Request(
        'GET',
        Uri.parse(
            '${_appConfig.baseUrl}online-appointment-api/fapi/diagnostic-item-booking/find-item-type-list'));

    http.StreamedResponse response = await request.send();

    return await decodeResponse(response,
        decoder: ItemTypeListResponse.fromJson);
  }

  @override
  Future<ItemGridListResponse> getItemGridList({
    int start = 0,
    int length = 10,
    String searchValue = '',
    int? itemTypeNo,
    int? departmentNo,
  }) async {
    var url =
        '${_appConfig.baseUrl}online-appointment-api/fapi/diagnostic-item-booking/gridList?draw=1&columns%5B0%5D%5Bdata%5D=0&columns%5B0%5D%5Bname%5D=&columns%5B0%5D%5Bsearchable%5D=true&columns%5B0%5D%5Borderable%5D=true&columns%5B0%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B0%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B1%5D%5Bdata%5D=1&columns%5B1%5D%5Bname%5D=&columns%5B1%5D%5Bsearchable%5D=true&columns%5B1%5D%5Borderable%5D=true&columns%5B1%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B1%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B2%5D%5Bdata%5D=maxDisPct&columns%5B2%5D%5Bname%5D=&columns%5B2%5D%5Bsearchable%5D=true&columns%5B2%5D%5Borderable%5D=false&columns%5B2%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B2%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B3%5D%5Bdata%5D=itemName&columns%5B3%5D%5Bname%5D=itemName&columns%5B3%5D%5Bsearchable%5D=true&columns%5B3%5D%5Borderable%5D=true&columns%5B3%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B3%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B4%5D%5Bdata%5D=salesPrice&columns%5B4%5D%5Bname%5D=salesPrice&columns%5B4%5D%5Bsearchable%5D=true&columns%5B4%5D%5Borderable%5D=true&columns%5B4%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B4%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B5%5D%5Bdata%5D=buName&columns%5B5%5D%5Bname%5D=buName&columns%5B5%5D%5Bsearchable%5D=true&columns%5B5%5D%5Borderable%5D=true&columns%5B5%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B5%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B6%5D%5Bdata%5D=6&columns%5B6%5D%5Bname%5D=&columns%5B6%5D%5Bsearchable%5D=true&columns%5B6%5D%5Borderable%5D=true&columns%5B6%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B6%5D%5Bsearch%5D%5Bregex%5D=false&order%5B0%5D%5Bcolumn%5D=0&order%5B0%5D%5Bdir%5D=asc&start=$start&length=$length&search%5Bvalue%5D=$searchValue&search%5Bregex%5D=false&_=1699164668201${itemTypeNo == null ? '' : '&itemTypeNo=$itemTypeNo'}${departmentNo == null ? '' : '&buNo=$departmentNo'}';

    var request = http.Request(
      'GET',
      Uri.parse(
        url,
      ),
    );

    http.StreamedResponse response = await request.send();

    return await decodeResponse(
      response,
      decoder: ItemGridListResponse.fromJson,
    );
  }

  @override
  Future<GenericResponse> createBooking(
      {required BookingInfoModel bookingInfoModel}) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST',
        Uri.parse(
            '${_appConfig.baseUrl}online-appointment-api/fapi/diagnostic-item-booking/create-booking'));
    request.body = json.encode(bookingInfoModel.toMap());
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    return await decodeResponse(response, decoder: GenericResponse.fromJson);
  }
}
