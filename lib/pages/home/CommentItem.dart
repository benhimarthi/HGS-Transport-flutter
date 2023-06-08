import 'package:chatty/model/comment.item.model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../helper/helper_function.dart';
import '../../service/database_service.dart';

class CommentItem extends StatefulWidget {
  CommentItemModel commentItemModel;
  CommentItem({super.key, required this.commentItemModel});

  @override
  State<CommentItem> createState() => _CommentItemState(commentItemModel);
}

String nm = "";

class _CommentItemState extends State<CommentItem> {
  CommentItemModel _commentItemModel;
  _CommentItemState(this._commentItemModel);

  late DatabaseService databaseService;
  late FirebaseStorage storage;
  String url = "";

  Future<void> setImg(ref) async {
    url = await ref.getDownloadURL();
    setState(() {});
  }

  void setCommentItemPicLink() async {
    await DatabaseService()
        .gettingUserData(_commentItemModel.mailAddress)
        .then((valu) {
      _commentItemModel.setImgLinkValue(valu.docs[0]['profilePic']);
      nm = valu.docs[0]['profilePic'];
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setCommentItemPicLink();
    databaseService = DatabaseService(uid: HelperFunction.userInformations.uid);
    storage = FirebaseStorage.instance;

    if (nm != "") {
      Reference ref = storage.ref().child(nm);
      setImg(ref);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow()],
          borderRadius: BorderRadius.all(Radius.circular(10))),
      width: double.infinity,
      child: Column(
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.keyboard_control_rounded)),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  //color: Colors.amber,
                  height: 30,
                  width: 100,
                  child: Center(
                    child: Text(
                      _commentItemModel.date,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              nm == "" || url == ""
                  ? GestureDetector(
                      onTap: () {},
                      child: const CircleAvatar(
                        radius: 30,
                        /*backgroundImage:
                        AssetImage("assets/images/profile_image/naruto.jpg"),*/
                        child: Icon(
                          Icons.account_circle_sharp,
                          size: 60,
                          color: Color.fromARGB(115, 255, 255, 255),
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 5,
                                color: const Color.fromARGB(255, 53, 181, 222)),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(60),
                            )),
                        child: CircleAvatar(
                          radius: 30,
                          child: ClipOval(
                            child: Image.network(
                              url,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      /*CircleAvatar(
                        radius: 30,
                        child: ClipOval(
                            child: Image.network(
                          url,
                          fit: BoxFit.fill,
                        )),
                      ),*/
                    ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _commentItemModel.mailAddress,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 53, 181, 222),
                        fontSize: 20),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    _commentItemModel.name,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 43, 43, 43),
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              )
            ],
          ),
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width * .99,
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Text(
              _commentItemModel.content,
              overflow: TextOverflow.fade,
              style: const TextStyle(
                  color: Color.fromARGB(255, 29, 29, 29), fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}
