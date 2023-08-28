import 'package:flutter/material.dart';
import 'package:noteapp/Models/NoteModel.dart';

import '../widgets/EditNoteBody.dart';

class EditNotePage extends StatelessWidget {
  const EditNotePage({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNoteBody(
        note: note,
      ),
    );
  }
}
