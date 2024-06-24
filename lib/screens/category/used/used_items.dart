import 'package:flutter/material.dart';
import 'package:graduation/core/favorites_manager.dart';
import 'package:graduation/models/categories_response/category_data.dart';

import '../recycle/view_model/recycl_view_model.dart';

class UsedItem extends StatefulWidget {
  static const String routeName = "UsedItem";
  CategoryData catData;

  UsedItem(this.catData, {super.key});

  @override
  State<UsedItem> createState() => _UsedItemState();
}

class _UsedItemState extends State<UsedItem> {
  late AllRecyclViewModel recyclVm;

  @override
  void initState() {
    super.initState();
    recyclVm = AllRecyclViewModel();
    widget.catData = FavoritesManager.getInstance().isFav(widget.catData);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    print("==========================================");
    print("Used item: print setstate");
    print(widget.catData.isfav);
    print("==========================================");
    return InkWell(
        // onTap: () {
        //   Navigator.pushNamed(context, UsedDetails.routeName, arguments: catData.id);
        // },
        child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  widget.catData.image!,
                  width: double.infinity,
                  height: 120,
                  fit: BoxFit.cover,
                ),
                Text(widget.catData.title ?? "",
                    style: theme.textTheme.labelMedium!.copyWith(fontSize: 12)),
                Text("EGP ${widget.catData.price ?? ""}",
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold)),
                Text(widget.catData.location ?? "",
                    style: theme.textTheme.bodySmall),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                        onTap: () async {
                          print("click");
                          print('click');
                          print(widget.catData.isfav);
                          if (widget.catData.isfav == false) {
                            await recyclVm.addtofav(widget.catData.id!);
                            widget.catData.isfav = !widget.catData.isfav!;
                          } else {
                            await recyclVm
                                .removeFromFav(widget.catData.fav_id!);
                            widget.catData.isfav = !widget.catData.isfav!;
                          }
                          setState(() {});
                        },
                        child: Image.asset(widget.catData.isfav == false
                            ? "assets/image/Icon fav.png"
                            : "assets/image/fav_icon_solid.png")),
                  ],
                ),
              ],
            )));
  }
}
