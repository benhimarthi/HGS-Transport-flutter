class CommentItemModel {
  late String imageLink = '';
  String mailAddress;
  String date;
  String content;
  String authorUID;
  String name;

  CommentItemModel({
    required this.mailAddress,
    required this.date,
    required this.content,
    required this.name,
    required this.authorUID,
  });

  factory CommentItemModel.fromJson(json) {
    return CommentItemModel(
      mailAddress: json['target_mail_address'],
      date: json['date'],
      content: json['comment'],
      name: json['name'],
      authorUID: json['author_uid'],
    );
  }

  setImgLinkValue(String value) {
    imageLink = value;
  }
}
