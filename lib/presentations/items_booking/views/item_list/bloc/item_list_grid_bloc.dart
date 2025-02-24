import 'package:delta_hospital/data/models/item_grid_list_response.dart';
import 'package:delta_hospital/domain/repositories/items_booking_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// @immutable
// sealed class ItemGridEvent {}

// final class GetItemGridEvent extends ItemGridEvent {}

// @immutable
// sealed class ItemGridState {}

// class ItemGridStatee {
//   bool isLoading = false;
//   bool isError = false;
//   String errorMessage = '';
//   ItemGridList itemGridList = ItemGridList();
// }

// final class ItemGridInitial extends ItemGridState {}

// final class ItemGridLoading extends ItemGridState {}

// final class ItemGridSuccess extends ItemGridState {
//   final ItemGridList itemGridList;

//   ItemGridSuccess({required this.itemGridList});
// }

// final class ItemGridError extends ItemGridState {
//   final Object error;

//   ItemGridError({required this.error});
// }

// class ItemGridBloc extends Bloc<ItemGridEvent, ItemGridState> {
//   final ItemsBookingRepository _itemsBookingRepository;
//   ItemGridBloc(this._itemsBookingRepository) : super(ItemGridInitial()) {
//     on<GetItemGridEvent>((event, emit) async {
//       emit(ItemGridLoading());
//       try {
//         var response = await _itemsBookingRepository.getItemGridList();
//         // emit(ItemGridSuccess(itemGridList: response));
//       } catch (e) {
//         emit(ItemGridError(error: e));
//       }
//     });
//   }
// }

@immutable
sealed class ItemGridEvent {}

final class GetItemGridEvent extends ItemGridEvent {
  final int length;
  final String searchValue;
  final int? itemTypeNo;

  GetItemGridEvent({this.length = 10, this.searchValue = '', this.itemTypeNo});
}

class ItemGridState {
  final bool isInitial;
  final bool isLoading;
  final bool isError;
  final String errorMessage;
  final ItemGridList itemGridList;

  const ItemGridState({
    this.isInitial = false,
    this.isLoading = false,
    this.isError = false,
    this.errorMessage = '',
    required this.itemGridList,
  });

  ItemGridState copyWith({
    bool? isInitial,
    bool? isLoading,
    bool? isError,
    String? errorMessage,
    ItemGridList? itemGridList,
  }) {
    return ItemGridState(
      isInitial: isInitial ?? this.isInitial,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      errorMessage: errorMessage ?? this.errorMessage,
      itemGridList: itemGridList ?? this.itemGridList,
    );
  }
}

class ItemGridBloc extends Bloc<ItemGridEvent, ItemGridState> {
  final ItemsBookingRepository _itemsBookingRepository;

  ItemGridBloc(this._itemsBookingRepository)
      : super(ItemGridState(itemGridList: ItemGridList(), isInitial: true)) {
    on<GetItemGridEvent>((event, emit) async {
      emit(state.copyWith(
          isInitial: false, isLoading: true, isError: false, errorMessage: ''));
      try {
        final response = await _itemsBookingRepository.getItemGridList(
          length: event.length,
          searchValue: event.searchValue,
          itemTypeNo: event.itemTypeNo,
        );

        await Future.delayed(const Duration(seconds: 1), () {
          emit(state.copyWith(
            isLoading: false,
            itemGridList: response,
          ));
        });
      } catch (e) {
        emit(state.copyWith(
          isLoading: false,
          isError: true,
          errorMessage: e.toString(),
        ));
      }
    });
  }
}
