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
    await apiManager.addToFav(prodcuctData!.id!);
  }

  Future<void> removeFromFav() async {
    FavoritesManager.getInstance().removeFav(prodcuctData!.id!);
  }

  Future<void> addtoCart() async {
    FavoritesManager.getInstance().addFav(prodcuctData!.id!);
  }
}
