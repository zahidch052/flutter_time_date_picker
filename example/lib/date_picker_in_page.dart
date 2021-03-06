import 'package:flutter/material.dart';

import 'package:flutter_time_date_picker/flutter_time_date_picker.dart';

///
/// @author dylan wu
/// @since 2019-05-10
class DatePickerInPage extends StatefulWidget {
  const DatePickerInPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DatePickerInPageState();
}

const String MIN_DATETIME = '2010-05-12';
const String MAX_DATETIME = '2021-11-25';
const String INIT_DATETIME = '2019-05-17';
const String DATE_FORMAT = 'MM月|d日,yyyy年';

class _DatePickerInPageState extends State<DatePickerInPage> {
  DateTime _dateTime;

  @override
  void initState() {
    super.initState();
    _dateTime = DateTime.parse(INIT_DATETIME);
  }

  @override
  Widget build(BuildContext context) {
   final TextStyle hintTextStyle =
        Theme.of(context).textTheme.subhead.apply(color: const Color(0xFF999999));
    return Scaffold(
      appBar: AppBar(title: const Text('DatePicker In Page')),
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // min datetime hint
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 115.0,
                    child: Text('min DateTime:', style: hintTextStyle),
                  ),
                  Text(MIN_DATETIME,
                      style: Theme.of(context).textTheme.subhead),
                ],
              ),
            ),

            // max datetime hint
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: <Widget>[
                  Container(
                      width: 115.0,
                      child: Text('max DateTime:', style: hintTextStyle)),
                  Text(MAX_DATETIME,
                      style: Theme.of(context).textTheme.subhead),
                ],
              ),
            ),

            // init datetime hint
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 115.0,
                    child: Text('init DateTime:', style: hintTextStyle),
                  ),
                  Text(INIT_DATETIME,
                      style: Theme.of(context).textTheme.subhead),
                ],
              ),
            ),

            // date format
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 115.0,
                    child: Text('Date Format:', style: hintTextStyle),
                  ),
                  Text(DATE_FORMAT, style: Theme.of(context).textTheme.subhead),
                ],
              ),
            ),

            // date picker theme
            GestureDetector(
              onTap: () {
                showDialog<dynamic>(
                  context: context,
                  builder: (_) =>  AlertDialog(
                    titlePadding: const EdgeInsets.only(left: 16.0, top: 16.0),
                    title:  const Text('DateTimePickerTheme'),
                    contentPadding: const EdgeInsets.all(16.0),
                    content:  const Text(
                      '''
DateTimePickerTheme(
        backgroundColor: Color(0xFF80cbc4),
        cancelTextStyle: TextStyle(color: Colors.white),
        confirmTextStyle: TextStyle(color: Colors.black),
        itemTextStyle: TextStyle(color: Colors.deepOrange),
        pickerHeight: 300.0,
        titleHeight: 24.0,
        itemHeight: 30.0,
)
                    ''',
                      style:  TextStyle(fontSize: 14.0),
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child:  const Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      child:
                          Text('DateTimePickerTheme  ', style: hintTextStyle),
                    ),
                    Icon(Icons.remove_red_eye, color: const Color(0xFF03a9f4)),
                  ],
                ),
              ),
            ),

            // date picker widget
            Container(
              margin: const EdgeInsets.only(top: 24.0, bottom: 40.0),
              child: DatePickerWidget(
                minDateTime: DateTime.parse(MIN_DATETIME),
                maxDateTime: DateTime.parse(MAX_DATETIME),
                initialDateTime: DateTime.parse(INIT_DATETIME),
                dateFormat: DATE_FORMAT,
                pickerTheme: DateTimePickerTheme(
                  backgroundColor: const Color(0xFFb2dfdb),
                  cancelTextStyle: const TextStyle(color: Colors.white),
                  confirmTextStyle: TextStyle(color: Colors.black),
                  itemTextStyle: TextStyle(color: Colors.deepOrange),
                  pickerHeight: 300.0,
                  titleHeight: 24.0,
                  itemHeight: 30.0,
                ),
                onChange: (dateTime, selectedIndex) {
                  setState(() {
                    _dateTime = dateTime;
                  });
                },
              ),
            ),

            // selected date
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('Selected Date:',
                    style: Theme.of(context).textTheme.subhead),
                Container(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    _dateTime != null
                        ? '${_dateTime.year}-${_dateTime.month.toString().padLeft(2, '0')}-${_dateTime.day.toString().padLeft(2, '0')}'
                        : '',
                    style: Theme.of(context).textTheme.title,
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
