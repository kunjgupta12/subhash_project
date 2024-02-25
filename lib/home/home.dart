import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/auth/auth_controller.dart';

import 'custom_iconbutton.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var pen, pencil, books;
  var setDefaultMake = true, setDefaultMakeModel = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('Home'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(25.0),
              child: Text(
                'Subhash Stationery',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontSize: 25),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Pen', style: cat),
                  const Padding(
                    padding: EdgeInsets.all(40.0),
                    child: Text('||'),
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('inventory')
                        .orderBy('name')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) return Container();

                      return DropdownButton(
                        isExpanded: false,
                        value: pen,
                        items: snapshot.data?.docs.map((value) {
                          return DropdownMenuItem(
                            value: value.get('name'),
                            child: Text('${value.get('name')}'),
                          );
                        }).toList(),
                        onChanged: (value) {
                          debugPrint('selected onchange: $value');
                          setState(
                            () {
                              debugPrint('make selected: $value');
                              // Selected value will be stored
                              pen = value;
                              // Default dropdown value won't be displayed anymore
                            },
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Pencil', style: cat),
                const Padding(
                  padding: EdgeInsets.all(40.0),
                  child: Text('||'),
                ),
                Center(
                    child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('inventory')
                      .orderBy('name')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) return Container();

                    return DropdownButton(
                      isExpanded: false,
                      value: pencil,
                      items: snapshot.data?.docs.map((value) {
                        return DropdownMenuItem(
                          value: value.get('name'),
                          child: Text('${value.get('name')}'),
                        );
                      }).toList(),
                      onChanged: (value) {
                        debugPrint('selected onchange: $value');
                        setState(
                          () {
                            debugPrint('make selected: $value');
                            // Selected value will be stored
                            pencil = value;
                            // Default dropdown value won't be displayed anymore
                          },
                        );
                      },
                    );
                  },
                )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Books', style: cat),
                const Padding(
                  padding: EdgeInsets.all(40.0),
                  child: Text('||'),
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('inventory')
                      .orderBy('name')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) return Container();

                    return DropdownButton(
                      isExpanded: false,
                      value: books,
                      items: snapshot.data?.docs.map((value) {
                        return DropdownMenuItem(
                          value: value.get('name'),
                          child: Text('${value.get('name')}'),
                        );
                      }).toList(),
                      onChanged: (value) {
                        debugPrint('selected onchange: $value');
                        setState(
                          () {
                            debugPrint('make selected: $value');
                            // Selected value will be stored
                            books = value;
                            // Default dropdown value won't be displayed anymore
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            InkWell(
              onTap: () {
                FirebaseFirestore.instance
                    .collection('status')
                    .doc(FirebaseAuth.instance.currentUser!.email.toString())
                    .set({'pen': pen, "pencil": pencil, 'books': books});
              },
              child: const CustomIconButton(
                text: 'Submit',
                bgColor: Colors.grey,
                imageOrIconColor: Colors.white,
                imageOrIconRadius: 20,
              ),
            ),
            const SizedBox(
              height: 75,
            ),
            InkWell(
              onTap: () {
                AuthController.instance.Logout();
              },
              child: const CustomIconButton(
                text: 'Logout',
                bgColor: Colors.grey,
                imageOrIconColor: Colors.white,
                imageOrIconRadius: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
