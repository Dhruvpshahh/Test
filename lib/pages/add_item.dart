import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class DateTimePicker extends StatefulWidget {
  @override
  _DateTimePickerState createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  late double _height;
  late double _width;

  late String _setTime, _setDate;

  late String _hour, _minute, _time;

  late String dateTime;
  String? title;
  String? description;
  DateTime selectedDate = DateTime.now();

  TimeOfDay? selectedTime;
  DateTime? pickedDateTime;

  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        //initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        // firstDate: DateTime(2015),
        // lastDate: DateTime(2101));
        initialDate: DateTime.now().add(Duration(days: 1)),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 30)));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat.yMd().format(selectedDate);
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime!.hour.toString();
        _minute = selectedTime!.minute.toString();
        _time = _hour + ' : ' + _minute;
        _timeController.text = _time;
        _timeController.text = formatDate(
            DateTime(2019, 08, 1, selectedTime!.hour, selectedTime!.minute),
            [hh, ':', nn, " ", am]).toString();
      });
    if (selectedTime != null) {
      setState(() {
        pickedDateTime = DateTime(selectedDate.year, selectedDate.month,
            selectedDate.day, selectedTime!.hour, selectedTime!.minute);
      });
    }
  }

  var _image;
  var imagePicker;
  bool submitted = false;
  @override
  void initState() {
    _dateController.text = DateFormat.yMd().format(DateTime.now());

    _timeController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
    super.initState();
    imagePicker = new ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    dateTime = DateFormat.yMd().format(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add an item'),
      ),
      body: Container(
          width: _width,
          height: _height,
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              Column(
                children: <Widget>[
                  // SizedBox(
                  //   height: 52,
                  // ),
                  Center(
                    child: GestureDetector(
                      onTap: () async {
                        var source = ImageSource.gallery;
                        XFile image = await imagePicker.pickImage(
                            source: source,
                            imageQuality: 50,
                            preferredCameraDevice: CameraDevice.front);
                        setState(() {
                          _image = File(image.path);
                        });
                      },
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(color: Colors.white38),
                        child: _image != null
                            ? Image.file(
                                _image,
                                width: 200.0,
                                height: 200.0,
                                fit: BoxFit.fitHeight,
                              )
                            : Container(
                                decoration: BoxDecoration(color: Colors.grey),
                                width: 200,
                                height: 200,
                                child: Icon(
                                  Icons.image_rounded,
                                  color: Colors.grey[800],
                                ),
                              ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    onChanged: (value) {
                      title = value;
                    },
                    validator: (value) {
                      if (value == null || value == "")
                        return "This field cannot be null";
                    },
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.title),
                        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        hintText: "Title",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    onChanged: (value) {
                      description = value;
                    },
                    validator: (value) {
                      if (value == null || value == "")
                        return "This field cannot be null";
                    },
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.description_rounded),
                        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        hintText: "Description",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(crossAxisAlignment: CrossAxisAlignment.center, children: <
                  Widget>[
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: Container(
                          width: 100,
                          height: _height / 20,
                          margin: EdgeInsets.only(left: 20),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(color: Colors.blueAccent),
                          child: TextFormField(
                            style: TextStyle(fontSize: 15),
                            textAlign: TextAlign.center,
                            enabled: false,
                            keyboardType: TextInputType.text,
                            controller: _dateController,
                            onSaved: (String? val) {
                              _setDate = val!;
                            },
                            decoration: InputDecoration(
                                disabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                // labelText: 'Date',
                                contentPadding: EdgeInsets.only(bottom: 5.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          _selectTime(context);
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 20),
                          width: 100,
                          height: _height / 20,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(color: Colors.redAccent),
                          child: TextFormField(
                            style: TextStyle(fontSize: 15),
                            textAlign: TextAlign.center,
                            onSaved: (String? val) {
                              _setTime = val!;
                            },
                            enabled: false,
                            keyboardType: TextInputType.text,
                            controller: _timeController,
                            decoration: InputDecoration(
                                disabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
                                //labelText: 'Time',
                                hintText: 'Time',
                                contentPadding: EdgeInsets.only(bottom: 5)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
              SizedBox(height: 20),
              // Row(
              //   children: <Widget>[
              //     Material(
              //         elevation: 5,
              //         borderRadius: BorderRadius.circular(30),
              //         color: Colors.amber,
              //
              //   ],
              // ),
              new SizedBox(
                  width: 200.0,
                  height: 40.0,
                  child: ElevatedButton(
                      onPressed: () async {
                        const Center(
                          child: CircularProgressIndicator(),
                        );

                        if (submitted == true) return;
                        //bool validate = formKey.currentState!.validate();
                        // if (!validate) return;
                        if (_image == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Choose an image")));
                          return;
                        }
                        if (pickedDateTime == null) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text("Pick date and time for start auction")));
                          return;
                        }
                        if (title == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Title cannot be empty")));
                          return;
                        }
                        if (description == null) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Description cannot be empty")));
                          return;
                        }
                        submitted =
                            true; // setting the submission status to true now
                        var bytes = _image!.readAsBytesSync();
                        var headers = {
                          'Authorization': 'Client-ID f94d5cd3c5c3a07'
                        };
                        var request = http.MultipartRequest(
                            'POST', Uri.parse('https://api.imgur.com/3/image'));
                        request.fields.addAll({
                          'image': base64Encode(bytes),
                        });

                        request.headers.addAll(headers);

                        http.StreamedResponse response = await request.send();

                        if (response.statusCode == 200) {
                          var data = await response.stream.bytesToString();
                          print(data);
                          var body = jsonDecode(data);
                          print(body);
                          var imageURL = body["data"]["link"];
                          await FirebaseFirestore.instance
                              .collection('auction_items')
                              .add({
                            "title": title,
                            "description": description,
                            "imageURL": imageURL,
                            "timestamp": Timestamp.fromDate(pickedDateTime!),
                            //  "selectedtime": selectedTime,
                            "seller": FirebaseAuth.instance.currentUser!.email,
                            "bidPrice": 0,
                            "bidder": "",
                          });
                          // return Center(
                          //   child: CircularProgressIndicator(),
                          // );

                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text("Item added to future auctions")));
                          Navigator.pop(context);
                        } else {
                          submitted = false;
                          print(response.reasonPhrase);
                        }
                      },
                      child: Text("Add this Item"))
              )
            ],
          )),
    );
  }
}
