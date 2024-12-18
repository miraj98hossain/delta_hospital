import 'package:delta_hospital/features/items_booking/data/models/item_type_list_response.dart';

abstract class ItemsBookingRepository {
  Future<List<ItemType>> getItemTypeList();
}
