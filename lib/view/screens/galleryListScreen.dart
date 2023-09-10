import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inf_gallery/redux/middleware.dart';
import 'package:inf_gallery/view/widgets/backgroundMain.dart';
import '../../redux/state.dart';
import '../widgets/imageCardWidget.dart';

class GalleryListWidget extends StatefulWidget {
  const GalleryListWidget({super.key});

  @override
  State<StatefulWidget> createState() => GalleryListState();
}

class GalleryListState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Фото галерея"),
          backgroundColor: Colors.orange.shade300,
        ),
        body: CustomPaint(
          painter: Background(),
          child: Center(
              child: Container(
                child: SizedBox(

                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: StoreConnector<AppState, AppState>(
                              converter: (store) => store.state,
                              builder: (_, state) {
                                var store = StoreProvider.of<AppState>(context);
                                if (state.galleryList.isEmpty) {
                                  store.dispatch(loadNextPageThunk);
                                }
                                return ListView.builder(
                                    padding: const EdgeInsets.only(top: 15),
                                    scrollDirection: Axis.vertical,
                                    itemCount: state.galleryList.length,
                                    itemBuilder: (context, index) {
                                      if (index == state.galleryList.length - 1) {
                                        store.dispatch(loadNextPageThunk);
                                      }
                                      return GestureDetector(
                                        child: GalleryCardWidget(state.galleryList[index], index),
                                      );
                                    });
                              },
                            ),
                          )
                        ])
                ),
              )
          ),
        )
    );
    //
  }
}
