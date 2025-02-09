import 'package:delta_hospital/app/bloc/app_auth_bloc.dart';
import 'package:delta_hospital/app/cubit/logged_app_user_cubit.dart';
import 'package:delta_hospital/app/data/models/app_login_response.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/dependency_injector/di_container.dart';
import 'package:delta_hospital/features/on_boarding/views/on_boarding/on_boarding_page.dart';
import 'package:delta_hospital/features/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CommonDrawer extends StatefulWidget {
  const CommonDrawer({
    super.key,
  });

  @override
  State<CommonDrawer> createState() => _CommonDrawerState();
}

class _CommonDrawerState extends State<CommonDrawer> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppAuthBloc(getService()),
      child: BlocListener<AppAuthBloc, AppAuthState>(
        listener: (context, state) {
          if (state is AppAuthLoggedOut) {
            context.goNamed(OnBoardingPage.routeName);
          }
        },
        child: Drawer(
          backgroundColor: appTheme.skyBlue,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).viewPadding.top,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: appTheme.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: BlocBuilder<LoggedAppUserCubit, AppUserDetails?>(
                    builder: (context, state) {
                      return Row(
                        spacing: 10,
                        children: [
                          Container(
                            height: 65,
                            width: 65,
                            decoration: BoxDecoration(
                              color: appTheme.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state?.firstName ?? "",
                                style: lightTextTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: appTheme.white),
                              ),
                              Text(
                                state?.mrn ?? "",
                                style: lightTextTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: appTheme.white),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "General",
                  style: lightTextTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: appTheme.primary,
                  ),
                ),
                Divider(
                  height: 10,
                  thickness: 0.5,
                  color: appTheme.primary,
                  indent: 0,
                  endIndent: 5,
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  spacing: 10,
                  children: [
                    DrawerItem(
                      title: "My Cart(0)",
                      icon: Icons.shopping_cart_outlined,
                      onTap: () {},
                    ),
                    DrawerItem(
                      title: "Profile",
                      icon: Icons.person_2_outlined,
                      onTap: () {
                        context.pushNamed(ProfilePage.routeName);
                      },
                    ),
                    DrawerItem(
                      title: "Reminder Service",
                      icon: Icons.notifications_outlined,
                      onTap: () {},
                    ),
                    DrawerItem(
                      title: "Emergency Contact",
                      icon: Icons.support_agent_outlined,
                      onTap: () {},
                    ),
                    DrawerItem(
                      title: "Hospital Information",
                      icon: Icons.error_outline,
                      onTap: () {},
                    ),
                    DrawerItem(
                      title: "Privacy Policy",
                      icon: Icons.privacy_tip_outlined,
                      onTap: () {},
                    ),
                  ],
                ),
                const Spacer(),
                BlocBuilder<AppAuthBloc, AppAuthState>(
                  builder: (context, state) {
                    if (state is AppAuthLoading) {
                      return const CircularProgressIndicator();
                    }
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      spacing: 10,
                      children: [
                        Text(
                          "Logout",
                          style: lightTextTheme.bodyMedium!.copyWith(
                            color: appTheme.primary,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.read<AppAuthBloc>().add(AppLogout());
                          },
                          child: Icon(
                            Icons.logout,
                            color: appTheme.primary,
                            size: 20,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).viewPadding.bottom,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });
  final String title;
  final IconData icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 10,
            children: [
              Icon(
                icon,
                color: appTheme.primary,
              ),
              Text(
                title,
                style: lightTextTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: appTheme.primary,
                ),
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: appTheme.primary,
            size: 15,
          ),
        ],
      ),
    );
  }
}
