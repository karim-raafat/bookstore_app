class User {
  int userID;
  String name;
  String email;
  String password;
  UserType type;
  int libraryID=-1;

  User(
      {required this.libraryID,
        required this.userID,
      required this.name,
      required this.email,
      required this.password,
      required this.type,
      });
}

enum UserType {
  user,
  admin,
  librarian,
}
String toString (UserType ut){
 switch (ut) {
   case UserType.librarian : return 'librarian';
   case UserType.admin : return 'admin';
   default : return 'user';
 }
}
UserType toUT (String ut){
  switch (ut){
    case 'librarian' : return UserType.librarian;
    case 'admin' : return UserType.admin;
    default : return UserType.user;

  }
}