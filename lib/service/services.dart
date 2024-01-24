import 'dart:js';

import 'package:bmipackage/model/model_api_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:core';

class Services extends ChangeNotifier{

  var temp,desc,currently,humidity,wind;
  var coord,lat,lon;

  model_api_response responseData;

  Future<model_api_response> getWeather() async{
    var url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=Mapusa&appid=f9e5307a43298fa903fea3ec1ce61003');
    var result;
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        //return Data.fromJson(json.decode(response.body));
        result = jsonDecode(response.body);
        print('result => $result');
        responseData = model_api_response.fromJson(result);
      } else {
        throw Exception();
      }
      print('response => $response');
    }catch(e){
      print(e.toString());
    }




    //setState(() {
      /*this.lon = result['coord']['lon'];
      this.lat = result['coord']['lat'];
      this.temp = result['main']['temp'];
      this.desc = result['weather'][0]['description'];
      this.currently = result['weather'][0]['main'];
      this.humidity = result['main']['humidity'];
      //this.wind = result['wind']['speed'];
      this.wind = responseData.wind.speed;*/

      /*this.lon = result['coord']['lon'];
      this.lat = result['coord']['lat'];
      this.temp = result['main']['temp'];
      this.desc = result['weather'][0]['description'];
      this.currently = result['weather'][0]['main'];
      this.humidity = result['main']['humidity'];
      //this.wind = result['wind']['speed'];
      this.wind = responseData.wind.speed;*/

      if(temp!=null && wind!=null){
        temp=temp-273.15;
        wind=wind*3.6;
      }
    //});
    // showInSnackBar("Some text");
    // ignore: deprecated_member_use
    // Scaffold.of(context).showSnackBar(new SnackBar(
    //     content: new Text('Refreshed!')
    // ));


    return responseData;
  }
}