import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CollectionReference donor =
      FirebaseFirestore.instance.collection('donor');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Blood Donation",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.white,
      body: StreamBuilder<QuerySnapshot>(
        stream: donor.orderBy('name').snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot donorSnap = snapshot.data.docs[index];
                return Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red.shade100,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 10,
                              spreadRadius: 10),
                        ]),
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: CircleAvatar(
                              radius: 30,
                              child: Text(
                                donorSnap['group'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              backgroundColor: Colors.red.shade500,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(donorSnap['name'],
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            Text(donorSnap['phone'].toString()),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.edit,
                                color: Colors.blue,
                              ),
                              iconSize: 30,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              iconSize: 30,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        },
        //   List<Row> donorWidgets = [];
        //   if (snapshot.hasData) {
        //     final donor = snapshot.data?.docs.reversed.toList();
        //     for (var don in donor!) {
        //       final donorWidget = Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Padding(
        //             padding: const EdgeInsets.all(8.0),
        //             child: Text(don['name']),
        //           ),
        //           Padding(
        //             padding: const EdgeInsets.all(8.0),
        //             child: Text(don['age'].toString()),
        //           ),
        //           Padding(
        //             padding: const EdgeInsets.all(8.0),
        //             child: Text(don['group']),
        //           ),
        //           Padding(
        //             padding: const EdgeInsets.all(8.0),
        //             child: Text(don['phone'].toString()),
        //           ),
        //         ],
        //       );
        //       donorWidgets.add(donorWidget as Row);
        //     }
        //   }

        //   return ListView(
        //     children: donorWidgets,
        //   );
        // }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        backgroundColor: Colors.red,
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
