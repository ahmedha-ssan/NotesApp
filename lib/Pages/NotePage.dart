import 'package:flutter/material.dart';
import 'package:noteapp/widgets/AddNoteButtomSheet.dart';
import '../widgets/NotesBody.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            context: context,
            builder: (context) {
              return const AddNoteButtomSheet();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: const NotesBody(),
    );
  }
}
