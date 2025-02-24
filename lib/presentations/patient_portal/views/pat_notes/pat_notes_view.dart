import 'package:delta_hospital/app/app.dart';

import 'package:delta_hospital/app/cubit/logged_his_user_cubit.dart';
import 'package:delta_hospital/data/models/user_details_response.dart';
import 'package:delta_hospital/app/widgets/common_elevated_button.dart';
import 'package:delta_hospital/app/widgets/common_loading.dart';
import 'package:delta_hospital/core/theme/app_theme.dart';
import 'package:delta_hospital/core/utils/app_modal.dart';
import 'package:delta_hospital/presentations/patient_portal/views/pat_notes/bloc/add_note_bloc.dart';
import 'package:delta_hospital/presentations/patient_portal/views/pat_notes/bloc/notes_bloc.dart';
import 'package:delta_hospital/presentations/patient_portal/views/pat_notes/pat_notes_page.dart';
import 'package:delta_hospital/presentations/patient_portal/views/patient_portal/patient_portal_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/widgets/common_text_field_widget.dart';

class PatNotesView extends StatefulWidget {
  const PatNotesView({super.key});

  @override
  State<PatNotesView> createState() => _PatNotesViewState();
}

class _PatNotesViewState extends State<PatNotesView> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late FocusNode _titleFocusNode;
  late FocusNode _descriptionFocusNode;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _titleFocusNode = FocusNode();
    _descriptionFocusNode = FocusNode();
    context.read<NotesBloc>().add(GetNotesEvent());
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _titleFocusNode.dispose();
    _descriptionFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(),
      body: MultiBlocListener(
        listeners: [
          BlocListener<AddNoteBloc, AddNoteState>(
            listener: (context, state) {
              if (state is AddNoteSuccess) {
                _titleController.clear();
                _descriptionController.clear();
                _titleFocusNode.unfocus();
                _descriptionFocusNode.unfocus();
                _formKey.currentState?.reset();
                context.read<NotesBloc>().add(GetNotesEvent());
              }
            },
          ),
          BlocListener<LoggedHisUserCubit, UserDetails?>(
            listener: (context, state) {
              var activePage = GoRouterState.of(context).name.toString();
              if (state == null && activePage == PatNotesPage.routeName) {
                AppModal.showCustomModal(
                  context,
                  title: "Session Expired",
                  content: const SessionExpireDialog(),
                );
              }
            },
          ),
        ],
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            children: [
              ExpansionTile(
                iconColor: appTheme.white,
                collapsedIconColor: appTheme.white,
                title: Text(
                  "Add Notes",
                  style: lightTextTheme.bodyMedium!.copyWith(
                    fontSize: 18,
                    color: appTheme.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: appTheme.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(15),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CommonTextFieldWidget(
                            controller: _titleController,
                            focusNode: _titleFocusNode,
                            hintText: "Title",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter title";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CommonTextFieldWidget(
                            controller: _descriptionController,
                            focusNode: _descriptionFocusNode,
                            hintText: "Description",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter description";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          BlocBuilder<AddNoteBloc, AddNoteState>(
                            builder: (context, state) {
                              return CommonElevatedButton(
                                lable: state is AddNoteLoading
                                    ? "Adding Note..."
                                    : "Add Note",
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<AddNoteBloc>().add(
                                          CreateNoteEvent(
                                            title: _titleController.text,
                                            description:
                                                _descriptionController.text,
                                          ),
                                        );
                                  }
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: BlocBuilder<NotesBloc, NotesState>(
                  builder: (context, state) {
                    if (state is NotesLoading) {
                      return const CommonLoading();
                    }
                    if (state is NotesSuccess) {
                      return ListView.separated(
                        itemBuilder: (context, index) {
                          var data = state.notesGridList.data?[index];
                          return Container(
                            decoration: BoxDecoration(
                              color: appTheme.white,
                              borderRadius: const BorderRadius.horizontal(
                                right: Radius.circular(8),
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: IntrinsicHeight(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 20,
                                          decoration: BoxDecoration(
                                            color: appTheme.secondary,
                                            borderRadius:
                                                const BorderRadius.horizontal(
                                              right: Radius.circular(3),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                                data?.patNoteTitle ??
                                                                    ""),
                                                            Text(
                                                                data?.patNoteDetail ??
                                                                    ""),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
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
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                        itemCount: state.notesGridList.data?.length ?? 0,
                      );
                    }
                    return Container();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
