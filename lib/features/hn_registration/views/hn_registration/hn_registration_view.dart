import 'package:delta_hospital/app/cubit/variable_state_cubit.dart';
import 'package:delta_hospital/app/data/models/patient_relation_list_response.dart';
import 'package:delta_hospital/app/widgets/common_drop_down.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/core/utils/image_constant.dart';
import 'package:delta_hospital/app/bloc/pat_relation_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HnRegistrationView extends StatefulWidget {
  const HnRegistrationView({super.key});

  @override
  State<HnRegistrationView> createState() => _HnRegistrationViewState();
}

class _HnRegistrationViewState extends State<HnRegistrationView> {
  // late TextEditingController _hospitalNoController;

  // late FocusNode _hospitalNoFocusNode;

  late GlobalKey<FormState> _formKey;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                      // SizedBox(
                      //   width: MediaQuery.of(context).size.width * 0.85,
                      //   child: CommonTextFieldWidget(
                      //     controller: _hospitalNoController,
                      //     focusNode: _hospitalNoFocusNode,
                      //     hintText: "Hospital Number",
                      //     validator: (value) {
                      //       if (value!.isEmpty) {
                      //         return "Please enter your hospital number";
                      //       }
                      //       return null;
                      //     },
                      //   ),
                      // ),
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
                                  .watch<VariableStateCubit<PatientRelation>>()
                                  .state,
                              onChanged: (value) {
                                if (value != null) {
                                  context
                                      .read<
                                          VariableStateCubit<PatientRelation>>()
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
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {}
                          },
                          child: Text(
                            "Add",
                            style: lightTextTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: appTheme.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
