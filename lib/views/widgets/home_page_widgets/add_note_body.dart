import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_states.dart';
import 'package:note_app/cubits/fetch_note_cubit/fetch_note_cubit.dart';
import 'package:note_app/views/widgets/home_page_widgets/add_note_form.dart';

class AddNoteBody extends StatelessWidget {
  const AddNoteBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubits, AddNoteState>(
      listener: (context, state) {
        if (state is AddNoteSuccess) {
          BlocProvider.of<FetchNoteCubit>(context).fetchNotes();

          Navigator.pop(context);
        }
        if (state is AddNoteFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("${state.errorMess}")));
        }
      },
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is AddNoteLoading ? true : false,
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.only(
                left: 16.0,
                right: 16,
                top: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom + 16),
            child: const AddNoteForm(),
          )),
        );
      },
    );
  }
}
