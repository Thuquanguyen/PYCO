
class Profile {
  String gender;
  String title;
  String first;
  String last;
  String street;
  String city;
  String state;
  int postcode;
  String email;
  String username;
  String password;
  String salt;
  String md5;
  String sha1;
  String sha256;
  String dob;
  String registered;
  String phone;
  String cell;
  String name;
  String value;
  String large;
  String medium;
  String thumbnail;
  String nat;
  String seed;
  int results;
  int page;
  String version;

  Profile(
      {this.gender, this.title, this.first, this.last, this.street, this.city, this.state, this.postcode, this.email, this.username, this.password, this.salt, this.md5, this.sha1,
        this.sha256, this.dob, this.registered, this.phone, this.cell, this.name, this.value, this.large, this.medium, this.thumbnail, this.nat, this.seed, this.results, this.page, this.version});

  Map<String, dynamic> toMap() {
    return {
      'seed': this.seed,
      'email': this.email,
      'first': this.first,
      'last': this.last,
      'title': this.title,
      'large': this.large,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return new Profile(
      seed: map['seed'] as String,
      email: map['email'] as String,
      first: map['first'] as String,
      last: map['last'] as String,
      title: map['title'] as String,
      large: map['large'] as String,
    );
  }
}
