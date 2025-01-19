import 'package:delta_hospital/features/items_booking/data/models/item_grid_list_response.dart';
import 'package:delta_hospital/features/items_booking/data/models/item_type_list_response.dart';

abstract class ItemsBookingRepository {
  Future<List<ItemType>> getItemTypeList();
  Future<ItemGridList> getItemGridList({
    int start = 0,
    int length = 10,
    String searchValue = '',
    int? itemTypeNo,
    int? departmentNo,
  });
  Future<void> addItemToCart({required ItemInfo item});
  Future<void> removeItemFromCart({required ItemInfo item});
  Future<List<ItemInfo>> getAddedItemsOfCart();
  Future<void> clearCart();
}
