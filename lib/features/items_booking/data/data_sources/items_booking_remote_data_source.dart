import 'package:delta_hospital/core/app_config.dart';
import 'package:delta_hospital/core/services/decoder_service_mixin.dart';
import 'package:delta_hospital/features/items_booking/data/models/item_type_list_response.dart';

import 'package:http/http.dart' as http;

abstract class ItemsBookingRemoteDataSource {
  Future<ItemTypeListResponse> getItemTypeList();
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
}
