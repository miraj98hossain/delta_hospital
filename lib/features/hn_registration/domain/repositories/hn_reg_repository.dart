import 'package:delta_hospital/features/hn_registration/data/models/hn_registration_fee_response.dart';
import 'package:delta_hospital/features/hn_registration/data/models/hn_registration.dart';
import 'package:delta_hospital/features/hn_registration/data/models/hn_registration_response.dart';

abstract class HnRegRepository {
  Future<HnRegistrationFee> getHnRegistrationFee();

  Future<HnInfo> registerHn({required HnRegistration hnRegistration});
}
