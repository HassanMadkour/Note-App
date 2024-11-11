import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/cubits/fetch_note_cubit/fetch_note_cubit.dart';

import '../widgets/home_page_widgets/add_note_body.dart';
import '../widgets/home_page_widgets/note_page_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String screenID = "HomePage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              context: context,
              builder: (context) {
                return const AddNoteBody();
              },
            );
          },
          backgroundColor: kPrimaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
          child: const Icon(Icons.add),
        ),
        body: const RefreshNotePage());
  }
}

class RefreshNotePage extends StatelessWidget {
  const RefreshNotePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<FetchNoteCubit>(context).fetchNotes();
        },
        child: const NotePageBody());
  }
}
