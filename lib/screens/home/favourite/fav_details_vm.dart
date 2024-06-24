import 'package:graduation/core/favorites_manager.dart';
import 'package:graduation/models/recyle/recycle_product_details_model.dart';
import '../../../../core/network_layer/api_manager.dart';

class FavProductDetailsVm {
  ProdcuctData? prodcuctData;
  Api_Manager apiManager = Api_Manager();
  Future<void> getProductData(int id) async {
    prodcuctData = (await apiManager.fetchGetProductDetails(id));
  }

  Future<void> addtofav() async {
    FavoritesManager.getInstance().addFav(prodcuctData!.id!);
    //await apiManager.addToFav(prodcuctData!.id!);
  }

  Future<void> removeFromFav() async {
    FavoritesManager.getInstance().removeFav(prodcuctData!.fav_id!);
  }

  Future<void> addtoCart() async {
    await apiManager.addToCart(prodcuctData!.id!);
  }
}
