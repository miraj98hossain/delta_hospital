import 'package:delta_hospital/app/app.dart';
import 'package:delta_hospital/app/cubit/variable_state_cubit.dart';
import 'package:delta_hospital/app/data/models/patient_portal_user_list_response.dart';
import 'package:delta_hospital/app/widgets/common_drop_down.dart';
import 'package:delta_hospital/app/widgets/common_elevated_button.dart';
import 'package:delta_hospital/core/extentions/extentations.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/core/utils/enums.dart';
import 'package:delta_hospital/features/book_appointment/appointment_info.dart';
import 'package:delta_hospital/features/book_appointment/data/models/available_slot_response.dart';
import 'package:delta_hospital/features/book_appointment/data/models/consultation_type_response.dart';
import 'package:delta_hospital/features/book_appointment/data/models/doctor_grid_list_response.dart';
import 'package:delta_hospital/features/book_appointment/data/models/patient_type_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/widgets/common_text_field_widget.dart';

class PatientInfoView extends StatefulWidget {
  const PatientInfoView(
      {super.key,
      required this.patientPortalUser,
      required this.patientType,
      required this.slot,
      required this.consultationType,
      required this.doctor});
  final PatientPortalUser? patientPortalUser;
  final PatientType patientType;
  final Slot slot;
  final ConsultationType consultationType;
  final Doctor doctor;
  @override
  State<PatientInfoView> createState() => _PatientInfoViewState();
}

class _PatientInfoViewState extends State<PatientInfoView> {
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _addressController;
  late FocusNode _nameFocusNode;
  late FocusNode _phoneFocusNode;
  late FocusNode _emailFocusNode;
  late FocusNode _addressFocusNode;

  late GlobalKey<FormState> _formKey;
  @override
  void initState() {
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _addressController = TextEditingController();
    _nameFocusNode = FocusNode();
    _phoneFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _addressFocusNode = FocusNode();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _nameFocusNode.dispose();
    _phoneFocusNode.dispose();
    _emailFocusNode.dispose();
    _addressFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
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
                controller: _nameController,
                focusNode: _nameFocusNode,
                hintText: "Full Name",
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
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Email",
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
                    context.pushNamed(AppointmentInfoPage.routeName);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
