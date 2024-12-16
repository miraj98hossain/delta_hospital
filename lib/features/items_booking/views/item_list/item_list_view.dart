import 'package:delta_hospital/app/app.dart';
import 'package:delta_hospital/app/widgets/common_drop_down.dart';
import 'package:delta_hospital/app/widgets/common_elevated_button.dart';
import 'package:delta_hospital/app/widgets/common_text_field_widget.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/features/items_booking/views/cart/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemListView extends StatefulWidget {
  const ItemListView({super.key});

  @override
  State<ItemListView> createState() => _ItemListViewState();
}

class _ItemListViewState extends State<ItemListView> {
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
            const CommonTextFieldWidget(
              hintText: "Search",
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: CommonDropdownButton(
                    hintText: "Select Item Type",
                    onChanged: (value) {},
                    items: List.generate(20, (index) => index),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    context.pushNamed(CartPage.routeName);
                  },
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
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemCount: 20,
              itemBuilder: (context, index) {
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
                            child: Text(
                              "Drain Fluid For Bilirubin",
                              style: lightTextTheme.bodyMedium!.copyWith(),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CommonElevatedButton(
                            lable: "Add",
                            onPressed: () {},
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
