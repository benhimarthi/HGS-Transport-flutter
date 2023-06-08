import 'package:chatty/helper/helper_function.dart';
import 'package:chatty/model/comment.item.model.dart';
import 'package:chatty/pages/home/CommentItem.dart';
import 'package:chatty/pages/home/Home.dart';
import 'package:chatty/service/database_service.dart';
import 'package:chatty/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../model/driver.item.dart';

class CommentView extends StatefulWidget {
  DriverItemModel commentModel;
  CommentView({super.key, required this.commentModel});

  @override
  State<CommentView> createState() => _CommentViewState();
}

var noteRp = 0;

class _CommentViewState extends State<CommentView> {
  String content = "";

  void saveCommentToDB(CommentItemModel cmmt) async {
    await DatabaseService(uid: HelperFunction.userInformations.uid)
        .savingUserComment(cmmt)
        .then((value) {
      if (value == true) {
        showSnackbar(context, Colors.green[400],
            "your comment has been upload successfully");
        nextScreen(context, const HomePage());
      } else {
        showSnackbar(context, const Color.fromARGB(255, 227, 0, 0),
            "We couldn't upload your comment, please try after");
        nextScreen(context, const HomePage());
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * .9,
          height: MediaQuery.of(context).size.height * .6,
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Comment",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "How was your journey, give your opinion bellow",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            Container(
              width: double.infinity, //MediaQuery.of(context).size.width * .7,
              height: MediaQuery.of(context).size.height * .2,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    content = value;
                  });
                },
                decoration: const InputDecoration(border: InputBorder.none),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(5, (index) {
                  var ic = IconButton(
                      onPressed: () {
                        setState(() {
                          noteRp = index + 1;
                        });
                      },
                      icon: Icon(
                        noteRp > 0
                            ? (noteRp > 0.5
                                ? Icons.star
                                : Icons.star_half_sharp)
                            : Icons.star_border,
                        color: noteRp > 0 ? Colors.amber : Colors.grey,
                        size: 45,
                      ));
                  setState(() {});
                  noteRp -= 1;
                  return ic;
                }),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              elevation: 2,
              onPressed: () {
                //print(DateTime.now().toString().split(' ').first);

                CommentItemModel cmmt = CommentItemModel(
                  mailAddress: widget.commentModel.mailAddress,
                  date: DateTime.now().toString().split(' ').first,
                  content: content,
                  name: widget.commentModel.name,
                  authorUID: HelperFunction.userInformations.uid,
                );
                saveCommentToDB(cmmt);
              },
              child: Container(
                  width: 350,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.blue[800],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(50))),
                  child: const Center(
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  )),
            )
          ]),
        ),
      ),
    );
  }
}
