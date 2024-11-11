import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/fetch_note_cubit/fetch_note_cubit.dart';
import 'package:note_app/views/widgets/home_page_widgets/custom_app_bar.dart';

import 'note_list.dart';

class NotePageBody extends StatefulWidget {
  const NotePageBody({
    super.key,
  });

  @override
  State<NotePageBody> createState() => _NotePageBodyState();
}

class _NotePageBodyState extends State<NotePageBody> {
  @override
  void initState() {
    BlocProvider.of<FetchNoteCubit>(context).fetchNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
      child: Column(
        children: [
          CustomAppBar(
            appBarIcon: Icons.search,
            titleText: "Notes",
          ),
          Expanded(child: NoteList()),
        ],
      ),
    );
  }
}
