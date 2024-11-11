class AddNoteState {}

class AddNoteInitialState extends AddNoteState {}

class AddNoteLoading extends AddNoteState {}

class AddNoteFailure extends AddNoteState {
  AddNoteFailure({this.errorMess});
  final String? errorMess;
}

class AddNoteSuccess extends AddNoteState {}
