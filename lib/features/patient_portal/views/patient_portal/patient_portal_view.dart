import 'package:delta_hospital/app/bloc/his_login_bloc.dart';
import 'package:delta_hospital/app/cubit/cubit/logged_his_user_cubit.dart';

import 'package:delta_hospital/app/widgets/common_appbar.dart';
import 'package:delta_hospital/app/widgets/common_elevated_button.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/core/utils/image_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../patient_portal_dashboard.dart';

class PatientPortalView extends StatefulWidget {
  const PatientPortalView({super.key});

  @override
  State<PatientPortalView> createState() => _PatientPortalViewState();
}

class _PatientPortalViewState extends State<PatientPortalView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(),
      body: BlocListener<HisLoginBloc, HisLoginState>(
        listener: (context, state) {
          if (state is HisLoginInitial) {
            context.read<LoggedHisUserCubit>().resetState();
            context.pushReplacementNamed(PatPortalDashboardPage.routeName);
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Patient Name"),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Miraj Hossain Shawon"),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Hospital Id"),
                        SizedBox(
                          width: 5,
                        ),
                        Text("123456789"),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Age"),
                        SizedBox(
                          width: 5,
                        ),
                        Text("23"),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Gender"),
                        SizedBox(
                          width: 5,
                        ),
                        Text("M"),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.085,
              ),
              GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  mainAxisExtent: MediaQuery.of(context).size.height * 0.12,
                ),
                children: [
                  PatPortalGridWidget(
                    lable: "Medical Record",
                    image: ImageConstant.medicalRecord,
                    onTap: () {},
                  ),
                  PatPortalGridWidget(
                    lable: "Prescription",
                    image: ImageConstant.prescription,
                    onTap: () {},
                  ),
                  PatPortalGridWidget(
                    lable: "Invoice",
                    image: ImageConstant.invoice,
                    onTap: () {},
                  ),
                  PatPortalGridWidget(
                    lable: "Notes",
                    image: ImageConstant.stickyNotes,
                    onTap: () {},
                  )
                ],
              ),
              CommonElevatedButton(
                lable: "Logout",
                backgroundColor: Colors.red,
                onPressed: () {
                  context.read<HisLoginBloc>().add(HisLogout());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PatPortalGridWidget extends StatelessWidget {
  const PatPortalGridWidget({
    super.key,
    required this.lable,
    required this.image,
    this.onTap,
  });
  final String lable;
  final String image;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                height: 50,
                width: 50,
                image,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                lable,
                style: lightTextTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
