import 'package:inf_gallery/model/galleryModel.dart';
import 'actions.dart';
import 'state.dart';

AppState galleryReducer(AppState state, dynamic action) {
  return (action is LoadGalleryDataAction)
      ? _loadGalleryData(action, state)
      : (action is GalleryLikeAction)
      ? _changeLikeStatus(action, state)
      : (action is ShowFullScreenAction)
      ? _showFullScreen(action, state)
      : state;
}

AppState _changeLikeStatus(GalleryLikeAction action, AppState state) {
  final List<Gallery> result = List.of(state.galleryList);
  final Gallery gallery = Gallery(
    action.gallery.id,
    action.gallery.urls,
    action.gallery.user,
    !action.gallery.isLiked,
  );
  result[action.index] = gallery;
  return AppState(
    galleryList: result,
    page: state.page,
    currentIndex: state.currentIndex,
  );
}

AppState _loadGalleryData(LoadGalleryDataAction action, AppState state) =>
    AppState(
      galleryList: action.galleryList,
      page: action.page,
    );

AppState _showFullScreen(ShowFullScreenAction action, AppState state) =>
    AppState(
      galleryList: state.galleryList,
      page: state.page,
      currentIndex: action.index,
    );
