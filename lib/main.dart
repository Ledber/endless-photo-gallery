import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:inf_gallery/redux/reducers.dart';
import 'package:inf_gallery/redux/state.dart';
import 'package:inf_gallery/view/screens/galleryListScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final store = Store(galleryReducer,
      initialState: AppState.initialState(), middleware: [thunkMiddleware]);

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: "Infinity Gallery",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const GalleryListWidget(),
      ),
    );
  }
}
