import 'package:flutter/material.dart';

class DatePickerTask extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Date Picker Task')),
        body: Center(
            child: Builder(
          builder: (con) => RaisedButton(
                textColor: Theme.of(context).accentTextTheme.display1.color,
                color: Theme.of(context).primaryColor,
                child: Text('Choose a starting date'),
                onPressed: () => showDatePicker(
                      context: con,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now().subtract(Duration(days: 30)),
                      lastDate: DateTime.now().add(Duration(days: 30)),
                    )
                        //After we choose a date from the picker we call out function with the chosen date
                        .then((DateTime val) => _generateNextDays(val)),
              ),
        )),
      ),
    );
  }

  _generateNextDays(DateTime startingDate) {
    print(startingDate);
     final int days = 5; //Test with 5,15,20

    //Implment your task in this function
    //If you need to, the docs for [DateTime] class from here:
    //  https://api.dartlang.org/stable/2.0.0/dart-core/DateTime-class.html


    //generate a list of DateTime based on the [startingDate] value
    //the list should contain all days after the [startingDate] value
    //the list should NOT contain fridays and saturdays
    //your code must be working with 5 days, 15 days or 20 days
    //for example if days=5  and the startingDate is 30/8/2018,
    //your list should have the four next days after the starting date,
    //while skippig fridays and saturdays

    //Your list will have 5, 15 or 20 items for each test case of [days]
  }
}