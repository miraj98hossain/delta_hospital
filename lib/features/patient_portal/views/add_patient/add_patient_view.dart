import 'package:delta_hospital/app/cubit/logged_app_user_cubit.dart';
import 'package:delta_hospital/app/cubit/variable_state_cubit.dart';
import 'package:delta_hospital/app/data/models/patient_relation_list_response.dart';
import 'package:delta_hospital/app/widgets/app_snack_bar.dart';
import 'package:delta_hospital/app/widgets/common_appbar.dart';
import 'package:delta_hospital/app/widgets/common_drop_down.dart';
import 'package:delta_hospital/app/widgets/common_text_field_widget.dart';

import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/core/utils/image_constant.dart';
import 'package:delta_hospital/features/patient_portal/views/add_patient/bloc/his_user_create_bloc.dart';
import 'package:delta_hospital/features/patient_portal/views/add_patient/bloc/pat_relation_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPatientView extends StatefulWidget {
  const AddPatientView({super.key});

  @override
  State<AddPatientView> createState() => _AddPatientViewState();
}

class _AddPatientViewState extends State<AddPatientView> {
  late TextEditingController _hospitalNoController;

  late FocusNode _hospitalNoFocusNode;

  late GlobalKey<FormState> _formKey;
  @override
  void initState() {
    _hospitalNoController = TextEditingController();

    _hospitalNoFocusNode = FocusNode();

    _formKey = GlobalKey<FormState>();
    context.read<PatRelationListBloc>().add(PatRelationListGet());
    super.initState();
  }

  @override
  void dispose() {
    _hospitalNoController.dispose();

    _hospitalNoFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<HisUserCreateBloc, HisUserCreateState>(
        listener: (context, state) {
          if (state is HisUserCreateSuccess) {
            _hospitalNoController.clear();
            _formKey.currentState?.reset();

            context.read<VariableStateCubit<PatientRelation>>().reset();
            AppSnackBar.showSnackBar(
              context: context,
              message: "Patient Added Successfully",
              type: SnackBarType.success,
            );
          }
          if (state is HisUserCreateError) {
            AppSnackBar.showSnackBar(
              context: context,
              message: state.error.toString(),
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
                          "Add Patient",
                          style: lightTextTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: appTheme.primary,
                          ),
                        ),
                        Text(
                          "Please Add To Continue",
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
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: CommonTextFieldWidget(
                            controller: _hospitalNoController,
                            focusNode: _hospitalNoFocusNode,
                            hintText: "Hospital Number",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your hospital number";
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: BlocBuilder<PatRelationListBloc,
                              PatRelationListState>(
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
                                    .watch<
                                        VariableStateCubit<PatientRelation>>()
                                    .state,
                                onChanged: (value) {
                                  if (value != null) {
                                    context
                                        .read<
                                            VariableStateCubit<
                                                PatientRelation>>()
                                        .update(value);
                                  }
                                },
                                items: state is PatRelationListSuccess
                                    ? state.patientRelationList
                                    : [],
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        BlocBuilder<HisUserCreateBloc, HisUserCreateState>(
                          builder: (context, state) {
                            return SizedBox(
                              width: MediaQuery.of(context).size.width * 0.85,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    var selectedRelation = context
                                        .read<
                                            VariableStateCubit<
                                                PatientRelation>>()
                                        .state!;
                                    var loggedAppUser = context
                                        .read<LoggedAppUserCubit>()
                                        .state!;
                                    context.read<HisUserCreateBloc>().add(
                                          HisUserCreate(
                                            mrn: _hospitalNoController.text,
                                            relation: selectedRelation,
                                            refId: loggedAppUser.phone ?? "",
                                          ),
                                        );
                                  }
                                },
                                child: Text(
                                  state is HisUserCreateLoading
                                      ? "Please wait..."
                                      : "Add",
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
