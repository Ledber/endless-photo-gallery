import 'package:inf_gallery/model/galleryModel.dart';

class LoadGalleryDataAction {
  final List<Gallery> _galleryList;
  final int _page;
  LoadGalleryDataAction(this._galleryList, this._page);
  int get page => _page;
  List<Gallery> get galleryList => _galleryList;
}
class ShowFullScreenAction {
  final int _index;
  ShowFullScreenAction(this._index);
  int get index => _index;
}
class GalleryLikeAction {
  final Gallery _gallery;
  final int _index;
  GalleryLikeAction(this._gallery, this._index);
  int get index => _index;
  Gallery get gallery => _gallery;
}



