import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:core';

class Weather extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {


  var temp,desc,currently,humidity,wind;
  var coord,lat,lon;
  Future getWeather() async{
    var url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=Mapusa&appid=f9e5307a43298fa903fea3ec1ce61003');

    http.Response response = await http.get(url);
    // if (response.statusCode == 200) {
    //   return Data.fromJson(json.decode(response.body));
    // } else {
    //   throw Exception('Failed to Load...');
    // }
     print('response => $response');

     var result = jsonDecode(response.body);
     print('result => $result');

     setState(() {
       this.lon = result['coord']['lon'];
       this.lat = result['coord']['lat'];
       this.temp = result['main']['temp'];
       this.desc = result['weather'][0]['description'];
       this.currently = result['weather'][0]['main'];
       this.humidity = result['main']['humidity'];
       this.wind = result['wind']['speed'];

       if(temp!=null){
         temp=temp-273.15;
       }
     });
   // showInSnackBar("Some text");
    // ignore: deprecated_member_use
    Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text('Refreshed!')
    ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    this.getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height/3,
            width: MediaQuery.of(context).size.width,
            color: Colors.indigo,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
            Padding(padding: EdgeInsets.fromLTRB(10,10,10,10),
                child:Text('Currently in Goa',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w100
                ),
                ),
            ),
                Text(
                  temp != null ?  temp.toStringAsFixed(2) + "\u00B0c" : "Loading...",
                  //temp != null ?  temp.toString()-273.15 + "\u00B0" : "loading",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w100
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 10),
                  child:Text(
                    currently!=null ? currently.toString() : 'Loading...',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w100
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 10),
                  //child: Icon(),
                  child: ElevatedButton(
                    child:Icon(
                    FontAwesomeIcons.sync,
                    ),
                    onPressed: (){
                      getWeather();
                    },
                  ),
                  ),
              ],
            ),
          ),
          Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10,10,10,10),
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                        title: Text('Temperature'),
                        trailing:Text(temp!= null ? temp.toStringAsFixed(2) + "\u00B0c": 'Loading...'),
                      ),
                    ListTile(
                      leading: FaIcon(FontAwesomeIcons.cloud),
                      title: Text('Weather '),
                      trailing:Text(desc!= null ? desc.toString(): 'Loading...'),
                    ),
                    ListTile(
                      leading: FaIcon(FontAwesomeIcons.sun),
                      title: Text('Humidity'),
                      trailing:Text(humidity!= null ? humidity.toString(): 'Loading...'),
                    ),
                    ListTile(
                      leading: FaIcon(FontAwesomeIcons.wind),
                      title: Text('Wind Speed'),
                      trailing:Text(wind!= null ? wind.toString(): 'Loading...'),
                    ),
                    //====================================================================================//
                    ExpansionTile(
                      title:Text('Coordinates'),
                      children:[
                        ListView(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          children: <Widget>[
                            ListTile(
                              leading: Text('Latitude'),
                              trailing: Text(lat!= null ? lat.toString(): 'Loading...'),
                            ),
                            ListTile(
                              leading: Text('Longitude'),
                              trailing: Text(lon!= null ? lon.toString(): 'Loading...'),
                            )
                          ],
                      )
                      ],
                    ),
                  ],

                ),
              ))
        ],
      ),
    );
  }

  void showInSnackBar(String s) {
    Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text(s)
    ));
  }
}
