import 'package:delta_hospital/app/cubit/variable_state_cubit.dart';
import 'package:delta_hospital/app/data/models/app_login_response.dart';
import 'package:delta_hospital/app/data/models/patient_relation_list_response.dart';
import 'package:delta_hospital/app/widgets/common_appbar.dart';
import 'package:delta_hospital/app/widgets/common_drop_down.dart';
import 'package:delta_hospital/app/widgets/common_elevated_button.dart';
import 'package:delta_hospital/app/widgets/common_text_field_widget.dart';
import 'package:delta_hospital/core/extentions/extentations.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/core/utils/enums.dart';

import 'package:delta_hospital/app/bloc/pat_relation_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HnRegistrationView extends StatefulWidget {
  const HnRegistrationView({super.key});

  @override
  State<HnRegistrationView> createState() => _HnRegistrationViewState();
}

class _HnRegistrationViewState extends State<HnRegistrationView>
    with TickerProviderStateMixin {
  late AppUserDetails loggedAppUser;
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _addressController;
  late FocusNode _nameFocusNode;
  late FocusNode _phoneFocusNode;
  late FocusNode _emailFocusNode;
  late FocusNode _addressFocusNode;
  late GlobalKey<FormState> _formKey;
  late TabController _tabController;

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
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      context.read<VariableStateCubit<int>>().update(_tabController.index);
    });
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
      resizeToAvoidBottomInset: false,
      appBar: const CommonAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 30,
              child: TabBar(
                controller: _tabController,
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: const BoxDecoration(),
                tabs: [
                  Tab(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color:
                            context.watch<VariableStateCubit<int>>().state == 0
                                ? appTheme.deltaBlue
                                : Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          "Registration",
                          style: lightTextTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: context
                                        .watch<VariableStateCubit<int>>()
                                        .state ==
                                    0
                                ? appTheme.white
                                : appTheme.darkPurple,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color:
                            context.watch<VariableStateCubit<int>>().state == 1
                                ? appTheme.deltaBlue
                                : Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          "Hn Cards",
                          style: lightTextTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: context
                                        .watch<VariableStateCubit<int>>()
                                        .state ==
                                    1
                                ? appTheme.white
                                : appTheme.darkPurple,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [
                  const RegTab(),
                  Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: ListView.separated(
                          itemCount: 10,
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 10,
                            );
                          },
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                color: appTheme.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Lorem Ipsum is simply dummy",
                                    style: lightTextTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: appTheme.black,
                                    ),
                                  ),
                                  Text(
                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the...",
                                    style: lightTextTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10,
                                      color: appTheme.black,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.calendar_today_outlined,
                                            size: 12,
                                            color: Colors.grey,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "30 Nov 2023",
                                            style: lightTextTheme.bodySmall!
                                                .copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.person_2_outlined,
                                            size: 12,
                                            color: Colors.grey,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "John Doe",
                                            style: lightTextTheme.bodySmall!
                                                .copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
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

class RegTab extends StatefulWidget {
  const RegTab({
    super.key,
  });

  @override
  State<RegTab> createState() => _RegTabState();
}

class _RegTabState extends State<RegTab> {
  late AppUserDetails loggedAppUser;
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
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                      value: context.watch<VariableStateCubit<Gender>>().state,
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
                  value: context.watch<VariableStateCubit<BloodGroup>>().state,
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
                value:
                    context.watch<VariableStateCubit<PatientRelation>>().state,
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
          Align(
            alignment: Alignment.center,
            child: CommonElevatedButton(
              lable: "Proceed",
              backgroundColor: appTheme.secondary,
              onPressed: () {
                if (_formKey.currentState!.validate()) {}
              },
            ),
          ),
        ],
      ),
    );
  }
}
