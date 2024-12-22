import 'package:delta_hospital/app/app.dart';
import 'package:delta_hospital/app/widgets/common_elevated_button.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FamilyListView extends StatefulWidget {
  const FamilyListView({super.key});

  @override
  State<FamilyListView> createState() => _FamilyListViewState();
}

class _FamilyListViewState extends State<FamilyListView> {
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
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: 15,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: appTheme.white,
                      borderRadius: const BorderRadius.horizontal(
                        right: Radius.circular(8),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 20,
                                  decoration: BoxDecoration(
                                    color: appTheme.secondary,
                                    borderRadius: const BorderRadius.horizontal(
                                      right: Radius.circular(3),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                        "Miraj Hossain Shawon"),
                                                    Text("Brother"),
                                                  ],
                                                ),
                                              ),
                                              IconButton.filled(
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.more_vert,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CommonElevatedButton(
              lable: "Add Family Member",
              backgroundColor: appTheme.secondary,
              onPressed: () {},
            ),
            SizedBox(
              height: MediaQuery.of(context).viewPadding.bottom,
            ),
          ],
        ),
      ),
    );
  }
}
