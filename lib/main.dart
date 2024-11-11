import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/cubits/fetch_note_cubit/fetch_note_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/simpleBlocObserver.dart';
import 'package:note_app/views/pages/edit_note.dart';
import 'package:note_app/views/pages/home_page.dart';

void main() async {
  Bloc.observer = Simpleblocobserver();
  await initHive();
  runApp(DevicePreview(builder: (context) => const NoteApp()));
}

Future<void> initHive() async {
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.initFlutter();
  await Hive.openBox<NoteModel>(kBoxName);
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AddNoteCubits()),
          BlocProvider(create: (context) => FetchNoteCubit())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.dark,
          ),
          initialRoute: HomePage.screenID,
          routes: {
            HomePage.screenID: (context) => const HomePage(),
            EditNotePage.screenID: (context) => const EditNotePage(),
          },
        ),
      );
}
