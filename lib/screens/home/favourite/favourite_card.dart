import 'package:flutter/material.dart';
import 'package:graduation/models/fav/addtofav/add_to_fav.dart';
import 'add_to_fav_view_model.dart';

class Favourite_card extends StatefulWidget {
  FavProductList favProducts;
  AddToFavViewModel favVM;
  Favourite_card(this.favProducts, this.favVM, {super.key});
  @override
  State<Favourite_card> createState() => _Favourite_cardState();
}

class _Favourite_cardState extends State<Favourite_card> {
  @override
  Widget build(BuildContext context) {
    final mediaquary = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return widget.favProducts == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            padding: EdgeInsets.all(mediaquary.width * 0.015),
            margin: EdgeInsets.all(mediaquary.width * 0.01),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  widget.favProducts.image!,
                  width: double.infinity,
                  height: mediaquary.height * 0.2,
                  fit: BoxFit.cover,
                ),
                Text(
                  widget.favProducts.title!,
                  style: theme.textTheme.bodyLarge,
                ),
                Text(widget.favProducts.price!,
                    style: theme.textTheme.bodyLarge),
                Text(widget.favProducts.location!,
                    style: theme.textTheme.bodyMedium),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        if (widget.favProducts.isfav == false) {
                          await widget.favVM.addtofav(widget.favProducts.id!);
                          widget.favProducts.isfav = true;
                        } else {
                          await widget.favVM
                              .removeFromFav(widget.favProducts.id!);
                          widget.favProducts.isfav = false;
                        }
                        setState(() {});
                      },
                      child: Image.asset(widget.favProducts.isfav == false
                          ? "assets/image/Icon fav.png"
                          : "assets/image/fav_icon_solid.png"),
                    )
                  ],
                )
              ],
            ),
          );
  }
}
