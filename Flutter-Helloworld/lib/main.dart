


import 'package:flutter/material.dart';
import 'package:sampleprj/post.dart';


void main() =>runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key?key}):super(key:key);
  @override
  _MyAppState createState()=> _MyAppState();

}

class  _MyAppState extends State<MyApp>
{
//  @ovveride 
var _counter = 0;
void addcounter()
{
  setState(() {
     _counter++;

  });
}
@override
 Widget build(BuildContext context)
 {
  return MaterialApp(
    home:Scaffold(
      backgroundColor: Colors.orange,
      appBar:AppBar(backgroundColor:Colors.black26,
          title: const Text("Hello Holoware",style: TextStyle(fontStyle: FontStyle.italic)),
          ),
      body:    FutureBuilder(
            future: Apidata().getdata(),
            builder: (context, snapshot)
            {
             if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          // Display the retrieved string
          return Text(snapshot.data["name"] ?? 'No data');
        }
              }
            ),
floatingActionButton: FloatingActionButton(
        onPressed: addcounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
  ),
  
  // floatingActionButton:FloatingActionButton(onPressed:addcounter,tooltip: "increament")
  );
 }  
}