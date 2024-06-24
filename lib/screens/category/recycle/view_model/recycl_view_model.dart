import '../../../../core/favorites_manager.dart';
import '../../../../core/network_layer/api_manager.dart';
import '../../../../models/recyle/all_recycle_model.dart';

class AllRecyclViewModel {
  List<AllRecycle> allRecyclProductsView = [];
  Api_Manager apiManager = Api_Manager();
  Future<void> getAllRecyclProducts() async {
    final tempList = (await apiManager.fetchAllRecycl())!;
    allRecyclProductsView = FavoritesManager.getInstance()
        .retrieveData(tempList) as List<AllRecycle>;
  }

  Future<void> addtofav(int id) async {
    FavoritesManager.getInstance().addFav(id);

    //await apiManager.addToFav(id);
  }

  Future<void> removeFromFav(int id) async {
    FavoritesManager.getInstance().removeFav(id);

    //await apiManager.removeFromFav(id);
  }
}
