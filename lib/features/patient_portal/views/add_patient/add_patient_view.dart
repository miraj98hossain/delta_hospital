import 'package:delta_hospital/app/cubit/variable_state_cubit.dart';
import 'package:delta_hospital/app/widgets/common_appbar.dart';
import 'package:delta_hospital/app/widgets/common_drop_down.dart';
import 'package:delta_hospital/app/widgets/common_text_field_widget.dart';
import 'package:delta_hospital/core/enums.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/features/patient_portal/views/add_patient/bloc/his_user_create_bloc.dart';
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
      appBar: const CommonAppbar(),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Text(
                    "Add Patient",
                    style: lightTextTheme.bodyLarge!.copyWith(
                      color: appTheme.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
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
                    child: CommonDropdownButton<Relation>(
                      hintText: "Select Relation",
                      validator: (value) {
                        if (value == null) {
                          return "Please select relation";
                        }
                        return null;
                      },
                      value:
                          context.watch<VariableStateCubit<Relation>>().state,
                      onChanged: (value) {
                        if (value != null) {
                          context
                              .read<VariableStateCubit<Relation>>()
                              .update(value);
                        }
                      },
                      items: Relation.values,
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
                            if (_formKey.currentState!.validate()) {}
                          },
                          child: Text(
                            state is HisUserCreateLoading
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
    );
  }
}
