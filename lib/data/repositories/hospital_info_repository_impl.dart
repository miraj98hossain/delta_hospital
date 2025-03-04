import 'package:delta_hospital/core/exceptions/api_exceptions.dart';
import 'package:delta_hospital/data/data_sources/hospital_info_remote_data_source.dart';
import 'package:delta_hospital/data/models/lookup_response.dart';

import 'package:delta_hospital/domain/repositories/hospital_info_repository.dart';

class HospitalInfoRepositoryImpl implements HospitalInfoRepository {
  final HospitalInfoRemoteDataSource hospitalInfoRemoteDataSource;

  HospitalInfoRepositoryImpl({
    required this.hospitalInfoRemoteDataSource,
  });

  @override
  Future<List<LookUpDetails>> getLookUpByNo({required int lookupNo}) async {
    var response =
        await hospitalInfoRemoteDataSource.getLookUpByNo(lookupNo: lookupNo);
    if (response.success != true) {
      throw ApiDataException(
          response.message ?? "Error Occured While Fetching");
    }
    return response.items ?? [];
  }
}
