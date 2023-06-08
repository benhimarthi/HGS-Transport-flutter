class UserInformation {
  String mailAddress;
  String name;
  String imageLink;
  String password;
  String uid;
  int statu;
  int mode;

  UserInformation(
      {required this.mailAddress,
      required this.statu,
      required this.name,
      required this.imageLink,
      required this.password,
      required this.uid,
      required this.mode});
}
