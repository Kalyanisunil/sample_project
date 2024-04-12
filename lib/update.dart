import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class UpdateDonor extends StatefulWidget {
  const UpdateDonor({super.key});

  @override
  State<UpdateDonor> createState() => _UpdateDonorState();
}

class _UpdateDonorState extends State<UpdateDonor> {
  TextEditingController donorPhone = TextEditingController();
  TextEditingController donorAge = TextEditingController();
  TextEditingController donorName = TextEditingController();
  // ignore: non_constant_identifier_names
  void Update(String docId) {
    print('Selected Group: $selectedGroup');
    print('Donor Name: ${donorName.text}');
    print('Donor Phone: ${donorPhone.text}');
    print('Donor Age: ${donorAge.text}');
    final data = {
      'name': donorName.text,
      'phone': donorPhone.text,
      'age': donorAge.text,
      'group': selectedGroup
    };
    donor.doc(docId).update(data).then((value) => Navigator.pop(context));
  }

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

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map?;
    donorName.text = args!['name'];
    donorAge.text = args['age'];
    donorPhone.text = args['phone'];
    selectedGroup = args['group'];
    final docId = args['id'];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Update Donors",
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
                    print(val);
                    setState(() {
                      selectedGroup = val as String?;
                    });
                  },
                  value: selectedGroup,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Object? data;
                  Update(docId);
                  // Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  minimumSize:
                      MaterialStateProperty.all(Size(double.infinity, 50)),
                  // other button styles
                ),
                child: const Text(
                  "Update",
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
