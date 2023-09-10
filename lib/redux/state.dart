import 'package:inf_gallery/model/galleryModel.dart';

class AppState {
  final List<Gallery> galleryList;
  final int page;
  int? currentIndex;

  AppState({
    required this.galleryList,
    required this.page,
    this.currentIndex,
  });

  factory AppState.init(List<Gallery> galleryList, int page) {
    return AppState(
      galleryList: galleryList,
      page: page,
    );
  }

  factory AppState.initialState() {
    return AppState(
      galleryList: List.empty(),
      page: 1,
    );
  }

  factory AppState.copyFrom(AppState state, int index) {
    return AppState(
      galleryList: state.galleryList,
      page: state.page,
      currentIndex: index,
    );
  }
}
