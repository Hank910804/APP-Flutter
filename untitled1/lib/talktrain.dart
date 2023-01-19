import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'package:path/path.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent.shade100,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.keyboard_return,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
          ),
          title: const Text(
            "表達練習",
            style: TextStyle(),
          ),
        ),
        //backgroundColor:Colors.greenAccent,
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Container(
            // color: Colors.black54,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 100,
                ),

                Container(
                  width: MediaQuery.of(context).size.width*2/3,
                  height: MediaQuery.of(context).size.height*2/3,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                      color: Colors.white60,
                      border: Border.all(color:Colors.black)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'lib/image/pee.png',
                        height: MediaQuery.of(context).size.height*3/5,
                      ),

                      Container(
                        alignment: Alignment.center,
                        // color: Colors.lightBlueAccent.shade100,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height/16,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                            color: Colors.lightBlueAccent.shade100,
                        ),
                        child: const Text(
                          '小便斗',
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(200.0)),
                          color: Colors.pink.shade100,
                          border: Border.all(color:Colors.pink.shade100)
                      ),
                      child: TextButton(
                        onPressed:(){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()),
                          );
                        },
                        child: const Icon(
                          Icons.arrow_back_outlined,
                          size: 60,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width/50,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(200.0)),
                          color: Colors.pink.shade100,
                          border: Border.all(color:Colors.pink.shade100)
                      ),
                      child: TextButton(
                        onPressed:(){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()),
                          );
                        },
                        child: const Icon(
                          Icons.mic,
                          size: 60,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width/50,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(200.0)),
                          color: Colors.pink.shade100,
                          border: Border.all(color:Colors.pink.shade100)
                      ),
                      child: TextButton(
                        onPressed:(){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()),
                          );
                        },
                        child: const Icon(
                          Icons.arrow_forward_outlined,
                          size: 60,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),




              ],
            ),
          ),
        ));
  }
}
