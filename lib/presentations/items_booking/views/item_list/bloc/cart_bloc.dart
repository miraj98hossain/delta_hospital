import 'package:delta_hospital/data/models/item_grid_list_response.dart';
import 'package:delta_hospital/domain/repositories/items_booking_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
sealed class CartEvent {}

final class CartItemsGet extends CartEvent {}

final class CartItemRemove extends CartEvent {
  final ItemInfo itemInfo;

  CartItemRemove({required this.itemInfo});
}

final class CartClear extends CartEvent {
  CartClear();
}

final class CartItemAdd extends CartEvent {
  final ItemInfo itemInfo;

  CartItemAdd({required this.itemInfo});
}

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartSuccess extends CartState {
  final List<ItemInfo> cartList;

  CartSuccess({required this.cartList});
}

final class CartError extends CartState {
  final Object error;

  CartError({required this.error});
}

class CartBloc extends Bloc<CartEvent, CartState> {
  final ItemsBookingRepository _itemsBookingRepository;
  CartBloc(this._itemsBookingRepository) : super(CartInitial()) {
    on<CartItemsGet>((event, emit) async {
      emit(CartLoading());
      try {
        var response = await _itemsBookingRepository.getAddedItemsOfCart();
        emit(CartSuccess(cartList: response));
      } catch (e) {
        emit(CartError(error: e));
      }
    });
    on<CartItemAdd>((event, emit) async {
      emit(CartLoading());
      try {
        await _itemsBookingRepository.addItemToCart(item: event.itemInfo);
        var response = await _itemsBookingRepository.getAddedItemsOfCart();
        emit(CartSuccess(cartList: response));
      } catch (e) {
        emit(CartError(error: e));
      }
    });
    on<CartItemRemove>((event, emit) async {
      emit(CartLoading());
      try {
        await _itemsBookingRepository.removeItemFromCart(item: event.itemInfo);
        var response = await _itemsBookingRepository.getAddedItemsOfCart();
        emit(CartSuccess(cartList: response));
      } catch (e) {
        emit(CartError(error: e));
      }
    });
    on<CartClear>((event, emit) async {
      emit(CartLoading());
      try {
        await _itemsBookingRepository.clearCart();
        var response = await _itemsBookingRepository.getAddedItemsOfCart();
        emit(CartSuccess(cartList: response));
      } catch (e) {
        emit(CartError(error: e));
      }
    });
  }
}
