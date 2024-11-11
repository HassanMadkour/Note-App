import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/fetch_note_cubit/fetch_note_cubit.dart';
import 'package:note_app/cubits/fetch_note_cubit/fetch_note_state.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/widgets/home_page_widgets/custom_note_item.dart';

class NoteList extends StatelessWidget {
  const NoteList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchNoteCubit, FetchNoteState>(
        builder: (context, state) {
      List<NoteModel> notes =
          BlocProvider.of<FetchNoteCubit>(context).notes ?? [];
      return ListView.builder(
        reverse: false,
        itemCount: notes.length,
        itemBuilder: (context, index) => CustomNoteItem(
          noteModel: notes[notes.length - 1 - index],
        ),
      );
    });
  }
}
