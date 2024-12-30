import 'package:delta_hospital/app/bloc/his_login_bloc.dart';
import 'package:delta_hospital/app/cubit/logged_his_user_cubit.dart';
import 'package:delta_hospital/app/widgets/common_text_field_widget.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/core/utils/image_constant.dart';
import 'package:delta_hospital/features/patient_portal/patient_portal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PatPortalLoginView extends StatefulWidget {
  const PatPortalLoginView({super.key});

  @override
  State<PatPortalLoginView> createState() => _PatPortalLoginViewState();
}

class _PatPortalLoginViewState extends State<PatPortalLoginView> {
  late TextEditingController _userNameController;
  late TextEditingController _passwordController;
  late FocusNode _userNameFocusNode;
  late FocusNode _passwordFocusNode;
  late GlobalKey<FormState> _formKey;
  @override
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
      body: BlocListener<HisLoginBloc, HisLoginState>(
        listener: (context, state) {
          if (state is HisLoginSuccess) {
            _userNameController.clear();
            _passwordController.clear();
            context
                .read<LoggedHisUserCubit>()
                .setLoggedUser(userDetails: state.userDetails);
            context.pushReplacementNamed(PatientPortalPage.routeName);
          }
        },
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.88,
              decoration: BoxDecoration(
                color: appTheme.white,
              ),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3 +
                        MediaQuery.of(context).viewPadding.top,
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
                        SizedBox(
                          height: MediaQuery.of(context).viewPadding.top,
                        ),
                        Text(
                          "Login",
                          style: lightTextTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: appTheme.primary,
                          ),
                        ),
                        Text(
                          "Please Login To Continue",
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
                              hintText: "Hospital Number",
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter your hospital number";
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
                        BlocBuilder<HisLoginBloc, HisLoginState>(
                          builder: (context, state) {
                            return SizedBox(
                              width: MediaQuery.of(context).size.width * 0.85,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<HisLoginBloc>().add(
                                          HisLogin(
                                            username: _userNameController.text,
                                            password: _passwordController.text,
                                          ),
                                        );
                                  }
                                },
                                child: Text(
                                  state is HisLoginLoading
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
