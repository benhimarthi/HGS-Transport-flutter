import 'package:chatty/service/database_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SearchUser extends StatefulWidget {
  const SearchUser({super.key});

  @override
  State<SearchUser> createState() => _SearchUserState();
}

class _SearchUserState extends State<SearchUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "SearchUser",
              ),
              onChanged: (value) {
                setState(() {
                  DatabaseService().findUserByHisStatut().then((vl) {
                    print("value founded : " + vl.docs.toString());
                  });
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
