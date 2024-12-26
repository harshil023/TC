class UserListMaster {
  UserListMaster({
      this.page, 
      this.perPage, 
      this.totalrecord, 
      this.totalPages, 
      this.data,});

  UserListMaster.fromJson(dynamic json) {
    page = json['page'];
    perPage = json['per_page'];
    totalrecord = json['totalrecord'];
    totalPages = json['total_pages'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  num? page;
  num? perPage;
  num? totalrecord;
  num? totalPages;
  List<Data>? data;
UserListMaster copyWith({  num? page,
  num? perPage,
  num? totalrecord,
  num? totalPages,
  List<Data>? data,
}) => UserListMaster(  page: page ?? this.page,
  perPage: perPage ?? this.perPage,
  totalrecord: totalrecord ?? this.totalrecord,
  totalPages: totalPages ?? this.totalPages,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    map['per_page'] = perPage;
    map['totalrecord'] = totalrecord;
    map['total_pages'] = totalPages;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.name, 
      this.email, 
      this.profilepicture, 
      this.location, 
      this.createdat,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    profilepicture = json['profilepicture'];
    location = json['location'];
    createdat = json['createdat'];
  }
  num? id;
  String? name;
  String? email;
  String? profilepicture;
  String? location;
  String? createdat;
Data copyWith({  num? id,
  String? name,
  String? email,
  String? profilepicture,
  String? location,
  String? createdat,
}) => Data(  id: id ?? this.id,
  name: name ?? this.name,
  email: email ?? this.email,
  profilepicture: profilepicture ?? this.profilepicture,
  location: location ?? this.location,
  createdat: createdat ?? this.createdat,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['profilepicture'] = profilepicture;
    map['location'] = location;
    map['createdat'] = createdat;
    return map;
  }

}