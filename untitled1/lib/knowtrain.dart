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
import 'package:audioplayers/audioplayers.dart';

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
        backgroundColor: Colors.orangeAccent.shade100,
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 5 / 6,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 4,
                      height: MediaQuery.of(context).size.height / 8,
                      child: Image.asset(
                        'lib/image/name.png',
                      ),
                    ),
                    const Text(
                      '命名練習',
                      style:
                      TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Container(
                        color: Colors.redAccent,
                        width: MediaQuery.of(context).size.width / 8,
                        height: MediaQuery.of(context).size.height / 15,
                        child: TextButton(
                            onPressed: () {
                              final player = AudioCache();
                              player.play('cold.mp3');
                            },
                            child: const Icon(
                              Icons.volume_down_alt,
                              size: 40,
                              color: Colors.black87,
                            )
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 20,
                    ),
                    const Text(
                      '很冷',
                      style: TextStyle(fontSize: 40),
                    )
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 3 / 7,
                  child: Image.asset(
                    'lib/image/cold.png',
                    height: MediaQuery.of(context).size.height * 2 / 5,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 100,
                ),
                ClipOval(
                  child: Container(
                    color: Colors.redAccent,
                    width: MediaQuery.of(context).size.width / 5,
                    height: MediaQuery.of(context).size.height / 9,
                    child: TextButton(
                      onPressed: (){
                        //功能
                      },
                      child:Icon(
                        Icons.mic,
                        size: 50,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ));
  }
}
