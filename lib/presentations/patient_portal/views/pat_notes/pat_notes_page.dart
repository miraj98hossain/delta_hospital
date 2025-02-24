import 'package:delta_hospital/dependency_injector/di_container.dart';
import 'package:delta_hospital/presentations/patient_portal/views/pat_notes/bloc/add_note_bloc.dart';
import 'package:delta_hospital/presentations/patient_portal/views/pat_notes/bloc/notes_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../pat_notes.dart';

class PatNotesPage extends StatelessWidget {
  const PatNotesPage({super.key});
  static const routeName = 'pat-notes-page';
  static const routePath = 'pat-notes-page';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddNoteBloc(getService()),
        ),
        BlocProvider(
          create: (context) => NotesBloc(getService()),
        ),
      ],
      child: const PatNotesView(),
    );
  }
}
