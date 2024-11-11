import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/fetch_note_cubit/fetch_note_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/pages/edit_note.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({super.key, required this.noteModel});
  final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateToEditPage(context);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Color(noteModel.colorNote)),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 24, top: 16, bottom: 16, right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                isThreeLine: true,
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    noteModel.title,
                    style: const TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                subtitle: Text(noteModel.content,
                    style: TextStyle(
                        color: Colors.black.withOpacity(.6), fontSize: 16)),
                trailing: IconButton(
                    onPressed: () {
                      deleteNote(context);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.black,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24.0, bottom: 8),
                child: Text(
                  noteModel.dateTime,
                  style: TextStyle(color: Colors.black.withOpacity(.6)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void deleteNote(BuildContext context) {
    noteModel.delete();
    BlocProvider.of<FetchNoteCubit>(context).fetchNotes();
  }

  void navigateToEditPage(BuildContext context) {
    Navigator.pushNamed(context, EditNotePage.screenID, arguments: noteModel);
  }
}
