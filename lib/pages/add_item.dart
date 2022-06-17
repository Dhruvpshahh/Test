// import 'package:testx/widget/button_widget.dart';
// import 'package:testx/widget/date_picker_widget.dart';
// import 'package:testx/widget/date_range_picker_widget.dart';
// import 'package:testx/widget/datetime_picker_widget.dart';
// import 'package:testx/widget/time_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class date_try extends StatelessWidget {
  const date_try({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children:<Widget>[
            RaisedButton(onPressed: () => pickDate(context),
              child: Text('abc'),
              color: Colors.blue,
            ),
          ]
      ),
    );
  }
}

void setState(VoidCallback pickDate){}


Future pickDate(BuildContext context) async{
  DateTime date;

  final initialDate = DateTime.now();
  final newDate = await showDatePicker(context: context,
    initialDate: initialDate,
    firstDate: DateTime(DateTime.now().year-5),
    lastDate: DateTime(DateTime.now().year+5),
  );
  if(newDate==null) return;
  setState(()=>date=newDate);
}