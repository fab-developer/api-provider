

import 'package:bmi/bmi.dart';
import 'package:bmipackage/provider.dart';
import 'package:bmipackage/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

import 'date_picker.dart';
import 'listprovider.dart';


class BmiCalculationPage extends HookWidget {

  int selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void onItemTapped(int index) {
    //setState(() {
      print('INDEX=>');
      print(index);
      selectedIndex = index;
    //});
  }

  void _update({
    ValueNotifier<TextEditingValue> widthController,
    ValueNotifier<TextEditingValue> heightController,
    ValueNotifier<TextEditingValue> bmiController,
  }) {
    final weight = double.tryParse(widthController.value.text);
    final height = double.tryParse(heightController.value.text);
    if (weight != null && height != null) {
      final bmi = calculateBMI(weight, height);
      final formatted = formattedBmi(bmi);
      bmiController.value = TextEditingValue(text: formatted);
    } else {
      bmiController.value = TextEditingValue(text: '');
    }
  }

  @override
  Widget build(BuildContext context) {
    final weightController = useTextEditingController();
    final heightController = useTextEditingController();
    final bmiController = useTextEditingController();
    //bool show=false;
    //var showPop = Provider.of<SelectProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      drawer:Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header',
                   style:TextStyle(color: Colors.white,
                   fontSize:20,
                   ),
              ),
              decoration: BoxDecoration(
                color: Colors.indigo,
              ),
            ),
            ListTile(
              title: Text('Go to Provider'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(context,MaterialPageRoute(builder: (context) => ListProvider()),);
                //Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Check Weather'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(context,MaterialPageRoute(builder: (context) => Weather()),);
                //Navigator.pop(context);
              },
            ),
            Container(
              color: Colors.black,
              width: double.infinity,
              height: 0.1,
            ),
            Container(
                child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Column(
                      children: <Widget>[
                        //Divider(),
                        ListTile(
                            leading: Icon(Icons.settings),
                            title: Text('DatePicker'),
                        onTap:(){
                          Navigator.push(context,MaterialPageRoute(builder: (context) => DatePicker()),);
                        },
                        ),
                        ListTile(
                            leading: Icon(Icons.help),
                            title: Text('Instagram'))
                      ],
                    ))),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.indigo,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.indigo,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.indigo,
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.indigo,
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.white,
        onTap: onItemTapped,
          //provider.onItemTapped(provider.selectedIndex),
      ),
      body: Consumer<SelectProvider>(
       builder: (context, showPop, _){
         return Container(
           child: Column(
             children: [
               Container(
                 padding: const EdgeInsets.all(16),
                 child: Column(
                   children: [
                     TextField(
                       controller: weightController,
                       decoration: InputDecoration(labelText: 'Weight (kg)'),
                       keyboardType: TextInputType.number,
                       onChanged: (_) => _update(
                           widthController: weightController,
                           heightController: heightController,
                           bmiController: bmiController),
                       onEditingComplete: () => FocusScope.of(context).nextFocus(),
                     ),
                     TextField(
                       controller: heightController,
                       decoration: InputDecoration(labelText: 'Height (m)'),
                       keyboardType: TextInputType.number,
                       onChanged: (_) => _update(
                           widthController: weightController,
                           heightController: heightController,
                           bmiController: bmiController),
                     ),
                     TextField(
                       controller: bmiController,
                       decoration: InputDecoration(labelText: 'BMI'),
                       readOnly: true,
                     ),
                     showPop.show?
                     SizedBox(
                       height: 250,
                       width: 250,
                       child: Visibility(
                           visible: showPop.show,
                           child: DatePicker()),
                     ):Container(),
                     TextButton(
                       style: ButtonStyle(
                         foregroundColor: MaterialStateProperty.all<Color>(Colors.indigo),
                       ),
                       onPressed: () {
                         //Navigator.push(context,MaterialPageRoute(builder: (context) => DatePicker()),);
                         showPop.setDisplay(true);

                       },
                       child: Text('Download'),
                     )
                   ],
                 ),
               ),
             ],
           ),
         );
       }

      ),
    );
  }

}


