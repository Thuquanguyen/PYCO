import 'Profile.dart';

class ProfileFromApi {
  Info info;
  List<Result> results;

  ProfileFromApi({this.info, this.results});

  factory ProfileFromApi.fromJson(Map<String, dynamic> json) {
    return ProfileFromApi(
      info: json['info'] != null ? Info.fromJson(json['info']) : null,
      results: json['results'] != null ? (json['results'] as List).map((i) =>
          Result.fromJson(i)).toList() : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.info != null) {
      data['info'] = this.info.toJson();
    }
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }

  Profile toProfile() {
    return Profile(
        gender: results[0].gender,
        title: results[0].name.title,
        first: results[0].name.first,
        last: results[0].name.last,
        street: results[0].location.street,
        city: results[0].location.city,
        state: results[0].location.state,
        postcode: results[0].location.postcode,
        email: results[0].email,
        username: results[0].login.username
        ,
        password: results[0].login.password,
        salt: results[0].login.salt,
        md5: results[0].login.md5,
        sha1: results[0].login.sha1,
        sha256: results[0].login.sha256,
        dob: results[0].dob,
        registered: results[0].registered,
        phone: results[0].phone,
        cell: results[0].cell,
        name: results[0].id.name,
        value: results[0].id.value,
        large: results[0].picture.large,
        medium: results[0].picture.medium,
        thumbnail: results[0].picture.thumbnail,
        nat: results[0].nat,
        seed: info.seed,
        results: info.results,
        page: info.page,
        version: info.version);
  }
}

class Info {
  int page;
  int results;
  String seed;
  String version;

  Info({this.page, this.results, this.seed, this.version});

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      page: json['page'],
      results: json['results'],
      seed: json['seed'],
      version: json['version'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['results'] = this.results;
    data['seed'] = this.seed;
    data['version'] = this.version;
    return data;
  }
}

class Result {
  String cell;
  String dob;
  String email;
  String gender;
  Id id;
  Location location;
  Login login;
  Name name;
  String nat;
  String phone;
  Picture picture;
  String registered;

  Result(
      {this.cell, this.dob, this.email, this.gender, this.id, this.location, this.login, this.name, this.nat, this.phone, this.picture, this.registered});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      cell: json['cell'],
      dob: json['dob'],
      email: json['email'],
      gender: json['gender'],
      id: json['id'] != null ? Id.fromJson(json['id']) : null,
      location: json['location'] != null
          ? Location.fromJson(json['location'])
          : null,
      login: json['login'] != null ? Login.fromJson(json['login']) : null,
      name: json['name'] != null ? Name.fromJson(json['name']) : null,
      nat: json['nat'],
      phone: json['phone'],
      picture: json['picture'] != null
          ? Picture.fromJson(json['picture'])
          : null,
      registered: json['registered'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cell'] = this.cell;
    data['dob'] = this.dob;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['nat'] = this.nat;
    data['phone'] = this.phone;
    data['registered'] = this.registered;
    if (this.id != null) {
      data['id'] = this.id.toJson();
    }
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    if (this.login != null) {
      data['login'] = this.login.toJson();
    }
    if (this.name != null) {
      data['name'] = this.name.toJson();
    }
    if (this.picture != null) {
      data['picture'] = this.picture.toJson();
    }
    return data;
  }
}

class Id {
  String name;
  String value;

  Id({this.name, this.value});

  factory Id.fromJson(Map<String, dynamic> json) {
    return Id(
      name: json['name'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    return data;
  }
}

class Name {
  String first;
  String last;
  String title;

  Name({this.first, this.last, this.title});

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      first: json['first'],
      last: json['last'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;
    data['title'] = this.title;
    return data;
  }
}

class Location {
  String city;
  int postcode;
  String state;
  String street;

  Location({this.city, this.postcode, this.state, this.street});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      city: json['city'],
      postcode: json['postcode'],
      state: json['state'],
      street: json['street'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['postcode'] = this.postcode;
    data['state'] = this.state;
    data['street'] = this.street;
    return data;
  }
}

class Picture {
  String large;
  String medium;
  String thumbnail;

  Picture({this.large, this.medium, this.thumbnail});

  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(
      large: json['large'],
      medium: json['medium'],
      thumbnail: json['thumbnail'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['large'] = this.large;
    data['medium'] = this.medium;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}

class Login {
  String md5;
  String password;
  String salt;
  String sha1;
  String sha256;
  String username;

  Login(
      {this.md5, this.password, this.salt, this.sha1, this.sha256, this.username});

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      md5: json['md5'],
      password: json['password'],
      salt: json['salt'],
      sha1: json['sha1'],
      sha256: json['sha256'],
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['md5'] = this.md5;
    data['password'] = this.password;
    data['salt'] = this.salt;
    data['sha1'] = this.sha1;
    data['sha256'] = this.sha256;
    data['username'] = this.username;
    return data;
  }
}