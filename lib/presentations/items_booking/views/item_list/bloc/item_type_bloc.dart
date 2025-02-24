import 'package:delta_hospital/data/models/item_type_list_response.dart';
import 'package:delta_hospital/domain/repositories/items_booking_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
sealed class ItemTypeEvent {}

final class GetItemTypeEvent extends ItemTypeEvent {}

@immutable
sealed class ItemTypeState {}

final class ItemTypeInitial extends ItemTypeState {}

final class ItemTypeLoading extends ItemTypeState {}

final class ItemTypeSuccess extends ItemTypeState {
  final List<ItemType> itemTypeList;

  ItemTypeSuccess({required this.itemTypeList});
}

final class ItemTypeError extends ItemTypeState {
  final Object error;

  ItemTypeError({required this.error});
}

class ItemTypeBloc extends Bloc<ItemTypeEvent, ItemTypeState> {
  final ItemsBookingRepository _itemsBookingRepository;
  ItemTypeBloc(this._itemsBookingRepository) : super(ItemTypeInitial()) {
    on<GetItemTypeEvent>((event, emit) async {
      emit(ItemTypeLoading());
      try {
        var response = await _itemsBookingRepository.getItemTypeList();
        emit(ItemTypeSuccess(itemTypeList: response));
      } catch (e) {
        emit(ItemTypeError(error: e));
      }
    });
  }
}
