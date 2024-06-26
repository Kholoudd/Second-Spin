/// id : 124
/// title : "ladder"
/// description : "bikia to sell"
/// image : "http://secondspin.xyz/storage/app/public/2CjmgeQTfzS4nkl5hEy6NYuGEqrzNeev.jpg"
/// price : 103.03999999999999
/// created_at : "2024-06-16T16:17:41.000000Z"
/// story : null
/// location : "giza"
/// location_details : "el sheikh zayed"
/// category : "Recycle"
/// user : 6

class SellData {
  SellData({
      num? id, 
      String? title, 
      String? description, 
      String? image, 
      num? price,
      String? createdAt, 
      dynamic story, 
      String? location, 
      String? locationDetails, 
      String? category, 
      num? user,}){
    _id = id;
    _title = title;
    _description = description;
    _image = image;
    _price = price;
    _createdAt = createdAt;
    _story = story;
    _location = location;
    _locationDetails = locationDetails;
    _category = category;
    _user = user;
}

  SellData.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _image = json['image'];
    _price = json['price'];
    _createdAt = json['created_at'];
    _story = json['story'];
    _location = json['location'];
    _locationDetails = json['location_details'];
    _category = json['category'];
    _user = json['user'];
  }
  num? _id;
  String? _title;
  String? _description;
  String? _image;
  num? _price;
  String? _createdAt;
  dynamic _story;
  String? _location;
  String? _locationDetails;
  String? _category;
  num? _user;
SellData copyWith({  num? id,
  String? title,
  String? description,
  String? image,
  num? price,
  String? createdAt,
  dynamic story,
  String? location,
  String? locationDetails,
  String? category,
  num? user,
}) => SellData(  id: id ?? _id,
  title: title ?? _title,
  description: description ?? _description,
  image: image ?? _image,
  price: price ?? _price,
  createdAt: createdAt ?? _createdAt,
  story: story ?? _story,
  location: location ?? _location,
  locationDetails: locationDetails ?? _locationDetails,
  category: category ?? _category,
  user: user ?? _user,
);
  num? get id => _id;
  String? get title => _title;
  String? get description => _description;
  String? get image => _image;
  num? get price => _price;
  String? get createdAt => _createdAt;
  dynamic get story => _story;
  String? get location => _location;
  String? get locationDetails => _locationDetails;
  String? get category => _category;
  num? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['image'] = _image;
    map['price'] = _price;
    map['created_at'] = _createdAt;
    map['story'] = _story;
    map['location'] = _location;
    map['location_details'] = _locationDetails;
    map['category'] = _category;
    map['user'] = _user;
    return map;
  }

}