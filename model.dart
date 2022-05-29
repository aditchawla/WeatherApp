
import 'package:flutter/material.dart';

class MainWidget extends StatelessWidget {
  final Location;
  final temp;
  final temp_min;
  final temp_max;
  final weather;

  MainWidget({
    @required this.Location,
    @required this.temp,
    @required this.temp_min,
    @required this.temp_max,
    @required this.weather,
  });

  @override
  Widget build(BuildContext context){
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
              SizedBox(width: 50),
              Text("${weather.toString()}", style: TextStyle(fontSize: 20),),
              
            ],
         ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              
               children: [
                 Container(
                   width: 300,
                 child:(TextField(
                   style: TextStyle(color: Colors.white, fontSize: 25),
                   decoration: InputDecoration(
                     hintText: 'search another location...',
                     hintStyle: TextStyle(color: Colors.white, fontSize: 18),
                     prefixIcon: Icon(Icons.search, size: 20)
                    

                   ),
                 )
                 )//child
                 )
                 

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
           SizedBox(height: 300),
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
              Text("${temp.toInt().toString()}",
              style: TextStyle(fontSize: 30),),
              Text('feels like 32 Degrees',
              style: TextStyle(fontSize: 10),),
            ],
            
          ),
          //to create the weather icons for different timings of the day
          Column(
            
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            
            children: [
              SizedBox(width: 220),
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
                    padding: EdgeInsets.only(right:40, top:5),
                    child: (
                      const Text('39')
                    ),
                  ),
                  
                  Container(
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
}