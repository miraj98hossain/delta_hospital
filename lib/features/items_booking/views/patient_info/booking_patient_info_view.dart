import 'package:delta_hospital/app/app.dart';
import 'package:delta_hospital/app/bloc/added_pat_user_list_bloc.dart';
import 'package:delta_hospital/app/bloc/his_patient_info_bloc.dart';
import 'package:delta_hospital/app/cubit/logged_app_user_cubit.dart';
import 'package:delta_hospital/app/cubit/variable_state_cubit.dart';
import 'package:delta_hospital/app/data/models/app_login_response.dart';
import 'package:delta_hospital/app/data/models/his_patient_info_response.dart';
import 'package:delta_hospital/app/data/models/patient_portal_user_list_response.dart';
import 'package:delta_hospital/app/widgets/common_drop_down.dart';
import 'package:delta_hospital/app/widgets/common_elevated_button.dart';
import 'package:delta_hospital/core/extentions/extentations.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/core/utils/enums.dart';

import 'package:delta_hospital/features/items_booking/data/models/item_grid_list_response.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/widgets/common_text_field_widget.dart';

class BookingPatientInfoView extends StatefulWidget {
  const BookingPatientInfoView({super.key, required this.cartList});
  final List<ItemInfo> cartList;
  @override
  State<BookingPatientInfoView> createState() => _BookingPatientInfoViewState();
}

