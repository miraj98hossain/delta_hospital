import 'package:delta_hospital/app/bloc/pat_relation_list_bloc.dart';
import 'package:delta_hospital/app/cubit/variable_state_cubit.dart';
import 'package:delta_hospital/app/widgets/app_snack_bar.dart';
import 'package:delta_hospital/app/widgets/common_drop_down.dart';
import 'package:delta_hospital/app/widgets/common_elevated_button.dart';
import 'package:delta_hospital/app/widgets/common_text_field_widget.dart';
import 'package:delta_hospital/core/extentions/extentations.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/core/utils/enums.dart';
import 'package:delta_hospital/data/models/app_login_response.dart';
import 'package:delta_hospital/data/models/hn_registration.dart';
import 'package:delta_hospital/data/models/patient_relation_list_response.dart';
import 'package:delta_hospital/presentations/hn_registration/views/hn_registration/bloc/hn_reg_fee_bloc.dart';
import 'package:delta_hospital/presentations/hn_registration/views/hn_registration/bloc/request_hn_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegTab extends StatefulWidget {
  const RegTab({
    super.key,
  });

  @override
  State<RegTab> createState() => _RegTabState();
}

class _RegTabState extends State<RegTab> {
  late AppUserDetails loggedAppUser;
  late TextEditingController _fnameController;
  late TextEditingController _lnameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _addressController;
  late FocusNode _fnameFocusNode;
  late FocusNode _lnameFocusNode;
  late FocusNode _phoneFocusNode;
  late FocusNode _emailFocusNode;
  late FocusNode _addressFocusNode;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _fnameController = TextEditingController();
    _lnameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _addressController = TextEditingController();
    _fnameFocusNode = FocusNode();
    _lnameFocusNode = FocusNode();
    _phoneFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _addressFocusNode = FocusNode();
    _formKey = GlobalKey<FormState>();
    context.read<HnRegFeeBloc>().add(HnRegFeeGet());
    super.initState();
  }

  @override
  void dispose() {
    _fnameController.dispose();
    _lnameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _addressController.dispose();

    _fnameFocusNode.dispose();
    _lnameFocusNode.dispose();
    _phoneFocusNode.dispose();
    _emailFocusNode.dispose();
    _addressFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocListener<RequestHnBloc, RequestHnState>(
        listener: (context, state) {
          if (state is RequestHnSuccess) {
            _fnameController.clear();
            _lnameController.clear();
            _phoneController.clear();
            _emailController.clear();
            _addressController.clear();
            _formKey.currentState?.reset();
            context.read<VariableStateCubit<Gender>>().reset();
            context.read<VariableStateCubit<BloodGroup>>().reset();
            context.read<VariableStateCubit<DateTime>>().reset();
            context.read<VariableStateCubit<PatientRelation>>().reset();

            AppSnackBar.showSnackBar(
              context: context,
              message: "Your request has been submitted successfully",
              type: SnackBarType.success,
            );
          }
          if (state is RequestHnError) {
            AppSnackBar.showSnackBar(
              context: context,
              message: state.error.toString(),
              type: SnackBarType.error,
            );
          }
        },
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "First Name*",
                style: lightTextTheme.bodyMedium!.copyWith(
                  color: appTheme.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CommonTextFieldWidget(
                controller: _fnameController,
                focusNode: _fnameFocusNode,
                hintText: "First Name",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Last Name*",
                style: lightTextTheme.bodyMedium!.copyWith(
                  color: appTheme.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CommonTextFieldWidget(
                controller: _lnameController,
                focusNode: _lnameFocusNode,
                hintText: "Last Name",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Number*",
                          style: lightTextTheme.bodyMedium!.copyWith(
                            color: appTheme.white,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CommonTextFieldWidget(
                          controller: _phoneController,
                          focusNode: _phoneFocusNode,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          hintText: "Patient Number",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Gender*",
                          style: lightTextTheme.bodyMedium!.copyWith(
                            color: appTheme.white,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CommonDropdownButton<Gender>(
                          hintText: "Gender",
                          value:
                              context.watch<VariableStateCubit<Gender>>().state,
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
                      ],
                    ),
                  ),
                ],
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
                          color: appTheme.secondary,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Date of Birth",
                            style: lightTextTheme.bodyMedium!.copyWith(
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
                                      .watch<VariableStateCubit<DateTime>>()
                                      .state
                                      ?.toFormatedString("dd-MM-yyyy") ??
                                  "Please Select Date",
                              style: lightTextTheme.bodyMedium!.copyWith(
                                color: appTheme.primary,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () async {
                                var date = context
                                    .read<VariableStateCubit<DateTime>>()
                                    .state;
                                var selectedDate = await showDatePicker(
                                  context: context,
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(DateTime.now().year,
                                      DateTime.now().month, DateTime.now().day),
                                  initialDate: date,
                                );
                                if (selectedDate != null && context.mounted) {
                                  context
                                      .read<VariableStateCubit<DateTime>>()
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
              BlocBuilder<VariableStateCubit<DateTime>, DateTime?>(
                builder: (context, state) {
                  if (state != null) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10,
                      children: [
                        Text(
                          "Age*",
                          style: lightTextTheme.bodyMedium!.copyWith(
                            color: appTheme.white,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CommonTextFieldWidget(
                                controller: TextEditingController(
                                  text: context
                                      .watch<VariableStateCubit<DateTime>>()
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
                                      .watch<VariableStateCubit<DateTime>>()
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
                                      .watch<VariableStateCubit<DateTime>>()
                                      .state!
                                      .calculateAge()[2]
                                      .toString(),
                                ),
                                readOnly: true,
                                hintText: "Days",
                              ),
                            ),
                          ],
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email*",
                          style: lightTextTheme.bodyMedium!.copyWith(
                            color: appTheme.white,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CommonTextFieldWidget(
                          controller: _emailController,
                          focusNode: _emailFocusNode,
                          keyboardType: TextInputType.emailAddress,
                          hintText: "Patient Email Address",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CommonDropdownButton<BloodGroup>(
                      hintText: "Blood Group",
                      value:
                          context.watch<VariableStateCubit<BloodGroup>>().state,
                      items: BloodGroup.values.toList(),
                      onChanged: (value) {
                        context
                            .read<VariableStateCubit<BloodGroup>>()
                            .update(value!);
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Please select your blood group';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Address*",
                style: lightTextTheme.bodyMedium!.copyWith(
                  color: appTheme.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CommonTextFieldWidget(
                controller: _addressController,
                focusNode: _addressFocusNode,
                hintText: "Patient Address",
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Address';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<PatRelationListBloc, PatRelationListState>(
                builder: (context, state) {
                  return CommonDropdownButton<PatientRelation>(
                    hintText: "Select Relation",
                    validator: (value) {
                      if (value == null) {
                        return "Please select relation";
                      }
                      return null;
                    },
                    value: context
                        .watch<VariableStateCubit<PatientRelation>>()
                        .state,
                    onChanged: (value) {
                      if (value != null) {
                        context
                            .read<VariableStateCubit<PatientRelation>>()
                            .update(value);
                      }
                    },
                    items: state is PatRelationListSuccess
                        ? state.patientRelationList
                        : [],
                  );
                },
              ),
              const SizedBox(
                height: 40,
              ),
              BlocBuilder<RequestHnBloc, RequestHnState>(
                builder: (context, state) {
                  return Align(
                    alignment: Alignment.center,
                    child: CommonElevatedButton(
                      lable: state is RequestHnLoading
                          ? "Please Wait..."
                          : "Proceed",
                      backgroundColor: appTheme.secondary,
                      onPressed: state is RequestHnLoading
                          ? () {}
                          : () {
                              var fee =
                                  context.read<HnRegFeeBloc>().state.regFee;
                              if (_formKey.currentState!.validate() &&
                                  context
                                          .read<VariableStateCubit<DateTime>>()
                                          .state !=
                                      null) {
                                var hnRequest = HnRegistration(
                                  firstName: _fnameController.text,
                                  lastName: _lnameController.text,
                                  email: _emailController.text,
                                  address: _addressController.text,
                                  gender: context
                                          .read<VariableStateCubit<Gender>>()
                                          .state
                                          ?.type ??
                                      "O",
                                  phone: _phoneController.text,
                                  dob: context
                                      .read<VariableStateCubit<DateTime>>()
                                      .state!
                                      .toFormatedString("yyyy-MM-dd"),
                                  ageYy: context
                                      .read<VariableStateCubit<DateTime>>()
                                      .state!
                                      .calculateAge()[0],
                                  ageMm: context
                                      .read<VariableStateCubit<DateTime>>()
                                      .state!
                                      .calculateAge()[1],
                                  ageDd: context
                                      .read<VariableStateCubit<DateTime>>()
                                      .state!
                                      .calculateAge()[2],
                                  payFlag: 1,
                                  payAmount: fee,
                                  regNo: 0,
                                  companyNo: 0,
                                  pgVendorName: "",
                                  pgORderId: "",
                                );
                                context
                                    .read<RequestHnBloc>()
                                    .add(RequestHn(hnRegistration: hnRequest));
                              }
                            },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
