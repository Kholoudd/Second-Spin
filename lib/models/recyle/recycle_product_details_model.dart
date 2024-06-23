class RecycleProductDetailsModel {
  String? message;
  ProdcuctData? data;
  bool? status;
  int? code;
  RecycleProductDetailsModel({this.message, this.data, this.status, this.code});
  RecycleProductDetailsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? ProdcuctData.fromJson(json['data']) : null;
    status = json['status'];
    code = json['code'];
  }
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['message'] = message;
  //   if (this.data != null) {
  //     data['data'] = this.data!.toJson();
  //   }
  //   data['status'] = status;
  //   data['code'] = code;
  //   return data;
  // }
}

class ProdcuctData {
  int? id;
  String? title;
  String? image;
  String? price;
  String? description;
  String? createdAt;
  void story;
  String? location;
  String? locationDetails;
  String? category;
  String? user;
  bool? isfav = false;
  bool? incart = false;
  int? fav_id;

  ProdcuctData({
    this.id,
    this.title,
    this.image,
    this.price,
    this.createdAt,
    this.story,
    this.location,
    this.locationDetails,
    this.category,
    this.description,
    this.user,
    this.isfav,
    this.incart,
    this.fav_id,
  });
  ProdcuctData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    price = json['price'];
    createdAt = json['created_at'];
    story = json['story'];
    location = json['location'];
    locationDetails = json['location_details'];
    category = json['category'];
    user = json['user'];
    description = json['description'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['id'] = id;
  //   data['title'] = title;
  //   data['image'] = image;
  //   data['price'] = price;
  //   data['created_at'] = createdAt;
  //   data['story'] = story;
  //   data['location'] = location;
  //   data['location_details'] = locationDetails;
  //   data['category'] = category;
  //   data['user'] = user;
  //   return data;
  // }
}
