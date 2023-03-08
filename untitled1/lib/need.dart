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

int list = 1; //設置ListView.builder顯示的倍數

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
      home: NeedPage1(),
    );
  }
}

class NeedPage1 extends StatefulWidget {
  @override
  _NeedPage1 createState() => _NeedPage1();
}

class _NeedPage1 extends State<NeedPage1> {


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
                      'lib/image/need.png',
                    ),
                  ),
                  const Text(
                    '需求表達',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width/3,
                    child: TextButton(
                      onPressed: (){
                        final player = AudioCache();
                        player.play('hungry.mp3');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            height: MediaQuery.of(context).size.height / 10,
                            child: Image.asset(
                              'lib/image/hungry.png',
                            ),
                          ),
                          const Text(
                            '肚子餓',
                            style: TextStyle(fontSize: 30),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width/3,
                    child: TextButton(
                      onPressed: () {
                        final player = AudioCache();      //AudioCache初始化
                        player.play('thirsty.mp3');       //播放口渴音檔
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            height: MediaQuery.of(context).size.height / 10,
                            child: Image.asset(
                              'lib/image/thirsty.png',
                            ),
                          ),
                          const Text(
                            '口渴',
                            style: TextStyle(fontSize: 30),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width/3,
                    child: TextButton(
                      onPressed: () {
                        final player = AudioCache();
                        player.play('small.mp3');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            height: MediaQuery.of(context).size.height / 10,
                            child: Image.asset(
                              'lib/image/small.png',
                            ),
                          ),
                          const Text(
                            '小便',
                            style: TextStyle(fontSize: 30),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width/3,
                    child: TextButton(
                      onPressed: () {
                        final player = AudioCache();
                        player.play('big.mp3');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            height: MediaQuery.of(context).size.height / 10,
                            child: Image.asset(
                              'lib/image/large.png',
                            ),
                          ),
                          const Text(
                            '大便',
                            style: TextStyle(fontSize: 30),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width/3,
                    child: TextButton(
                      onPressed: () {
                        final player = AudioCache();
                        player.play('change.mp3');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            height: MediaQuery.of(context).size.height / 10,
                            child: Image.asset(
                              'lib/image/change.png',
                            ),
                          ),
                          const Text(
                            '換尿布',
                            style: TextStyle(fontSize: 30),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width/3,
                    child: TextButton(
                      onPressed: () {
                        final player = AudioCache();
                        player.play('body.mp3');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            height: MediaQuery.of(context).size.height / 10,
                            child: Image.asset(
                              'lib/image/body.png',
                            ),
                          ),
                          const Text(
                            '翻身',
                            style: TextStyle(fontSize: 30),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height/30,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 13,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    color: Colors.deepOrange.shade800,
                    border: Border.all(color: Colors.deepOrange.shade800)),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NeedPage2()),
                    );
                  },
                  child: const Text(
                      '下一頁',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NeedPage2 extends StatefulWidget {
  @override
  _NeedPage2 createState() => _NeedPage2();
}

class _NeedPage2 extends State<NeedPage2> {
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
                      'lib/image/need.png',
                    ),
                  ),
                  const Text(
                    '需求表達',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width/3,
                    child: TextButton(
                      onPressed: () {
                        final player = AudioCache();
                        player.play('hot.mp3');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            height: MediaQuery.of(context).size.height / 10,
                            child: Image.asset(
                              'lib/image/hot.png',
                            ),
                          ),
                          const Text(
                            '很熱',
                            style: TextStyle(fontSize: 30),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width/3,
                    child: TextButton(
                      onPressed: () {
                        final player = AudioCache();
                        player.play('cold.mp3');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            height: MediaQuery.of(context).size.height / 10,
                            child: Image.asset(
                              'lib/image/cold.png',
                            ),
                          ),
                          const Text(
                            '很冷',
                            style: TextStyle(fontSize: 30),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width/3,
                    child: TextButton(
                      onPressed: () {
                        final player = AudioCache();
                        player.play('faint.mp3');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            height: MediaQuery.of(context).size.height / 10,
                            child: Image.asset(
                              'lib/image/faint.png',
                            ),
                          ),
                          const Text(
                            '頭暈',
                            style: TextStyle(fontSize: 30),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width/3,
                    child: TextButton(
                      onPressed: () {
                        final player = AudioCache();
                        player.play('head.mp3');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            height: MediaQuery.of(context).size.height / 10,
                            child: Image.asset(
                              'lib/image/head.png',
                            ),
                          ),
                          const Text(
                            '頭痛',
                            style: TextStyle(fontSize: 30),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width/3,
                    child: TextButton(
                      onPressed: () {
                        final player = AudioCache();
                        player.play('stomach.mp3');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            height: MediaQuery.of(context).size.height / 10,
                            child: Image.asset(
                              'lib/image/stomach.png',
                            ),
                          ),
                          const Text(
                            '腹痛',
                            style: TextStyle(fontSize: 30),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width/3,
                    child: TextButton(
                      onPressed: () {
                        final player = AudioCache();
                        player.play('bed.mp3');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            height: MediaQuery.of(context).size.height / 10,
                            child: Image.asset(
                              'lib/image/bed.png',
                            ),
                          ),
                          const Text(
                            '下床',
                            style: TextStyle(fontSize: 30),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height/30,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 13,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    color: Colors.deepOrange.shade800,
                    border: Border.all(color: Colors.deepOrange.shade800)),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(builder: (context) => NeedPage1()),
                    );
                  },
                  child: const Text(
                    '上一頁',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}