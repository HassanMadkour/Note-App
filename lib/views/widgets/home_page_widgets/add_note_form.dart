import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_states.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/widgets/home_page_widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode validator = AutovalidateMode.disabled;
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: validator,
      child: Column(
        children: [
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            hintText: "Title",
          ),
          const SizedBox(height: 20),
          CustomTextField(
              onSaved: (value) {
                content = value;
              },
              hintText: "Content",
              maxLines: 8),
          const SizedBox(height: 50),
          BlocBuilder<AddNoteCubits, AddNoteState>(
            builder: (context, state) {
              return MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                onPressed: () {
                  createNote(context);
                },
                color: kPrimaryColor,
                minWidth: MediaQuery.of(context).size.width,
                textColor: Colors.black,
                child: state is AddNoteLoading
                    ? const SizedBox(
                        height: 15,
                        width: 15,
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ))
                    : const Text("Add"),
              );
            },
          )
        ],
      ),
    );
  }

  void createNote(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      BlocProvider.of<AddNoteCubits>(context).addNote(NoteModel(
          title: title!,
          content: content!,
          dateTime: DateFormat.EEEE().format(DateTime.now()),
          colorNote: Colors.green.value));
    } else {
      validator = AutovalidateMode.always;
    }
  }
}
