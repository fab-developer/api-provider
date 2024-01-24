import 'package:bmipackage/bmicalc_provider.dart';
import 'package:bmipackage/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:provider/provider.dart';

import 'getMonthYear.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({Key key}) : super(key: key);

  //@override
  //_DatePickerState createState() => _DatePickerState();

  

  @override
  Widget build(BuildContext context) {
    

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Provider',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: new _DatePickerState(),
    );
  }

//static void showDatePicker(context, {DateTime maxDateTime, String dateFormat}) {}
}

class _DatePickerState extends StatelessWidget/*<DatePicker>*/ {

 
  //var currentYear,currentMonth;

  /*final List<Widget> entries = List<Widget>.generate(12, (i) => Card(
      color: Colors.indigo,
      child: Center(
        child: Text(
          "Item ${i + 1}",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  );

  final List<Widget> entries2 = List<Widget>.generate(3, (i) => Card(
    color: Colors.white,
    child: Center(
      child: Text(
        "${i + 1}",
        style: TextStyle(color: Colors.indigo),
      ),
    ),
  ),
  );*/




  /*Card getMonths(String month)
  {
    var date = new DateTime.now().toString();
    var dateParse = DateTime.parse(date);
    var currentMonth = "${dateParse.month}";
    print(currentMonth);
    return Card(
      color: Colors.indigo,
      child: Center(
        child: Text(
          month,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }*/

  /*final List<String> years = ['2020','2021','2022'];

  Card getYear(String year)
  {
    var date = new DateTime.now().toString();
    var dateParse = DateTime.parse(date);
    var currentYear = "${dateParse.year}";
    print(currentYear);
    return Card(
    color: Colors.white,
    child: Center(
      child: Text(
        year,
        style: TextStyle(color: Colors.indigo),
      ),
    ),
  );
    }*/


  

  @override
  Widget build(BuildContext context) {
    
    var monthyear = Provider.of<SelectProvider>(context);

    

    var date = new DateTime.now().toString();
    var dateParse = DateTime.parse(date);
    String previousYearS = "${dateParse.year-1}";
    int previousYear = int.parse(previousYearS);
    int currentMonth = dateParse.month;
    print(currentMonth);
    print(dateParse.year);
    print(previousYear);

    /*String saveDate = '2020-04-16';
    DateFormat format = new DateFormat("yyyy-MM-dd");
    var dateParse2 = format.parse(saveDate);
    print('dateParse2=>$dateParse2');

    DateTime dateTime= dateParse2;
    String savedMonth = dateTime.month.toString();
    String savedYear = dateTime.year.toString();

    print("savedList==$savedYear");
    if('4'== savedMonth && '2020' == savedYear){
      print('SAME');
      //rogspSvedList.add(element);
    }*/




    
    //monthyear.thismonth. = currentMonth ;


    return Scaffold(
      appBar: AppBar(
        title: Text("DatePicker"),
      ),
      body: Consumer<SelectProvider>(
        builder: (context,monthyear,_){
         return SizedBox(
           //width: 250,
           //height: 250,
           child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: ListWheelScrollView(
                            itemExtent: 50,
                            controller: monthyear.thismonth,
                            //diameterRatio: 5.5,
                            //magnification: 5.0,
                            // clipToSize: true,

                            children: [
                              //for(String month in months)
                              for(int j=0; j<12;j++)
                                getMonths(j),
                            ]
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ListWheelScrollView(

                          itemExtent: 50,
                          controller: monthyear.thisyear,
                          //diameterRatio: 5.5,
                          //magnification: 5.0,
                          // clipToSize: true,
                          children: [
                            for(int i = 0; i<3 ; i++)
                              getYear(previousYear, i),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // TextButton(
                //   child: Text('Download',
                //     style: TextStyle(
                //       backgroundColor: Colors.white,
                //     ),),
                //   onPressed: (){
                //     print(currentMonth);
                //     print(previousYear+1);
                //
                //   },
                // )
              ],
            ),
         );
        }
      ),

    );
      // Column(
      //   children: <Widget>[
      //     Container(
      //       child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           children: <Widget>[
      //             Padding(
      //               padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      //               child: ElevatedButton(
      //                 child: Text('Download MTP'),
      //                 onPressed: () async {
      //                   /*DateTime newDateTime = await showRoundedDatePicker(
      //     height:  MediaQuery.of(context).size.height/4,
      //     context: context,
      //     initialDatePickerMode: DatePickerMode.year,
      //     theme: ThemeData(primarySwatch: Colors.indigo),
      //   );*/
      //
      //                   //showAlertDialog(context);
      //
      //                   final selMonthYear = await simple(context);
      //                   print("Selected  $selMonthYear");
      //                 },
      //               ),
      //             ),
      //           ]),
      //     ),
      //   ],
      // ),
    //);
  }
}

