import 'package:delta_hospital/core/app_config.dart';
import 'package:delta_hospital/core/services/decoder_service_mixin.dart';
import 'package:delta_hospital/features/book_appointment/data/models/doctor_grid_list_response.dart';
import 'package:delta_hospital/features/book_appointment/data/models/online_department_list.dart';
import 'package:delta_hospital/features/book_appointment/data/models/online_sepcialization_list_response.dart';
import 'package:http/http.dart' as http;

abstract class BookAptRemoteDataSource {
  Future<OnlineDepartmentListResponse> getOnlineDepartmentList();
  Future<OnlineSepcializationListResponse> getOnlineSpecializationtList();
  Future<DoctorGridListResponse> getDoctorGridList({
    int start = 0,
    int length = 10,
    int? departmentNo,
    List<int>? specializationNos,
    String searchValue = '',
  });
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

  @override
  Future<DoctorGridListResponse> getDoctorGridList(
      {int start = 0,
      int length = 10,
      int? departmentNo,
      List<int>? specializationNos,
      String searchValue = ''}) async {
    var url =
        '${_appConfig.baseUrl}online-appointment-api/fapi/appointment/onlineDoctorgridList?draw=10&columns%5B0%5D%5Bdata%5D=doctorPhoto&columns%5B0%5D%5Bname%5D=&columns%5B0%5D%5Bsearchable%5D=true&columns%5B0%5D%5Borderable%5D=true&columns%5B0%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B0%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B1%5D%5Bdata%5D=doctorName&columns%5B1%5D%5Bname%5D=doctorName&columns%5B1%5D%5Bsearchable%5D=true&columns%5B1%5D%5Borderable%5D=true&columns%5B1%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B1%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B2%5D%5Bdata%5D=specializationName&columns%5B2%5D%5Bname%5D=specializationName&columns%5B2%5D%5Bsearchable%5D=true&columns%5B2%5D%5Borderable%5D=true&columns%5B2%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B2%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B3%5D%5Bdata%5D=docDegree&columns%5B3%5D%5Bname%5D=&columns%5B3%5D%5Bsearchable%5D=true&columns%5B3%5D%5Borderable%5D=true&columns%5B3%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B3%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B4%5D%5Bdata%5D=buName&columns%5B4%5D%5Bname%5D=buName&columns%5B4%5D%5Bsearchable%5D=true&columns%5B4%5D%5Borderable%5D=true&columns%5B4%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B4%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B5%5D%5Bdata%5D=chamber&columns%5B5%5D%5Bname%5D=&columns%5B5%5D%5Bsearchable%5D=true&columns%5B5%5D%5Borderable%5D=true&columns%5B5%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B5%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B6%5D%5Bdata%5D=opdConsultationFee&columns%5B6%5D%5Bname%5D=&columns%5B6%5D%5Bsearchable%5D=true&columns%5B6%5D%5Borderable%5D=false&columns%5B6%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B6%5D%5Bsearch%5D%5Bregex%5D=false&order%5B0%5D%5Bcolumn%5D=0&order%5B0%5D%5Bdir%5D=asc&start=$start&length=$length&search%5Bvalue%5D=$searchValue&search%5Bregex%5D=false${departmentNo == null ? '' : '&buList[]=$departmentNo'}${specializationNos == null || specializationNos.isEmpty ? '' : '&specializationList[]=${specializationNos.join("&specializationList[]=")}'}';

    var request = http.Request('GET', Uri.parse(url));

    http.StreamedResponse response = await request.send();

    return await decodeResponse(
      response,
      decoder: DoctorGridListResponse.fromJson,
    );
  }
}
