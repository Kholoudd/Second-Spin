import 'package:graduation/core/network_layer/api_manager.dart';
import '../models/fav/addtofav/add_to_fav.dart';

class FavoritesManager {
  // Make constructor private
  FavoritesManager._();
  static FavoritesManager? _instance;
  Api_Manager api_manager = Api_Manager();
  List<FavProductList> favs = [];
  static FavoritesManager getInstance() {
    _instance ??= FavoritesManager._();
    return _instance!;
  }

  Future<void> getFavs() async {
    print("=============================================================");
    print("get favorites from favorites manager = ${favs.length}");
    print("=============================================================");
    favs = (await Api_Manager.fetchAllFavList())!;
  }

  Future<void> addFav(int productId) async {
    await api_manager.addToFav(productId);
    getFavs();
  }

  Future<void> removeFav(int productId) async {
    await api_manager.removeFromFav(productId);
    getFavs();

    // getFavs();
    //favs.removeAt(indexOfFavsProduct(productId)!);
  }

  List retrieveData(List<dynamic> data) {
    for (int i = 0; i < data.length; i++) {
      for (int j = 0; j < favs.length; j++) {
        if (data[i].id == favs[j].product_id) {
          data[i].isfav = true;
          data[i].fav_id = favs[j].id;
          break;
        }
      }
    }
    return data;
  }

  dynamic isFav(dynamic item) {
    for (int i = 0; i < favs.length; i++) {
      if (favs[i].product_id == item.id) {
        item.isfav = true;
        item.fav_id = favs[i].id;
      }
    }
    return item;
  }

  int? indexOfFavsProduct(int id) {
    for (int i = 0; i < favs.length; i++) {
      if (favs[i].product_id == id) {
        return i;
      }
    }
    return null;
  }
}
