import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_states.dart';
import 'package:note_app/models/note_model.dart';

class AddNoteCubits extends Cubit<AddNoteState> {
  AddNoteCubits() : super(AddNoteInitialState());

  addNote(NoteModel noteModel) {
    var notesBox = Hive.box<NoteModel>(kBoxName);
    try {
      emit(AddNoteLoading());
      notesBox.add(noteModel);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(errorMess: e.toString()));
    }
  }
}
