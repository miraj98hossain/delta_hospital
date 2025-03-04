import 'package:delta_hospital/data/models/lookup_response.dart';

abstract class HospitalInfoRepository {
  Future<List<LookUpDetails>> getLookUpByNo({required int lookupNo});
}
