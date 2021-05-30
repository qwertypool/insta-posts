import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimePicker extends StatefulWidget {
  @override
  _DateTimePickerState createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  double _height;
  double _width;
  String _setTime, _setDate;
  String _hour, _minute, _time;
  String dateTime;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        helpText: 'Choose your booking date',
        cancelText: 'Not now',
        confirmText: 'Confirm',
        errorFormatText: 'Please enter valid date',
        errorInvalidText: 'Enter date in valid range',
        fieldLabelText: 'Booking date',
        fieldHintText: 'Month/Date/Year',
        );
    if (picked != null)
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat.yMd().format(selectedDate);
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ' : ' + _minute;
        _timeController.text = _time;
        _timeController.text = formatDate(
            DateTime(2021, 05, 28, selectedTime.hour, selectedTime.minute),
            [hh, ':', nn, " ", am]).toString();
      });
  }

  @override
  void initState() {
    _dateController.text = DateFormat.yMd().format(DateTime.now());
    _timeController.text = formatDate(
        DateTime(2021, 05, 28, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    dateTime = DateFormat.yMd().format(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Date time picker'),
      ),
      body: Container(
        width: _width,
        height: _height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: <Widget>[
                RawMaterialButton(
                  elevation: 12,
                  constraints: BoxConstraints(
                    minHeight: 50,
                    maxWidth: 150,
                  ),
                  onPressed: () {
                    _selectDate(context);
                  },
                  fillColor: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.alarm,color: Colors.white,),
                      Text(' Pick Date',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white),),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1.5,color: Colors.black),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  ),
                InkWell(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: Container(
                    width: _width / 1.7,
                    height: _height / 9,
                    margin: EdgeInsets.only(top: 30),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.black,width: 1.5),
                      borderRadius: BorderRadius.circular(5)
                      ),
                    child: TextFormField(
                      style: TextStyle(fontSize: 30,letterSpacing: 1.5,color: Colors.black),
                      textAlign: TextAlign.center,
                      enabled: false,
                      keyboardType: TextInputType.text,
                      controller: _dateController,
                      onSaved: (String val) {
                        _setDate = val;
                      },
                      decoration: InputDecoration(
                          disabledBorder:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                          contentPadding: EdgeInsets.only(top: 0.0)),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
              
                RawMaterialButton(
                  elevation: 10,
                  constraints: BoxConstraints(
                    minHeight: 50,
                    maxWidth: 150,
                  ),
                  onPressed: () {
                    _selectTime(context);
                  },
                  fillColor: Colors.amber,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.alarm,color: Colors.black,),
                      Text(' Pick time',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1.5,color: Colors.black),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  ),
                InkWell(
                  onTap: () {
                    _selectTime(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 30),
                    width: _width / 1.7,
                    height: _height / 9,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Colors.grey[200],
                    border: Border.all(color: Colors.black,width: 1.5),
                    borderRadius: BorderRadius.circular(5)
                    ),
                    child: TextFormField(
                      style: TextStyle(fontSize: 30,letterSpacing: 2,color: Colors.black),
                      textAlign: TextAlign.center,
                      onSaved: (String val) {
                        _setTime = val;
                      },
                      enabled: false,
                      keyboardType: TextInputType.text,
                      controller: _timeController,
                      decoration: InputDecoration(
                          disabledBorder:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                          contentPadding: EdgeInsets.all(5)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
