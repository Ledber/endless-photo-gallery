import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inf_gallery/redux/actions.dart';
import 'package:inf_gallery/view/widgets/imageWidget.dart';
import 'package:inf_gallery/view/widgets/likeButtonWidget.dart';
import 'package:inf_gallery/view/screens/PhotoViewScreen.dart';
import 'package:flutter/painting.dart';
import '../../model/galleryModel.dart';
import '../../redux/state.dart';

class GalleryCardWidget extends StatelessWidget {
  final Gallery gallery;
  final int photoIndex;

  const GalleryCardWidget(this.gallery, this.photoIndex, {super.key});

  @override
  Widget build(BuildContext context) {
    var likesCount =0;
    return InkWell(
      splashColor: Colors.grey,
      onTap: () => _openFullScreenPhoto(context),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
            ),
            margin: const EdgeInsets.only(bottom: 10),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ImageWidget(imageUrl: gallery.urls.regular),
                  LikeButtonWidget(
                    isLiked: gallery.isLiked,
                    onPressed: () => _likePressed(context, gallery, photoIndex),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Future<void> _likePressed(BuildContext context, Gallery gallery, int currentIndex) async {
    final store = StoreProvider.of<AppState>(context);
    store.dispatch(GalleryLikeAction(gallery, currentIndex));
  }
  void _openFullScreenPhoto(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    store.dispatch(ShowFullScreenAction(photoIndex));
    Navigator.push(context, MaterialPageRoute(builder: (_) => const FullscreenWidget()));
  }

}


