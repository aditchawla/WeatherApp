/*import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:meta/meta.dart';



class MainWidget extends StatefulWidget {
  var Location;
  
  var temp;
  
  var temp_max;
  
  var temp_min;
  
  var weather;



 MainWidget({
    required this.Location,
    required this.temp,
    required this.temp_min,
    required this.temp_max,
    required  this.weather,
  });


  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  //add initialisers for the location for delhi
  final Location="Delhi";
  final temp= "25C";
  final temp_min="20C";
  final temp_max="30C";
  final weather="Haze";

 

   late Future<WeatherInfo> futureWeather;
   void onTextFieldSubmitted(String input)async{
   futureWeather=fetchWeather(input);//cast and definition variable added
  }


  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: 
          NetworkImage('https://raw.githubusercontent.com/mercihohmann/flutter-weather-app-starterkit/master/weather_app/images/clear.png'),
          fit: BoxFit.cover,
          )
        ),

   child:(
   Scaffold(
     backgroundColor: Colors.transparent,
     appBar: AppBar(
     backgroundColor: Colors.transparent,
     ),
     
     body: 
     Column(
       children: [
         Row(
           children:[
         Column(
           mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 25),
              Text("${weather.toString()}", style: TextStyle(fontSize: 20),),
              
            ],
         ),
                     Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              
               children: [
                
                 Container(
                   width: 200,
                 child:
                 (TextField(
                   onSubmitted:(String input){
                     onTextFieldSubmitted(input);
                   },
                   style: TextStyle(color: Colors.white, fontSize: 25),
                   decoration: InputDecoration(
                     hintText: 'search a location...',
                     hintStyle: TextStyle(color: Colors.white, fontSize: 18),
                     prefixIcon: Icon(Icons.search, size: 20)
                    

                   ),
                   
                 )
                 )//child
                 )
                 //function needs to be called for the search function to be activated
                 
               
                 

               ],
             ),
           ]
  
         ),
       Row(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children:
         // ignore: prefer_const_literals_to_create_immutables
         [
           SizedBox(height: 200),
           const Icon(Icons.sunny, size: 200)
        ]
         
       ),

      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 100),
          Text(
          "${Location.toString()}",
          style:  TextStyle(fontSize: 20),
          )
        ],
      ),

      Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50,),
              Text("${temp.toString()}",
              style: TextStyle(fontSize: 30)),
              Text('feels like 32 Degrees',
              style: TextStyle(fontSize: 10)),
            ],
            
          ),
          //to create the weather icons for different timings of the day
          Column(
            
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            
            children: [
              SizedBox(width: 220,height: 50,),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(right:15,top: 5),
                    child: (Text('14:00')),
                  ),
                 
                  Text('18:00')
                ],
                
                
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(right:30,top: 5),
                    
                   child: (Icon(Icons.cloud))
                  ),
                  
                  Icon(Icons.snowing)

                ],

              ),
              Row(
                children: [
                  Container(
                    height: 50,
                    padding: EdgeInsets.only(right:40, top:5),
                    child: (
                      const Text('39')
                    ),
                  ),
                  
                  Container(
                    height: 50,
                    padding: EdgeInsets.only(right: 5),
                    child:(
                      Text('5')
                    )
                  )
                  
                ],

              )

            ],

          )

        ],
      )
      
     ]
   ),
  )
   ),//child
   );
  }
  
  
}*/