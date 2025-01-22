import 'package:delta_hospital/app/app.dart';
import 'package:delta_hospital/app/bloc/his_auth_bloc.dart';
import 'package:delta_hospital/app/cubit/logged_his_user_cubit.dart';
import 'package:delta_hospital/app/cubit/variable_state_cubit.dart';
import 'package:delta_hospital/app/widgets/common_text_field_widget.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/core/utils/image_constant.dart';
import 'package:delta_hospital/features/management/views/dashboard/management_dashboard_page.dart';
import 'package:delta_hospital/features/patient_portal/views/patient_portal/patient_portal_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MngLoginView extends StatefulWidget {
  const MngLoginView({super.key});

  @override
  State<MngLoginView> createState() => _MngLoginViewState();
}

class _MngLoginViewState extends State<MngLoginView> {
  late TextEditingController _userNameController;
  late TextEditingController _passwordController;
  late FocusNode _userNameFocusNode;
  late FocusNode _passwordFocusNode;
  late GlobalKey<FormState> _formKey;
  void initState() {
    _userNameController = TextEditingController();
    _passwordController = TextEditingController();
    _userNameFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    _userNameFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CommonAppbar(),
      body: BlocListener<HisAuthBloc, HisAuthState>(
        listener: (context, state) {
          if (state is HisAuthLoggedIn) {
            _userNameController.clear();
            _passwordController.clear();
            context.read<LoggedHisUserCubit>().setLoggedUser(
                  userDetails: state.userDetails,
                );
            context.pushReplacementNamed(ManagementDashboardPage.routeName);
          }
        },
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.78,
              decoration: BoxDecoration(
                color: appTheme.white,
              ),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: double.infinity,
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
                        Text(
                          "Login",
                          style: lightTextTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: appTheme.primary,
                          ),
                        ),
                        Text(
                          "Please Login to Continue",
                          style: lightTextTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Image.asset(
                          height: 150,
                          width: 150,
                          ImageConstant.loginImage,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: CommonTextFieldWidget(
                              controller: _userNameController,
                              focusNode: _userNameFocusNode,
                              hintText: "User Name",
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter your user name";
                                }
                                return null;
                              }),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: CommonTextFieldWidget(
                              controller: _passwordController,
                              focusNode: _passwordFocusNode,
                              hintText: "Password",
                              obscureText: context
                                  .watch<VariableStateCubit<bool>>()
                                  .state!,
                              suffix: GestureDetector(
                                onTap: () {
                                  context
                                      .read<VariableStateCubit<bool>>()
                                      .update(!context
                                          .read<VariableStateCubit<bool>>()
                                          .state!);
                                },
                                child: Icon(
                                  context
                                          .watch<VariableStateCubit<bool>>()
                                          .state!
                                      ? Icons.remove_red_eye_outlined
                                      : Icons.remove_red_eye_sharp,
                                  color: appTheme.primary,
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter your password";
                                }
                                return null;
                              }),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        BlocBuilder<HisAuthBloc, HisAuthState>(
                          builder: (context, state) {
                            return SizedBox(
                              width: MediaQuery.of(context).size.width * 0.85,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<HisAuthBloc>().add(
                                          HisLogin(
                                            username: _userNameController.text,
                                            password: _passwordController.text,
                                          ),
                                        );
                                  }
                                },
                                child: Text(
                                  state is HisAuthLoading
                                      ? "Logging In..."
                                      : "Login",
                                  style: lightTextTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: appTheme.white,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
