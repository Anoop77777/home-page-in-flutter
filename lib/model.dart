class HomeModel {
  bool success;
  Pagination pagination;
  Data data;

  HomeModel({this.success, this.pagination, this.data});

  HomeModel.fromJson(Map<String, dynamic> json) {
    if (json["success"] is bool) this.success = json["success"];
    if (json["pagination"] is Map)
      this.pagination = json["pagination"] == null
          ? null
          : Pagination.fromJson(json["pagination"]);
    if (json["data"] is Map)
      this.data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["success"] = this.success;
    if (this.pagination != null) data["pagination"] = this.pagination.toJson();
    if (this.data != null) data["data"] = this.data.toJson();
    return data;
  }
}

class Data {
  Branch branch;
  List<dynamic> quick;
  List<Restaurant> restaurant;

  Data({this.branch, this.quick, this.restaurant});

  Data.fromJson(Map<String, dynamic> json) {
    if (json["branch"] is Map)
      this.branch =
          json["branch"] == null ? null : Branch.fromJson(json["branch"]);
    if (json["quick"] is List) this.quick = json["quick"] ?? [];
    if (json["restaurant"] is List)
      this.restaurant = json["restaurant"] == null
          ? null
          : (json["restaurant"] as List)
              .map((e) => Restaurant.fromJson(e))
              .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.branch != null) data["branch"] = this.branch.toJson();
    if (this.quick != null) data["quick"] = this.quick;
    if (this.restaurant != null)
      data["restaurant"] = this.restaurant.map((e) => e.toJson()).toList();
    return data;
  }
}

class Restaurant {
  String id;
  Location1 location;
  bool quickDelivery;
  bool storeStatus;
  String name;
  String branch;
  String storeBg;
  String openTime;
  String closeTime;
  String cuisine;
  int sortOrder;
  int avgPersonAmt;
  double distance;

  Restaurant(
      {this.id,
      this.location,
      this.quickDelivery,
      this.storeStatus,
      this.name,
      this.branch,
      this.storeBg,
      this.openTime,
      this.closeTime,
      this.cuisine,
      this.sortOrder,
      this.avgPersonAmt,
      this.distance});

  Restaurant.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) this.id = json["_id"];
    if (json["location"] is Map)
      this.location = json["location"] == null
          ? null
          : Location1.fromJson(json["location"]);
    if (json["quickDelivery"] is bool)
      this.quickDelivery = json["quickDelivery"];
    if (json["storeStatus"] is bool) this.storeStatus = json["storeStatus"];
    if (json["name"] is String) this.name = json["name"];
    if (json["branch"] is String) this.branch = json["branch"];
    if (json["storeBg"] is String) this.storeBg = json["storeBg"];
    if (json["openTime"] is String) this.openTime = json["openTime"];
    if (json["closeTime"] is String) this.closeTime = json["closeTime"];
    if (json["cuisine"] is String) this.cuisine = json["cuisine"];
    if (json["sortOrder"] is int) this.sortOrder = json["sortOrder"];
    if (json["avgPersonAmt"] is int) this.avgPersonAmt = json["avgPersonAmt"];
    if (json["distance"] is double) this.distance = json["distance"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["_id"] = this.id;
    if (this.location != null) data["location"] = this.location.toJson();
    data["quickDelivery"] = this.quickDelivery;
    data["storeStatus"] = this.storeStatus;
    data["name"] = this.name;
    data["branch"] = this.branch;
    data["storeBg"] = this.storeBg;
    data["openTime"] = this.openTime;
    data["closeTime"] = this.closeTime;
    data["cuisine"] = this.cuisine;
    data["sortOrder"] = this.sortOrder;
    data["avgPersonAmt"] = this.avgPersonAmt;
    data["distance"] = this.distance;
    return data;
  }
}

class Location1 {
  String address;

  Location1({this.address});

  Location1.fromJson(Map<String, dynamic> json) {
    if (json["address"] is String) this.address = json["address"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["address"] = this.address;
    return data;
  }
}

class Branch {
  String id;
  Location location;
  bool status;
  String name;
  int supportNumber;
  List<Category> category;
  List<dynamic> offers;
  List<BranchBanner> branchBanner;
  double distance;

  Branch(
      {this.id,
      this.location,
      this.status,
      this.name,
      this.supportNumber,
      this.category,
      this.offers,
      this.branchBanner,
      this.distance});

  Branch.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) this.id = json["_id"];
    if (json["location"] is Map)
      this.location =
          json["location"] == null ? null : Location.fromJson(json["location"]);
    if (json["status"] is bool) this.status = json["status"];
    if (json["name"] is String) this.name = json["name"];
    if (json["supportNumber"] is int)
      this.supportNumber = json["supportNumber"];
    if (json["category"] is List)
      this.category = json["category"] == null
          ? null
          : (json["category"] as List)
              .map((e) => Category.fromJson(e))
              .toList();
    if (json["offers"] is List) this.offers = json["offers"] ?? [];
    if (json["branchBanner"] is List)
      this.branchBanner = json["branchBanner"] == null
          ? null
          : (json["branchBanner"] as List)
              .map((e) => BranchBanner.fromJson(e))
              .toList();
    if (json["distance"] is double) this.distance = json["distance"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["_id"] = this.id;
    if (this.location != null) data["location"] = this.location.toJson();
    data["status"] = this.status;
    data["name"] = this.name;
    data["supportNumber"] = this.supportNumber;
    if (this.category != null)
      data["category"] = this.category.map((e) => e.toJson()).toList();
    if (this.offers != null) data["offers"] = this.offers;
    if (this.branchBanner != null)
      data["branchBanner"] = this.branchBanner.map((e) => e.toJson()).toList();
    data["distance"] = this.distance;
    return data;
  }
}

class BranchBanner {
  bool clickable;
  String id;
  String image;

  BranchBanner({this.clickable, this.id, this.image});

  BranchBanner.fromJson(Map<String, dynamic> json) {
    if (json["clickable"] is bool) this.clickable = json["clickable"];
    if (json["_id"] is String) this.id = json["_id"];
    if (json["image"] is String) this.image = json["image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["clickable"] = this.clickable;
    data["_id"] = this.id;
    data["image"] = this.image;
    return data;
  }
}

class Category {
  String id;
  String type;
  String image;
  String name;
  int v;

  Category({this.id, this.type, this.image, this.name, this.v});

  Category.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) this.id = json["_id"];
    if (json["type"] is String) this.type = json["type"];
    if (json["image"] is String) this.image = json["image"];
    if (json["name"] is String) this.name = json["name"];
    if (json["__v"] is int) this.v = json["__v"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["_id"] = this.id;
    data["type"] = this.type;
    data["image"] = this.image;
    data["name"] = this.name;
    data["__v"] = this.v;
    return data;
  }
}

class Location {
  String type;
  List<double> coordinates;
  String address;

  Location({this.type, this.coordinates, this.address});

  Location.fromJson(Map<String, dynamic> json) {
    if (json["type"] is String) this.type = json["type"];
    if (json["coordinates"] is List)
      this.coordinates = json["coordinates"] == null
          ? null
          : List<double>.from(json["coordinates"]);
    if (json["address"] is String) this.address = json["address"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["type"] = this.type;
    if (this.coordinates != null) data["coordinates"] = this.coordinates;
    data["address"] = this.address;
    return data;
  }
}

class Pagination {
  Pagination();

  Pagination.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    return data;
  }
}
