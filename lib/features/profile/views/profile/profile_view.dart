import 'package:delta_hospital/app/app.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.75,
            decoration: BoxDecoration(
              color: appTheme.white,
            ),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    color: appTheme.skyBlue,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.all(2),
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                          color: appTheme.primary,
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: appTheme.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Shahidul Islam",
                        style: lightTextTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: appTheme.primary,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "H12345675",
                        style: lightTextTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: appTheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Wrap(
                      spacing: 80,
                      runSpacing: 20,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: appTheme.primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: appTheme.primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: appTheme.primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: appTheme.primary,
                            shape: BoxShape.circle,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
