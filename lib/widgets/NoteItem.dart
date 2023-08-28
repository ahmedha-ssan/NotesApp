import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/Models/NoteModel.dart';
import 'package:noteapp/Pages/EditNotePage.dart';
import 'package:noteapp/cubits/notes_cubit/notes_cubit.dart';

import 'ShowSnackBar.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return EditNotePage(
                note: note,
              );
            },
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(top: 24, bottom: 24, left: 11),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Color(note.color)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                note.title,
                style: const TextStyle(color: Colors.black, fontSize: 28),
              ),
              subtitle: Text(
                note.sybTitle,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.5), fontSize: 18),
              ),
              trailing: IconButton(
                onPressed: () {
                  final deleteMessage =
                      '"${note.title}" note deleted successfully...';
                  ShowSnackBar(context, deleteMessage);
                  note.delete();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(
                note.date,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.5), fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
