import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  TextEditingController donorPhone = TextEditingController();
  TextEditingController donorAge = TextEditingController();
  TextEditingController donorName = TextEditingController();
  final List<String> bloodgroups = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB-',
    'AB+',
    'O+',
    'O-'
  ];
  String? selectedGroup;
  final CollectionReference donor =
      FirebaseFirestore.instance.collection('donor');

  // TextEditingController donorPhone = TextEditingController();

  //add donor function
  void addDonor() {
    final donorData = {
      'name': donorName.text,
      'age': donorAge.text,
      'group': selectedGroup,
      'phone': '918874852'
    };
    donor.add(donorData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Donors",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: donorName,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Donor Name"),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: donorPhone,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Phone number"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: donorAge,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), label: Text("Age")),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: DropdownButtonFormField(
                    decoration:
                        InputDecoration(label: Text("Select blood group")),
                    items: bloodgroups
                        .map((e) => DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (val) {
                      selectedGroup = val as String;
                    }),
              ),
              ElevatedButton(
                onPressed: () {
                  addDonor();
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  minimumSize:
                      MaterialStateProperty.all(Size(double.infinity, 50)),
                  // other button styles
                ),
                child: const Text(
                  "Submit",
                  style: TextStyle(
                      fontSize: 15, color: Color.fromARGB(255, 251, 251, 251)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
