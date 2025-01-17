import 'package:delta_hospital/app/bloc/app_reg_bloc.dart';
import 'package:delta_hospital/app/cubit/logged_app_user_cubit.dart';
import 'package:delta_hospital/app/cubit/variable_state_cubit.dart';
import 'package:delta_hospital/app/data/models/app_login_response.dart';
import 'package:delta_hospital/app/widgets/app_snack_bar.dart';
import 'package:delta_hospital/app/widgets/common_drop_down.dart';
import 'package:delta_hospital/app/widgets/common_text_field_widget.dart';

import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/core/utils/enums.dart';
import 'package:delta_hospital/core/utils/image_constant.dart';
import 'package:delta_hospital/features/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:delta_hospital/core/extentions/extentations.dart';

class AppRegistrationView extends StatefulWidget {
  const AppRegistrationView({super.key});

  @override
  State<AppRegistrationView> createState() => _AppRegistrationViewState();
}

class _AppRegistrationViewState extends State<AppRegistrationView> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _fullAddressController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late FocusNode _firstNameFocusNode;
  late FocusNode _lastNameFocusNode;
  late FocusNode _phoneFocusNode;
  late FocusNode _emailFocusNode;
  late FocusNode _fullAddressFocusNode;
  late FocusNode _passwordFocusNode;
  late FocusNode _confirmPasswordFocusNode;
  @override
  void initState() {
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _fullAddressController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _firstNameFocusNode = FocusNode();
    _lastNameFocusNode = FocusNode();
    _phoneFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _fullAddressFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _fullAddressController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _phoneFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<AppRegBloc, AppRegState>(
        listener: (context, state) {
          if (state is AppRegSuccess) {
            _firstNameController.clear();
            _lastNameController.clear();
            _phoneController.clear();
            _emailController.clear();
            _fullAddressController.clear();
            _passwordController.clear();
            _confirmPasswordController.clear();
            _fullAddressController.clear();
            context.read<VariableStateCubit<Gender>>().reset();
            context.read<VariableStateCubit<DateTime>>().reset();
            _formKey.currentState?.reset();
            context
                .read<LoggedAppUserCubit>()
                .setLoggedAppUser(userDetails: state.userDetails);
            context.goNamed(HomePage.routeName);
          }
          if (state is AppRegError) {
            AppSnackBar.showSnackBar(
              context: context,
              message: "Registration Failed",
              type: SnackBarType.error,
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2 +
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
                            "Registration",
                            style: lightTextTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w700,
                              color: appTheme.primary,
                            ),
                          ),
                          Text(
                            "Please Register To Continue",
                            style: lightTextTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Image.asset(
                            height: 100,
                            width: 150,
                            ImageConstant.loginImage,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: CommonTextFieldWidget(
                                    controller: _firstNameController,
                                    focusNode: _firstNameFocusNode,
                                    hintText: "First Name",
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your first name';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: CommonTextFieldWidget(
                                    controller: _lastNameController,
                                    focusNode: _lastNameFocusNode,
                                    hintText: "Last Name",
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your last name';
                                      }
                                      return null;
                                    },
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: CommonTextFieldWidget(
                                    controller: _phoneController,
                                    focusNode: _phoneFocusNode,
                                    hintText: "Mobile Number",
                                    keyboardType: TextInputType.phone,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your mobile number';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: CommonTextFieldWidget(
                                    controller: _emailController,
                                    focusNode: _emailFocusNode,
                                    keyboardType: TextInputType.emailAddress,
                                    hintText: "Email Address",
                                    validator: (value) {
                                      if (value == null ||
                                          value.isEmpty ||
                                          !value.contains("@")) {
                                        return 'Please enter your email address correctly';
                                      }
                                      return null;
                                    },
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CommonDropdownButton<Gender>(
                              hintText: "Gender",
                              value: context
                                  .watch<VariableStateCubit<Gender>>()
                                  .state,
                              items: Gender.values.toList(),
                              onChanged: (value) {
                                context
                                    .read<VariableStateCubit<Gender>>()
                                    .update(value!);
                              },
                              validator: (value) {
                                if (value == null) {
                                  return 'Please select your gender';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 35,
                              decoration: BoxDecoration(
                                color: appTheme.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: appTheme.primary,
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          bottomLeft: Radius.circular(8),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Date of Birth",
                                          style: lightTextTheme.bodyMedium!
                                              .copyWith(
                                            color: appTheme.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            context
                                                    .watch<
                                                        VariableStateCubit<
                                                            DateTime>>()
                                                    .state
                                                    ?.toFormatedString(
                                                        "dd-MM-yyyy") ??
                                                "Please Select Date",
                                            style: lightTextTheme.bodyMedium!
                                                .copyWith(
                                              color: appTheme.primary,
                                            ),
                                          ),
                                          const Spacer(),
                                          IconButton(
                                            onPressed: () async {
                                              var date = context
                                                  .read<
                                                      VariableStateCubit<
                                                          DateTime>>()
                                                  .state;
                                              var selectedDate =
                                                  await showDatePicker(
                                                context: context,
                                                firstDate: DateTime(1900),
                                                lastDate: DateTime(
                                                    DateTime.now().year,
                                                    DateTime.now().month,
                                                    DateTime.now().day),
                                                initialDate: date,
                                              );
                                              if (selectedDate != null &&
                                                  context.mounted) {
                                                context
                                                    .read<
                                                        VariableStateCubit<
                                                            DateTime>>()
                                                    .update(selectedDate);
                                              }
                                            },
                                            icon: Icon(
                                              size: 20,
                                              color: appTheme.primary,
                                              Icons.calendar_today_outlined,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            BlocBuilder<VariableStateCubit<DateTime>,
                                DateTime?>(
                              builder: (context, state) {
                                if (state != null) {
                                  return Row(
                                    children: [
                                      Expanded(
                                        child: CommonTextFieldWidget(
                                          controller: TextEditingController(
                                            text: context
                                                .watch<
                                                    VariableStateCubit<
                                                        DateTime>>()
                                                .state!
                                                .calculateAge()[0]
                                                .toString(),
                                          ),
                                          readOnly: true,
                                          hintText: "Year",
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: CommonTextFieldWidget(
                                          controller: TextEditingController(
                                            text: context
                                                .watch<
                                                    VariableStateCubit<
                                                        DateTime>>()
                                                .state!
                                                .calculateAge()[1]
                                                .toString(),
                                          ),
                                          readOnly: true,
                                          hintText: "Month",
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: CommonTextFieldWidget(
                                          controller: TextEditingController(
                                            text: context
                                                .watch<
                                                    VariableStateCubit<
                                                        DateTime>>()
                                                .state!
                                                .calculateAge()[2]
                                                .toString(),
                                          ),
                                          readOnly: true,
                                          hintText: "Days",
                                        ),
                                      ),
                                    ],
                                  );
                                }
                                return const SizedBox.shrink();
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CommonTextFieldWidget(
                              controller: _fullAddressController,
                              focusNode: _fullAddressFocusNode,
                              hintText: "Full Address",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter full address';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CommonTextFieldWidget(
                              controller: _passwordController,
                              focusNode: _passwordFocusNode,
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
                              hintText: "Password",
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter password';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CommonTextFieldWidget(
                              controller: _confirmPasswordController,
                              focusNode: _confirmPasswordFocusNode,
                              obscureText: context
                                  .watch<VariableStateCubit<bool>>()
                                  .state!,
                              // suffix: GestureDetector(
                              //   onTap: () {
                              //     context
                              //         .read<VariableStateCubit<bool>>()
                              //         .update(!context
                              //             .read<VariableStateCubit<bool>>()
                              //             .state!);
                              //   },
                              //   child: Icon(
                              //     context
                              //             .watch<VariableStateCubit<bool>>()
                              //             .state!
                              //         ? Icons.remove_red_eye_outlined
                              //         : Icons.remove_red_eye_sharp,
                              //     color: appTheme.primary,
                              //   ),
                              // ),
                              hintText: "Confirm Password",
                              validator: (value) {
                                if (_passwordController.text != value) {
                                  return 'Password does not match';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            BlocBuilder<AppRegBloc, AppRegState>(
                              builder: (context, state) {
                                return SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.85,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      var selectedDate = context
                                          .read<VariableStateCubit<DateTime>>()
                                          .state;
                                      if (_formKey.currentState!.validate()) {
                                        if (selectedDate == null) {
                                          AppSnackBar.showSnackBar(
                                            context: context,
                                            message:
                                                "Please select date of birth",
                                            type: SnackBarType.warning,
                                          );

                                          return;
                                        }
                                        AppUserDetails userDetails =
                                            AppUserDetails(
                                          firstName: _firstNameController.text,
                                          lastName: _lastNameController.text,
                                          phone: _phoneController.text,
                                          email: _emailController.text,
                                          gender: context
                                              .read<
                                                  VariableStateCubit<Gender>>()
                                              .state!
                                              .value,
                                          password: _passwordController.text,
                                          dateOfBirth: selectedDate
                                              .toFormatedString('yyyy-MM-dd'),
                                          fullAddress:
                                              _fullAddressController.text,
                                          ageDay:
                                              selectedDate.calculateAge()[2],
                                          ageMonth:
                                              selectedDate.calculateAge()[1],
                                          ageYear:
                                              selectedDate.calculateAge()[0],
                                          userImage: null,
                                          mrn: "",
                                          userId: "",
                                          deviceId: "",
                                          activeStatus: 1,
                                          division: "",
                                          birthCertificate: "",
                                          documentId: 0,
                                          entityName: "",
                                          passportNumber: "",
                                          nationalId: "",
                                          ssCreatedOn: "",
                                          ssModifiedOn: "",
                                        );
                                        context.read<AppRegBloc>().add(
                                            AppRegistration(
                                                userDetails: userDetails));
                                      }
                                    },
                                    child: Text(
                                      state is AppRegLoading
                                          ? "Registering..."
                                          : "Register",
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
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
