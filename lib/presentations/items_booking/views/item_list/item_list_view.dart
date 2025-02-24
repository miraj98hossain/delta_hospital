import 'package:delta_hospital/app/app.dart';
import 'package:delta_hospital/app/cubit/variable_state_cubit.dart';
import 'package:delta_hospital/app/widgets/common_drop_down.dart';
import 'package:delta_hospital/app/widgets/common_elevated_button.dart';
import 'package:delta_hospital/app/widgets/common_text_field_widget.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/presentations/items_booking/data/models/item_type_list_response.dart';
import 'package:delta_hospital/presentations/items_booking/views/cart/cart_page.dart';
import 'package:delta_hospital/presentations/items_booking/views/item_list/bloc/cart_bloc.dart';
import 'package:delta_hospital/presentations/items_booking/views/item_list/bloc/item_list_grid_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/widgets/common_loading.dart';
import 'bloc/item_type_bloc.dart';

class ItemListView extends StatefulWidget {
  const ItemListView({super.key});

  @override
  State<ItemListView> createState() => _ItemListViewState();
}

class _ItemListViewState extends State<ItemListView> {
  final _itemsScrollController = ScrollController();
  late TextEditingController _searchController;
  @override
  void initState() {
    context.read<CartBloc>().add(CartItemsGet());
    context.read<ItemTypeBloc>().add(GetItemTypeEvent());
    context.read<ItemGridBloc>().add(GetItemGridEvent());

    _itemsScrollController.addListener(() {
      if (_itemsScrollController.position.pixels ==
          _itemsScrollController.position.maxScrollExtent) {
        var length = context.read<VariableStateCubit<int>>().state!;
        context.read<VariableStateCubit<int>>().update(length + 10);
        _fetchItemList();
      }
    });
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _itemsScrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _fetchItemList() {
    var selectedDepartment = context.read<VariableStateCubit<ItemType>>().state;
    var length = context.read<VariableStateCubit<int>>().state!;
    context.read<ItemGridBloc>().add(GetItemGridEvent(
          length: length,
          searchValue: _searchController.text,
          itemTypeNo: selectedDepartment?.id,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            CommonTextFieldWidget(
              controller: _searchController,
              hintText: "Search",
              onChanged: (value) {
                var itemTypeNo =
                    context.read<VariableStateCubit<ItemType>>().state?.id;
                context.read<ItemGridBloc>().add(
                      GetItemGridEvent(
                        searchValue: value,
                        itemTypeNo: itemTypeNo,
                      ),
                    );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: BlocBuilder<ItemTypeBloc, ItemTypeState>(
                    builder: (context, state) {
                      return CommonDropdownButton<ItemType>(
                        hintText: "Select Item Type",
                        value:
                            context.watch<VariableStateCubit<ItemType>>().state,
                        reset: () {
                          context.read<VariableStateCubit<int>>().update(10);
                          context.read<VariableStateCubit<ItemType>>().reset();
                          context.read<ItemGridBloc>().add(
                                GetItemGridEvent(
                                  searchValue: _searchController.text,
                                ),
                              );
                        },
                        onChanged: (value) {
                          if (value != null) {
                            context
                                .read<VariableStateCubit<ItemType>>()
                                .update(value);
                            context.read<VariableStateCubit<int>>().update(10);
                            _fetchItemList();
                            // context.read<ItemGridBloc>().add(
                            //       GetItemGridEvent(
                            //         searchValue: _searchController.text,
                            //         itemTypeNo: value.id,
                            //       ),
                            //     );
                          }
                        },
                        items:
                            state is ItemTypeSuccess ? state.itemTypeList : [],
                      );
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    context.pushNamed(CartPage.routeName,
                        extra: {"context": context});
                  },
                  child: BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      return Badge(
                        label: state is CartSuccess
                            ? Text(state.cartList.length.toString())
                            : const Text('0'),
                        backgroundColor: Colors.red,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: appTheme.secondary,
                          ),
                          child: Icon(
                            Icons.shopping_cart,
                            color: appTheme.white,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: BlocBuilder<ItemGridBloc, ItemGridState>(
                builder: (context, state) {
                  if (state.isLoading && state.itemGridList.data == null) {
                    return const CommonLoading();
                  }
                  if (state.itemGridList.data != null) {
                    return CustomScrollView(
                      controller: _itemsScrollController,
                      physics: const BouncingScrollPhysics(),
                      slivers: [
                        SliverList.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                          itemCount: state.itemGridList.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            var item = state.itemGridList.data?[index];

                            return Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey.shade200,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item?.itemName ?? "",
                                              style: lightTextTheme.bodyMedium!
                                                  .copyWith(),
                                            ),
                                            Text(
                                              item?.itemTypeName ?? "",
                                              style: lightTextTheme.bodySmall!
                                                  .copyWith(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CommonElevatedButton(
                                        lable: "Add",
                                        onPressed: () {
                                          if (item != null) {
                                            context.read<CartBloc>().add(
                                                  CartItemAdd(
                                                    itemInfo: item,
                                                  ),
                                                );
                                          }
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                        if (state.isLoading)
                          const SliverToBoxAdapter(
                            child: SizedBox(
                              height: 64,
                              child: CommonLoading(),
                            ),
                          ),
                      ],
                    );
                  }
                  return Container();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
// ListView.separated(
//                     separatorBuilder: (context, index) => const SizedBox(
//                       height: 10,
//                     ),
//                     itemCount: state.itemGridList.data?.length ?? 0,
//                     itemBuilder: (context, index) {
//                       var item = state.itemGridList.data?[index];
//                       return Container(
//                         padding: const EdgeInsets.all(8),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8),
//                           color: Colors.grey.shade200,
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 Expanded(
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         item?.itemName ?? "",
//                                         style: lightTextTheme.bodyMedium!
//                                             .copyWith(),
//                                       ),
//                                       Text(
//                                         item?.itemTypeName ?? "",
//                                         style:
//                                             lightTextTheme.bodySmall!.copyWith(
//                                           color: Colors.grey,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 10,
//                                 ),
//                                 CommonElevatedButton(
//                                   lable: "Add",
//                                   onPressed: () {},
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                       );
//                     },
//                   );
