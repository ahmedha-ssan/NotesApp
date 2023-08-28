import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/Models/NoteModel.dart';
import 'package:noteapp/cubits/notes_cubit/notes_cubit.dart';
import 'package:noteapp/widgets/CustomAppBar.dart';

import 'CustomTextField.dart';
import 'ShowSnackBar.dart';

class EditNoteBody extends StatefulWidget {
  const EditNoteBody({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteBody> createState() => _EditNoteBodyState();
}

class _EditNoteBodyState extends State<EditNoteBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            CustomAppBar(
              icon: Icons.check,
              title: 'Edit Note',
              onPressed: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.sybTitle = content ?? widget.note.sybTitle;
                widget.note.save();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();

                Navigator.pop(context);
                const deleteMessage = 'Note updated successfully...';
                ShowSnackBar(context, deleteMessage);
              },
            ),
            const SizedBox(height: 34),
            CustomTextField(
              hint: widget.note.title,
              onChanged: (value) {
                title = value;
              },
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hint: widget.note.sybTitle,
              maxLines: 5,
              onChanged: (value) {
                content = value;
              },
            ),
            const SizedBox(height: 46),
          ],
        ),
      ),
    );
  }
}
