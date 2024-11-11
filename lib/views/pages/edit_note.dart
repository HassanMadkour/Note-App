import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/fetch_note_cubit/fetch_note_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/widgets/home_page_widgets/custom_app_bar.dart';
import 'package:note_app/views/widgets/home_page_widgets/custom_text_field.dart';

class EditNotePage extends StatelessWidget {
  const EditNotePage({super.key});

  static const String screenID = "EditNotePage";

  @override
  Widget build(context) {
    NoteModel noteModel =
        ModalRoute.of(context)!.settings.arguments as NoteModel;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 50.0),
        child: EditNoteForm(noteModel: noteModel),
      ),
    );
  }
}

class EditNoteForm extends StatefulWidget {
  const EditNoteForm({
    super.key,
    required this.noteModel,
  });

  final NoteModel noteModel;

  @override
  State<EditNoteForm> createState() => _EditNoteFormState();
}

class _EditNoteFormState extends State<EditNoteForm> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          onPressed: () {
            widget.noteModel.title = title ?? widget.noteModel.title;
            widget.noteModel.content = content ?? widget.noteModel.content;
            widget.noteModel.save();
            BlocProvider.of<FetchNoteCubit>(context).fetchNotes();
            Navigator.pop(context);
          },
          appBarIcon: Icons.edit,
          titleText: "Edit Note",
        ),
        CustomTextField(
          onChange: (value) {
            title = value;
          },
          hintText: widget.noteModel.title,
        ),
        const SizedBox(height: 20),
        CustomTextField(
          onChange: (value) {
            content = value;
          },
          hintText: widget.noteModel.content,
          maxLines: 8,
        ),
      ],
    );
  }
}
