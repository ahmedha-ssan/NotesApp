import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/widgets/NoteListView.dart';

import '../cubits/notes_cubit/notes_cubit.dart';
import 'CustomAppBar.dart';

class NotesBody extends StatefulWidget {
  const NotesBody({super.key});

  @override
  State<NotesBody> createState() => _NotesBodyState();
}

class _NotesBodyState extends State<NotesBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 40),
            CustomAppBar(icon: Icons.search, title: 'Notes'),
            Expanded(child: NotesLestView()),
          ],
        ),
      ),
    );
  }
}
