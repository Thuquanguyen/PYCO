
class Profile {
  String seed;
  String cell;
  String dob;
  String email;
  String gender;
  String city;
  String state;
  String street;
  String zip;
  String md5;
  String first;
  String last;
  String title;
  String password;
  String phone;
  String picture;
  String registered;
  String sSN;
  String salt;
  String sha1;
  String sha256;
  String username;
  String version;

  Profile(
      {this.seed, this.cell, this.dob, this.email, this.gender, this.city, this.state, this.street, this.zip, this.md5,
        this.first, this.last, this.title, this.password, this.phone, this.picture, this.registered, this.sSN, this.salt, this.sha1, this.sha256, this.username, this.version});

  Map<String, dynamic> toMap() {
    return {
      'seed': this.seed,
      'email': this.email,
      'first': this.first,
      'last': this.last,
      'title': this.title,
      'picture': this.picture,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return new Profile(
      seed: map['seed'] as String,
      email: map['email'] as String,
      first: map['first'] as String,
      last: map['last'] as String,
      title: map['title'] as String,
      picture: map['picture'] as String,
    );
  }
}
