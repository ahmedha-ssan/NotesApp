// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:noteapp/Models/NoteModel.dart';
import 'package:noteapp/cubits/notes_cubit/notes_cubit.dart';
import 'package:noteapp/widgets/CustomTextField.dart';
import '../cubits/add_note_cubit/add_note_cubit.dart';
import 'CustomButton.dart';
import 'ShowSnackBar.dart';

class AddNoteButtomSheet extends StatelessWidget {
  const AddNoteButtomSheet({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailure) {}
          if (state is AddNoteSuccess) {
            const deleteMessage = 'Note added successfully...';
            ShowSnackBar(context, deleteMessage);

            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: State is AddNoteLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const SingleChildScrollView(child: AddNoteForm()),
            ),
          );
        },
      ),
    );
  }
}

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(height: 34),
          CustomTextField(
            onSaved: (p0) {
              title = p0;
            },
            hint: 'Title',
          ),
          const SizedBox(height: 16),
          CustomTextField(
            onSaved: (p0) {
              subTitle = p0;
            },
            hint: 'Content',
            maxLines: 5,
          ),
          const SizedBox(height: 46),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    var currentData = DateTime.now();
                    var formatedCurrentDate =
                        DateFormat.yMd().format(currentData);
                    var noteModel = NoteModel(
                      title: title!,
                      sybTitle: subTitle!,
                      date: formatedCurrentDate,
                      //DateTime.now().toString()
                      color: Color.fromARGB(255, 107, 39, 34).value,
                    );
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
