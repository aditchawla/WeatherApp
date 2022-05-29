
import 'main.dart';
import 'package:flutter/material.dart';
//import 'package:geolocator/geolocator.dart';



class MainWidget extends StatefulWidget {
  String Location;
  double temp;
  double temp_min;
  double temp_max;
  String weather;
  String weathericon;

  MainWidget({
    @required this.Location,
    @required this.temp,
    @required this.temp_min,
    @required this.temp_max,
    @required this.weather,
    @required this.weathericon,
  });

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {

   //Position _currentPosition;
   //String _currentAddress;

  void onTextFieldSubmitted(String input)async{
   WeatherInfo weatherInfo = await fetchWeather(input);
   setState(() {
     widget.Location = weatherInfo.Location;
     widget.temp= weatherInfo.temp;
     widget.temp_max=weatherInfo.tempmax;
     widget.temp_min=weatherInfo.tempmin;
     widget.weather=weatherInfo.weather;
     widget.weathericon=weatherInfo.weathericon;

   });
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
  }*/

   

  String get iconUrl{
    if(widget.weathericon==null){
        return "http://openweathermap.org/img/wn/10d@2x.png";
    }
    else{
    return "http://openweathermap.org/img/wn/" + "${widget.weathericon}" + "@2x.png";
  }
  }

  @override
  Widget build(BuildContext context){
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: 
          NetworkImage('https://i.pinimg.com/564x/a8/65/6a/a8656ab00fa8abfbee70005c7efeae2a.jpg'),
          fit: BoxFit.cover,
          )
        ),

   child:(
   Scaffold(
     backgroundColor: Colors.transparent,
     appBar: AppBar(actions: [
       GestureDetector(
         onTap: (){
           
         },
         child: Icon(Icons.location_city,size: 36.0,),
       )
     ],
      backgroundColor: Colors.transparent,
     elevation: 0.0,
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
              SizedBox(width: 150),
              Text("${widget.weather.toString().toUpperCase()}", style: TextStyle(fontSize: 20,color: Colors.white),),
              
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
                     hintText: 'location',
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
           SizedBox(height: 300),
            Image.network(iconUrl)
        ]
         
       ),

      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          Text(
          "${widget.Location.toString().toUpperCase()}",
          style:  TextStyle(fontSize: 20,
          color: Colors.white),
          )
        ],
      ),

      Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100,),
              Text("${widget.temp.toString()}"+"°C",
              
              style: TextStyle(fontSize: 30,color: Colors.white)),
              
            ],
            
          ),
          //to create the weather icons for different timings of the day
          Column(
            
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            
            children: [
              SizedBox(width: 220,height: 100,),
              Row(
                children: [
                  Container(
                    width: 50,
                    padding: EdgeInsets.only(right:10),
                    child: (Text('Hi Temp',
                    style: TextStyle(color: Colors.white,fontSize: 15),)),
                  ),
                 Container(
                   padding: EdgeInsets.only(right: 0),
                   child: Text( 'Lo Temp',
                   style: TextStyle(color: Colors.white,fontSize: 15)),
                 )
                 
                ],
                
                
              ),
              
              Row(
                children: [
                  Container(
                    height: 50,
                    padding: EdgeInsets.only(right:25, top:5),
                    child: (
                       Text("${widget.temp_max.toInt().toString()}",
                       style: TextStyle(color: Colors.white,fontSize: 15))
                    ),
                  ),
                  
                  Container(
                    height: 50,
                    padding: EdgeInsets.only(right: 5),
                    child:(
                      Text("${widget.temp_min.toInt().toString()}",
                      style: TextStyle(color: Colors.white,fontSize: 15))
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