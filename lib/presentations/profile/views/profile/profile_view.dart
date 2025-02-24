import 'package:delta_hospital/app/app.dart';
import 'package:delta_hospital/app/bloc/app_auth_bloc.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/presentations/on_boarding/views/on_boarding/on_boarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
          BlocListener<AppAuthBloc, AppAuthState>(
            listener: (context, state) {
              if (state is AppAuthLoggedOut) {
                context.goNamed(OnBoardingPage.routeName);
              }
            },
            child: Container(
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
                        Stack(
                          children: [
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
                            Positioned(
                              bottom: 0,
                              right: 10,
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  color: appTheme.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  color: appTheme.primary,
                                  size: 15,
                                ),
                              ),
                            ),
                          ],
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
                        spacing: 70,
                        runSpacing: 20,
                        children: [
                          Column(
                            spacing: 5,
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: appTheme.skyBlue,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.person_add_alt_1_outlined,
                                  size: 30,
                                  color: appTheme.primary,
                                ),
                              ),
                              Text(
                                "Add \nFamily HN",
                                textAlign: TextAlign.center,
                                style: lightTextTheme.bodySmall!.copyWith(
                                  color: appTheme.primary,
                                ),
                              )
                            ],
                          ),
                          Column(
                            spacing: 5,
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: appTheme.skyBlue,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.lock_open_sharp,
                                  size: 30,
                                  color: appTheme.primary,
                                ),
                              ),
                              Text(
                                "Change \nPassword",
                                textAlign: TextAlign.center,
                                style: lightTextTheme.bodySmall!.copyWith(
                                  color: appTheme.primary,
                                ),
                              )
                            ],
                          ),
                          Column(
                            spacing: 5,
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: appTheme.skyBlue,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.privacy_tip_outlined,
                                  size: 30,
                                  color: appTheme.primary,
                                ),
                              ),
                              Text(
                                "Privacy \nPolicy",
                                textAlign: TextAlign.center,
                                style: lightTextTheme.bodySmall!.copyWith(
                                  color: appTheme.primary,
                                ),
                              )
                            ],
                          ),
                          Column(
                            spacing: 5,
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: appTheme.skyBlue,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.share_outlined,
                                  size: 30,
                                  color: appTheme.primary,
                                ),
                              ),
                              Text(
                                "Invite \nFriends",
                                textAlign: TextAlign.center,
                                style: lightTextTheme.bodySmall!.copyWith(
                                  color: appTheme.primary,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const Spacer(),
          BlocBuilder<AppAuthBloc, AppAuthState>(
            builder: (context, state) {
              if (state is AppAuthLoading) {
                return const CircularProgressIndicator();
              }
              return Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Text(
                      "Logout",
                      style: lightTextTheme.bodyMedium!.copyWith(
                        color: appTheme.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<AppAuthBloc>().add(AppLogout());
                      },
                      child: Icon(
                        Icons.logout,
                        color: appTheme.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).viewPadding.bottom,
          ),
        ],
      ),
    );
  }
}