class _BookingPatientInfoViewState extends State<BookingPatientInfoView> {
  late AppUserDetails loggedAppUser;
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _addressController;
  late TextEditingController _dobController;
  late TextEditingController _preferredDateController;
  late TextEditingController _expectedDateController;
  late TextEditingController _visitDateController;
  late TextEditingController _ticketController;
  late TextEditingController _countryController;
  late FocusNode _nameFocusNode;
  late FocusNode _phoneFocusNode;
  late FocusNode _emailFocusNode;
  late FocusNode _addressFocusNode;
  late FocusNode _ticketFocusNode;
  late FocusNode _countryFocusNode;
  late GlobalKey<FormState> _formKey;
  late HisPatientInfo hisPatientInfo;
  @override
  void initState() {
    hisPatientInfo = HisPatientInfo();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _addressController = TextEditingController();
    _dobController = TextEditingController();
    _preferredDateController = TextEditingController();
    _expectedDateController = TextEditingController();
    _visitDateController = TextEditingController();
    _ticketController = TextEditingController();
    _countryController = TextEditingController();
    _nameFocusNode = FocusNode();
    _phoneFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _addressFocusNode = FocusNode();
    _ticketFocusNode = FocusNode();
    _countryFocusNode = FocusNode();
    _formKey = GlobalKey<FormState>();
    loggedAppUser = context.read<LoggedAppUserCubit>().state!;
    context.read<AddedPatUserListBloc>().add(GetAddedPatUserListEvent(
          refId: loggedAppUser.phone ?? '0',
        ));

    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _dobController.dispose();
    _preferredDateController.dispose();
    _expectedDateController.dispose();
    _visitDateController.dispose();
    _ticketController.dispose();
    _countryController.dispose();
    _nameFocusNode.dispose();
    _phoneFocusNode.dispose();
    _emailFocusNode.dispose();
    _addressFocusNode.dispose();
    _ticketFocusNode.dispose();
    _countryFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PatientPortalUser? selectedPatient = context.select(
      (VariableStateCubit<PatientPortalUser> cubit) => cubit.state,
    );
    bool? foreignTraveller = context.select(
      (VariableStateCubit<bool> cubit) => cubit.state,
    );
    // HisPatientInfo? hisPatientInfo = context.select((HisPatientInfoBloc bloc) {
    //   if (bloc.state is HisPatientInfoSuccess) {
    //     return (bloc.state as HisPatientInfoSuccess).patientInfo;
    //   }
    //   return null;
    // });
    return Scaffold(
      appBar: const CommonAppbar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: BlocBuilder<HisPatientInfoBloc, HisPatientInfoState>(
            builder: (context, state) {
              if (state is HisPatientInfoSuccess) {
                hisPatientInfo = state.patientInfo;
                _nameController.text = hisPatientInfo.patientName?.trim() ?? '';
                _phoneController.text =
                    hisPatientInfo.phoneMobile?.trim() ?? '';
                _emailController.text = hisPatientInfo.email?.trim() ?? '';
                _addressController.text = hisPatientInfo.address?.trim() ?? '';

                var gender = Gender.values.where((element) {
                  return element.value == hisPatientInfo.genderData;
                }).toList();
                if (gender.isNotEmpty) {
                  context.read<VariableStateCubit<Gender>>().update(gender[0]);
                }
                var bloodGroup = BloodGroup.values.where((element) {
                  return element.value == hisPatientInfo.bloodGroup;
                }).toList();
                if (bloodGroup.isNotEmpty) {
                  context
                      .read<VariableStateCubit<BloodGroup>>()
                      .update(bloodGroup[0]);
                }
                try {
                  var date = DateTime.parse(hisPatientInfo.dob ?? '');
                  context.read<VariableStateCubit<DateTime>>().update(date);
                } catch (e) {
                  context.read<VariableStateCubit<DateTime>>().reset();
                }
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    child: BlocBuilder<AddedPatUserListBloc,
                        AddedPatUserListState>(
                      builder: (context, state) {
                        return CommonDropdownButton<PatientPortalUser>(
                          hintText: "Select Patient",
                          value: selectedPatient,
                          onChanged: (value) {
                            if (value != null) {
                              context
                                  .read<VariableStateCubit<PatientPortalUser>>()
                                  .update(value);
                              context.read<HisPatientInfoBloc>().add(
                                    HisPatientInfoGet(
                                      mrnOrPhNo: value.mrn ?? '0',
                                    ),
                                  );
                            }
                          },
                          items: state is AddedPatUserListSuccess
                              ? state.patientPortalUserList
                              : [],
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Patient Name*",
                          style: lightTextTheme.bodyMedium!.copyWith(
                            color: appTheme.white,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CommonTextFieldWidget(
                          readOnly: _nameController.text.isNotEmpty,
                          controller: _nameController,
                          focusNode: _nameFocusNode,
                          hintText: "Full Name",
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
                                    readOnly: _phoneController.text.isNotEmpty,
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
                                  IgnorePointer(
                                    ignoring: selectedPatient != null &&
                                            context
                                                    .watch<
                                                        VariableStateCubit<
                                                            Gender>>()
                                                    .state !=
                                                null
                                        ? true
                                        : false,
                                    child: CommonDropdownButton<Gender>(
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
                                      style:
                                          lightTextTheme.bodyMedium!.copyWith(
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
                                        style:
                                            lightTextTheme.bodyMedium!.copyWith(
                                          color: appTheme.primary,
                                        ),
                                      ),
                                      const Spacer(),
                                      IconButton(
                                        onPressed: selectedPatient != null &&
                                                context
                                                        .watch<
                                                            VariableStateCubit<
                                                                DateTime>>()
                                                        .state !=
                                                    null
                                            ? () {}
                                            : () async {
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
                                    readOnly: _emailController.text.isNotEmpty,
                                    controller: _emailController,
                                    focusNode: _emailFocusNode,
                                    keyboardType: TextInputType.emailAddress,
                                    hintText: "Patient Email Address",
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please Enter Email Address';
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
                              child: IgnorePointer(
                                ignoring: selectedPatient != null &&
                                        context
                                                .watch<
                                                    VariableStateCubit<
                                                        Gender>>()
                                                .state !=
                                            null
                                    ? true
                                    : false,
                                child: CommonDropdownButton<BloodGroup>(
                                  hintText: "Blood Group",
                                  value: context
                                      .watch<VariableStateCubit<BloodGroup>>()
                                      .state,
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
                          readOnly: _addressController.text.isNotEmpty,
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
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Preferred Sample Coll. Date",
                                    style: lightTextTheme.bodyMedium!.copyWith(
                                      color: appTheme.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CommonTextFieldWidget(
                                    readOnly: true,
                                    controller: _preferredDateController,
                                    hintText: "DD-MM-YYYY",
                                    suffix: Icon(
                                      Icons.calendar_month,
                                      color: appTheme.primary,
                                    ),
                                    onTap: () async {
                                      var selectedDate = await showDatePicker(
                                        context: context,
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.now().add(
                                          const Duration(days: 30),
                                        ),
                                        initialDate: DateTime.now(),
                                      );
                                      if (selectedDate != null &&
                                          context.mounted) {
                                        _preferredDateController.text =
                                            selectedDate
                                                .toFormatedString("dd-MM-yyyy");
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Expected Report Delivery Date",
                                    style: lightTextTheme.bodyMedium!.copyWith(
                                      color: appTheme.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CommonTextFieldWidget(
                                    readOnly: true,
                                    controller: _expectedDateController,
                                    hintText: "DD-MM-YYYY",
                                    suffix: Icon(
                                      Icons.calendar_month,
                                      color: appTheme.primary,
                                    ),
                                    onTap: () async {
                                      var selectedDate = await showDatePicker(
                                        context: context,
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.now().add(
                                          const Duration(days: 30),
                                        ),
                                        initialDate: DateTime.now(),
                                      );
                                      if (selectedDate != null &&
                                          context.mounted) {
                                        _expectedDateController.text =
                                            selectedDate
                                                .toFormatedString("dd-MM-yyyy");
                                      }
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
                        Text(
                          "Foreign Traveler",
                          style: lightTextTheme.bodyMedium!.copyWith(
                            color: appTheme.white,
                          ),
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Radio<bool>(
                                  value: true,
                                  groupValue: foreignTraveller,
                                  onChanged: (value) {
                                    if (value == null) return;
                                    context
                                        .read<VariableStateCubit<bool>>()
                                        .update(value);
                                  },
                                ),
                                Text(
                                  "Yes",
                                  style: lightTextTheme.bodyMedium!.copyWith(
                                    color: appTheme.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 16),
                            Row(
                              children: [
                                Radio<bool>(
                                  value: false,
                                  groupValue: foreignTraveller,
                                  onChanged: (value) {
                                    if (value == null) return;
                                    context
                                        .read<VariableStateCubit<bool>>()
                                        .update(value);
                                  },
                                ),
                                Text(
                                  "No",
                                  style: lightTextTheme.bodyMedium!.copyWith(
                                    color: appTheme.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        BlocBuilder<VariableStateCubit<bool>, bool?>(
                          builder: (context, state) {
                            if (state == true) {
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Ticket No*",
                                              style: lightTextTheme.bodyMedium!
                                                  .copyWith(
                                                color: appTheme.white,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            CommonTextFieldWidget(
                                              controller: _ticketController,
                                              focusNode: _ticketFocusNode,
                                              hintText: "Ticket No",
                                              validator: (value) {
                                                if ((value == null ||
                                                        value.isEmpty) &&
                                                    foreignTraveller == true) {
                                                  return "Please enter ticket no";
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
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Country Of Arrival*",
                                              style: lightTextTheme.bodyMedium!
                                                  .copyWith(
                                                color: appTheme.white,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            CommonTextFieldWidget(
                                              controller: _countryController,
                                              focusNode: _countryFocusNode,
                                              hintText: "Country Of Arrival",
                                              validator: (value) {
                                                if ((value == null ||
                                                        value.isEmpty) &&
                                                    foreignTraveller == true) {
                                                  return "Please enter country of arrival";
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
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Tentative Visit Date*",
                                        style:
                                            lightTextTheme.bodyMedium!.copyWith(
                                          color: appTheme.white,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CommonTextFieldWidget(
                                        readOnly: true,
                                        controller: _visitDateController,
                                        hintText: "DD-MM-YYYY",
                                        suffix: Icon(
                                          Icons.calendar_month,
                                          color: appTheme.primary,
                                        ),
                                        onTap: () async {
                                          var selectedDate =
                                              await showDatePicker(
                                            context: context,
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime.now().add(
                                              const Duration(days: 30),
                                            ),
                                            initialDate: DateTime.now(),
                                          );
                                          if (selectedDate != null &&
                                              context.mounted) {
                                            _visitDateController.text =
                                                selectedDate.toFormatedString(
                                                    "dd-MM-yyyy");
                                          }
                                        },
                                        validator: (value) {
                                          if ((value == null ||
                                                  value.isEmpty) &&
                                              foreignTraveller == true) {
                                            return "Please enter tentative visit date";
                                          }
                                          return null;
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            }
                            return Container();
                          },
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: CommonElevatedButton(
                            lable: "Proceed",
                            backgroundColor: appTheme.secondary,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {}
                              // if (_formKey.currentState!.validate() &&
                              //     _validate()) {
                              //   patientInfo = patientInfo.copyWith(
                              //     patientName: _nameController.text,
                              //     phoneMobile: _phoneController.text,
                              //     genderData: context
                              //         .read<VariableStateCubit<Gender>>()
                              //         .state!
                              //         .value,
                              //     dob: context
                              //         .read<VariableStateCubit<DateTime>>()
                              //         .state!
                              //         .toFormatedString('yyyy-MM-dd'),
                              //     ageYy: context
                              //         .read<VariableStateCubit<DateTime>>()
                              //         .state!
                              //         .calculateAge()[0],
                              //     ageMm: context
                              //         .read<VariableStateCubit<DateTime>>()
                              //         .state!
                              //         .calculateAge()[1],
                              //     ageDd: context
                              //         .read<VariableStateCubit<DateTime>>()
                              //         .state!
                              //         .calculateAge()[2],
                              //     address: _addressController.text,
                              //     email: _emailController.text,
                              //   );
                              //   context.pushNamed(
                              //     AppointmentInfoPage.routeName,
                              //     extra: {
                              //       "slot": widget.slot,
                              //       "consultationType": widget.consultationType,
                              //       "patType": widget.patientType,
                              //       "doctor": widget.doctor,
                              //       "patient": patientInfo,
                              //     },
                              //   );
                              // }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
