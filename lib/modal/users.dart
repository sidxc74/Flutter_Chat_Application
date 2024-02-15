class Users {
  String ? name;
  String ? email;
  String ? uid;
  bool isOnline;
  String ? password;
  String ? profilePhoto;

  Users(
    this.name,
    this.email,
    this.uid,
    this.isOnline,
    this.password,
    this.profilePhoto
  );

  factory Users.fromJson(Map<String, dynamic> json){
    return Users(
      json['name'],
      json['email'],
      json['uid'],
      json['password'],
      json['isOnline'],
      json['profilePhoto']

    );

  }

   Map<String , dynamic> toJson(){
      return {
        "name" : name,
        "email" : email,
        "uid" : uid,
        "password" : password,
        "isOnline" : isOnline,
        "profilePhoto" : profilePhoto,
      };
    }




}