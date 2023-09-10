import 'package:redux_thunk/redux_thunk.dart';
import 'package:inf_gallery/model/galleryModel.dart';
import 'package:inf_gallery/redux/actions.dart';
import 'package:inf_gallery/redux/state.dart';
import 'package:inf_gallery/reposiroty/repository.dart';

final Repository repository = Repository.getInstance();

ThunkAction<AppState> loadNextPageThunk = (store) async {
  final List<Gallery> gallery = await repository.loadGalleryPage(store.state.page);
  final List<Gallery> result = [...store.state.galleryList, ...gallery];
  store.dispatch(LoadGalleryDataAction(result, store.state.page + 1));
};
