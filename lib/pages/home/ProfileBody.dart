import 'package:flutter/material.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 53, 181, 222),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: 60,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        "Naruto.s@jpmanga.jp",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        "James potter",
                        textAlign: TextAlign.right,
                        style: TextStyle(fontWeight: FontWeight.w100),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        width: MediaQuery.of(context).size.width * .3,
                        height: 35,
                        decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 106, 106, 106),
                                  blurRadius: .5,
                                  offset: Offset(.08, .7))
                            ],
                            color: Color.fromARGB(255, 53, 181, 222),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: const Center(
                          child: Text(
                            "Edit profile",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                border: Border.all(
                  width: 2,
                  color: const Color.fromARGB(255, 53, 181, 222),
                )),
            child: GestureDetector(
              child: ListTile(
                leading: Icon(
                  Icons.credit_card,
                  color: Color.fromARGB(255, 53, 181, 222),
                ),
                title: Text("Payment mode"),
                trailing: Icon(
                  Icons.edit,
                  color: Color.fromARGB(255, 53, 181, 222),
                ),
              ),
            ),
          ),
          Container(
            //color: Colors.amber,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .6,
            margin: const EdgeInsets.all(5),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: const Text(
                    "My Opinions",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 76, 76, 76)),
                  ),
                ),
                SingleChildScrollView()
              ],
            ),
          )
        ],
      ),
    );
  }
}
