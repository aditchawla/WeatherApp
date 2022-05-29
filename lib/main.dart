import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'model.dart';




Future<WeatherInfo> fetchWeather(@required String cityname) async{
  final apikey="3ab7648ea5f0e06082946cda0e39076b";
  final requestUrl='https://api.openweathermap.org/data/2.5/weather?q=$cityname&units=metric&appid=$apikey';
  final response=await http.get(Uri.parse(requestUrl));
  print(cityname);
  if(response.statusCode==200){
    return WeatherInfo.fromJson(jsonDecode(response.body));
}
else{
  throw Exception("Error loading request URL info.");
}
}




class WeatherInfo{
  final Location;
  final  temp;
  final tempmin;
  final tempmax;
  final weather;
  final weathericon;

  WeatherInfo({
    this.Location,
     this.temp,
     this.tempmax,
     this.tempmin,
     this.weather,
     this.weathericon,
  });

  factory WeatherInfo.fromJson(Map<String, dynamic>json) {
    return WeatherInfo(
      Location: json['name'],
      temp:json['main']['temp'],
      tempmin: json['main']['temp_min'],
      tempmax: json['main']['temp_max'],
      weather: json['weather'][0]['description'],
      weathericon: json["weather"][0]['icon'],
    );
  }
  }




void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  

  @override
  // add the search bar 
  //add the bakcground colour for the app and remove the app bar
  Widget build(BuildContext context) {
    return MaterialApp(
      
      initialRoute: '/',
      routes: {
        '/': (_)=>HomeScreen(),
        
      },
    );

    
  }
}
class HomeScreen extends StatefulWidget {
  

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
    


class _HomeScreenState extends State<HomeScreen> {

 //Position _currentPosition;
 //String _currentAddress;
    
 Future<WeatherInfo> futureWeather;//may remove late
  @override
  void initState(){
    super.initState();
    futureWeather=fetchWeather("Delhi");
    
  }

    /*_getCurrentLocation() {
    Geolocator
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.best, forceAndroidLocationManager: true)
      .then((Position position) {
        setState(() {
          _currentPosition = position;
        });
      }).catchError((e) {
        print(e);
      });
    }

       try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        _currentPosition.latitude,
        _currentPosition.longitude
      );

      Placemark place = placemarks[0];

      setState(() {
        _currentAddress = "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }*/

 void onTextFieldSubmitted(String input)async{
   futureWeather=fetchWeather(input);//cast and definition variable added
  }



  @override
  Widget build(BuildContext context) {
   return Container(
        child: (
          FutureBuilder<WeatherInfo>(
            future: futureWeather,
            builder: (context,snapshot) {
              if(snapshot.hasData){
               return MainWidget(
                 Location: snapshot.data?.Location,
                 temp: snapshot.data?.temp,
                 temp_max: snapshot.data?.tempmax,
                 temp_min: snapshot.data?.tempmin,
                 weather: snapshot.data?.weather,
               );
              }else  {
                return Center(
                  child: Text("${snapshot.error}"),
                );
              }
              
            }
            )
        ),
   );
}
}


  
