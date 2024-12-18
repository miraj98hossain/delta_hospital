import 'package:delta_hospital/core/app_config.dart';
import 'package:delta_hospital/core/services/decoder_service_mixin.dart';
import 'package:delta_hospital/features/book_appointment/data/models/online_department_list.dart';
import 'package:delta_hospital/features/book_appointment/data/models/online_sepcialization_list_response.dart';
import 'package:http/http.dart' as http;

abstract class BookAptRemoteDataSource {
  Future<OnlineDepartmentListResponse> getOnlineDepartmentList();
  Future<OnlineSepcializationListResponse> getOnlineSpecializationtList();
}

class BookAptRemoteDataSourceImpl
    with DecoderServiceMixin
    implements BookAptRemoteDataSource {
  final AppConfig _appConfig;

  BookAptRemoteDataSourceImpl({required AppConfig appConfig})
      : _appConfig = appConfig;

  @override
  Future<OnlineDepartmentListResponse> getOnlineDepartmentList() async {
    var request = http.Request(
        'GET',
        Uri.parse(
            '${_appConfig.baseUrl}online-appointment-api/fapi/appointment/online-departmentList'));

    http.StreamedResponse response = await request.send();
    return await decodeResponse(response,
        decoder: OnlineDepartmentListResponse.fromJson);
  }

  @override
  Future<OnlineSepcializationListResponse>
      getOnlineSpecializationtList() async {
    var request = http.Request(
        'GET',
        Uri.parse(
            '${_appConfig.baseUrl}online-appointment-api/fapi/appointment/online-specialization-list'));

    http.StreamedResponse response = await request.send();
    return await decodeResponse(response,
        decoder: OnlineSepcializationListResponse.fromJson);
  }
}
