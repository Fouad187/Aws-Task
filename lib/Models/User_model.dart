class User {
  String key;
  String url;
  String name;
  String username;
  Pictures pictures;
  String biog;
  String createdTime;
  String updatedTime;
  int followerCount;
  int followingCount;
  int cloudcastCount;
  int favoriteCount;
  int listenCount;
  bool isPro;
  bool isPremium;
  String city;
  String country;
  CoverPictures coverPictures;
  String picturePrimaryColor;

  User(
      {this.key,
        this.url,
        this.name,
        this.username,
        this.pictures,
        this.biog,
        this.createdTime,
        this.updatedTime,
        this.followerCount,
        this.followingCount,
        this.cloudcastCount,
        this.favoriteCount,
        this.listenCount,
        this.isPro,
        this.isPremium,
        this.city,
        this.country,
        this.coverPictures,
        this.picturePrimaryColor});

  User.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    url = json['url'];
    name = json['name'];
    username = json['username'];
    pictures = json['pictures'] != null
        ? new Pictures.fromJson(json['pictures'])
        : null;
    biog = json['biog'];
    createdTime = json['created_time'];
    updatedTime = json['updated_time'];
    followerCount = json['follower_count'];
    followingCount = json['following_count'];
    cloudcastCount = json['cloudcast_count'];
    favoriteCount = json['favorite_count'];
    listenCount = json['listen_count'];
    isPro = json['is_pro'];
    isPremium = json['is_premium'];
    city = json['city'];
    country = json['country'];
    coverPictures = json['cover_pictures'] != null
        ? new CoverPictures.fromJson(json['cover_pictures'])
        : null;
    picturePrimaryColor = json['picture_primary_color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['url'] = this.url;
    data['name'] = this.name;
    data['username'] = this.username;
    if (this.pictures != null) {
      data['pictures'] = this.pictures.toJson();
    }
    data['biog'] = this.biog;
    data['created_time'] = this.createdTime;
    data['updated_time'] = this.updatedTime;
    data['follower_count'] = this.followerCount;
    data['following_count'] = this.followingCount;
    data['cloudcast_count'] = this.cloudcastCount;
    data['favorite_count'] = this.favoriteCount;
    data['listen_count'] = this.listenCount;
    data['is_pro'] = this.isPro;
    data['is_premium'] = this.isPremium;
    data['city'] = this.city;
    data['country'] = this.country;
    if (this.coverPictures != null) {
      data['cover_pictures'] = this.coverPictures.toJson();
    }
    data['picture_primary_color'] = this.picturePrimaryColor;
    return data;
  }
}

class Pictures {
  String small;
  String thumbnail;
  String mediumMobile;
  String medium;
  String large;
  String s320wx320h;
  String extraLarge;
  String s640wx640h;

  Pictures(
      {this.small,
        this.thumbnail,
        this.mediumMobile,
        this.medium,
        this.large,
        this.s320wx320h,
        this.extraLarge,
        this.s640wx640h});

  Pictures.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    thumbnail = json['thumbnail'];
    mediumMobile = json['medium_mobile'];
    medium = json['medium'];
    large = json['large'];
    s320wx320h = json['320wx320h'];
    extraLarge = json['extra_large'];
    s640wx640h = json['640wx640h'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this.small;
    data['thumbnail'] = this.thumbnail;
    data['medium_mobile'] = this.mediumMobile;
    data['medium'] = this.medium;
    data['large'] = this.large;
    data['320wx320h'] = this.s320wx320h;
    data['extra_large'] = this.extraLarge;
    data['640wx640h'] = this.s640wx640h;
    return data;
  }
}

class CoverPictures {
  String s835wx120h;
  String s1113wx160h;
  String s1670wx240h;

  CoverPictures({this.s835wx120h, this.s1113wx160h, this.s1670wx240h});

  CoverPictures.fromJson(Map<String, dynamic> json) {
    s835wx120h = json['835wx120h'];
    s1113wx160h = json['1113wx160h'];
    s1670wx240h = json['1670wx240h'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['835wx120h'] = this.s835wx120h;
    data['1113wx160h'] = this.s1113wx160h;
    data['1670wx240h'] = this.s1670wx240h;
    return data;
  }
}