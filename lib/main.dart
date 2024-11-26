import 'package:assingment12/usages.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home:  MyApp()));
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 92, 23, 23),
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Center(
              child: Text(
            "the seven libraries usages",
            style: TextStyle(color: Colors.amberAccent),
          )),
        ),
        body:  
        Center(
          child: ListView(
            children:  [
              Card(
                child:
                  ListTile(
                    title: Text("Let's use the English words global library"),
                    leading: Text("1",style: TextStyle(fontSize: 10,color: Colors.red)),
                    trailing: GestureDetector(
                      onTap: () {
                        setState(() {
                         Navigator.push(context, MaterialPageRoute(builder: (c)=>English_Word()));
                        });
                      },
                      child: Icon(Icons.chevron_right)),
                  ),
                ),
                Card(
                child:
                  ListTile(
                    title: Text("Lets how to access to google"),
                    leading: Text("2",style: TextStyle(fontSize: 10,color: Colors.red)),
                    trailing: GestureDetector(
                      onTap: () {
                        setState(() {
                         Navigator.push(context, MaterialPageRoute(builder: (c)=>Url()));
                        });
                      },
                      child: Icon(Icons.chevron_right)),
                  ),
                ),
                Card(
                child:
                  ListTile(
                    title: Text("play your favorite audio"),
                    leading: Text("3",style: TextStyle(fontSize: 10,color: Colors.red)),
                    trailing: GestureDetector(
                      onTap: () {
                        setState(() {
                         Navigator.push(context, MaterialPageRoute(builder: (c)=>Audio_player()));
                        });
                      },
                      child: Icon(Icons.chevron_right)),
                  ),
                ),
                 Card(
                child:
                  ListTile(
                    title: Text("learn the way of sharing your app in playStore"),
                    leading: Text("4",style: TextStyle(fontSize: 10,color: Colors.red)),
                    trailing: GestureDetector(
                      onTap: () {
                        setState(() {
                         Navigator.push(context, MaterialPageRoute(builder: (c)=>Play_Store()));
                        });
                      },
                      child: Icon(Icons.chevron_right)),
                  ),
                ),
                 Card(
                child:
                  ListTile(
                    title: Text("learn the way of sharing your app in playStore"),
                    leading: Text("5",style: TextStyle(fontSize: 10,color: Colors.red)),
                    trailing: GestureDetector(
                      onTap: () {
                        setState(() {
                         Navigator.push(context, MaterialPageRoute(builder: (c)=>Video()));
                        });
                      },
                      child: Icon(Icons.chevron_right)),
                  ),
                ),
                 Card(
                child:
                  ListTile(
                    title: Text("Intl library usages"),
                    leading: Text("6",style: TextStyle(fontSize: 10,color: Colors.red)),
                    trailing: GestureDetector(
                      onTap: () {
                        setState(() {
                         Navigator.push(context, MaterialPageRoute(builder: (c)=>Intl()));
                        });
                      },
                      child: Icon(Icons.chevron_right)),
                  ),
                ),
                  Card(
                child:
                  ListTile(
                    title: Text("Image Picker library usages"),
                    leading: Text("7",style: TextStyle(fontSize: 10,color: Colors.red)),
                    trailing: GestureDetector(
                      onTap: () {
                        setState(() {
                         Navigator.push(context, MaterialPageRoute(builder: (c)=>Image_picker()));
                        });
                      },
                      child: Icon(Icons.chevron_right)),
                  ),
                ),
            ],
          ),
        ));
  }
}
