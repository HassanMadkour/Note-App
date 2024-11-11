import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/cubits/fetch_note_cubit/fetch_note_state.dart';
import 'package:note_app/models/note_model.dart';

class FetchNoteCubit extends Cubit<FetchNoteState> {
  FetchNoteCubit() : super(FetchNoteInitial());
  List<NoteModel>? notes;
  fetchNotes() {
    var noteBox = Hive.box<NoteModel>(kBoxName);
    notes = noteBox.values.toList();
    emit(FetchNoteReload());
  }
}
