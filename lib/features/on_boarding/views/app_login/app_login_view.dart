import 'package:delta_hospital/app/bloc/app_auth_bloc.dart';
import 'package:delta_hospital/app/cubit/logged_app_user_cubit.dart';
import 'package:delta_hospital/app/cubit/variable_state_cubit.dart';
import 'package:delta_hospital/app/widgets/common_text_field_widget.dart';
import 'package:delta_hospital/app/widgets/custom_snackBar_widget.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/core/utils/image_constant.dart';
import 'package:delta_hospital/features/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppLoginView extends StatefulWidget {
  const AppLoginView({super.key});

  @override
  State<AppLoginView> createState() => _AppLoginViewState();
}

class _AppLoginViewState extends State<AppLoginView> {
  late TextEditingController phoneNumberController;
  late TextEditingController passwordController;
  late FocusNode phoneNumberFocusNode;
  late FocusNode passwordFocusNode;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    phoneNumberController = TextEditingController();
    passwordController = TextEditingController();
    phoneNumberFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    passwordController.dispose();
    phoneNumberFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<AppAuthBloc, AppAuthState>(
        listener: (context, state) {
          if (state is AppAuthLoggedIn) {
            passwordController.clear();
            phoneNumberController.clear();
            phoneNumberFocusNode.unfocus();
            passwordFocusNode.unfocus();
            _formKey.currentState?.reset();
            context
                .read<LoggedAppUserCubit>()
                .setLoggedAppUser(userDetails: state.userDetails);
            context.goNamed(HomePage.routeName);
          }
          if (state is AppAuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              CustomSnackBar.errorSnackber(message: "Invalid Credentials"),
            );
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
                          "Please Sign In To Continue",
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
                            controller: phoneNumberController,
                            focusNode: phoneNumberFocusNode,
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter mobile number";
                              }
                              return null;
                            },
                            hintText: "Mobile Number",
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: CommonTextFieldWidget(
                            obscureText: context
                                .watch<VariableStateCubit<bool>>()
                                .state!,
                            suffix: GestureDetector(
                              onTap: () {
                                context.read<VariableStateCubit<bool>>().update(
                                    !context
                                        .read<VariableStateCubit<bool>>()
                                        .state!);
                              },
                              child: Icon(
                                context.watch<VariableStateCubit<bool>>().state!
                                    ? Icons.remove_red_eye_outlined
                                    : Icons.remove_red_eye_sharp,
                                color: appTheme.primary,
                              ),
                            ),
                            controller: passwordController,
                            focusNode: passwordFocusNode,
                            hintText: "Password",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter password";
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        BlocBuilder<AppAuthBloc, AppAuthState>(
                          builder: (context, state) {
                            return SizedBox(
                              width: MediaQuery.of(context).size.width * 0.85,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<AppAuthBloc>().add(AppLogin(
                                        username: phoneNumberController.text,
                                        password: passwordController.text));
                                    // context.goNamed(HomeRoute.name);
                                  }
                                },
                                child: Text(
                                  state is AppAuthLoading
                                      ? "Logging in..."
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
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
