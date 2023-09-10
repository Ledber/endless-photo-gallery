import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:photo_view/photo_view.dart';
import 'package:inf_gallery/model/galleryModel.dart';

import '../../redux/actions.dart';
import '../../redux/state.dart';

class FullscreenWidget extends StatefulWidget {
  const FullscreenWidget({super.key});

  @override
  State<StatefulWidget> createState() => _FullScreenPhotoState();
}

class _FullScreenPhotoState extends State {

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.up,
      dismissThresholds: const {DismissDirection.up: 0.7},
      dragStartBehavior: DragStartBehavior.start,
      background: const ColoredBox(color: Colors.black),
      onDismissed: (_) => Navigator.of(context).pop(),
      child: StoreConnector<AppState, AppState>(
          converter: (store) => store.state,
          builder: (_, state) {
            Gallery gallery = state.galleryList[state.currentIndex!];
            return Scaffold(
                appBar: AppBar(
                  leading: const CloseButton(),
                  title: Text(gallery.user.name),
                  backgroundColor: Colors.orange.shade300,
                ),
                floatingActionButton: FloatingActionButton(
                  tooltip: "Settings",
                  backgroundColor: gallery.isLiked ? Colors.red: Colors.white,
                  // foregroundColor: Colors.white,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    gallery.isLiked ? Icons.thumb_up : Icons.thumb_up_alt_outlined,
                    color: gallery.isLiked ? Colors.white : Colors.red,
                  ),

                  onPressed: () => {_likePressed(context, gallery, state.currentIndex!)},
                ),
                body: Center(
                  child: PhotoView(
                    minScale: PhotoViewComputedScale.contained,
                    backgroundDecoration: BoxDecoration(
                      color: Colors.grey.shade800,
                    ),
                    imageProvider: CachedNetworkImageProvider(gallery.urls.regular),
                  ),
                ));
          }),
    );
  }

  Future<void> _likePressed(BuildContext context, Gallery gallery, int currentIndex) async {
    final store = StoreProvider.of<AppState>(context);
    store.dispatch(GalleryLikeAction(gallery, currentIndex));
  }

}