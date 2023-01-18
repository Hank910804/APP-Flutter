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
            "生理需求",
            style: TextStyle(),
          ),
        ),
        //backgroundColor:Colors.greenAccent,
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            child: ListView.builder(
                itemCount: list.abs(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 100,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 5,
                            width: (MediaQuery.of(context).size.width - 40) / 2,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0)),
                                color: Colors.yellowAccent.shade100,
                                border: Border.all(color: Colors.black38)),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyHomePage()),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width:MediaQuery.of(context).size.width / 4,
                                    height: MediaQuery.of(context).size.height / 10,
                                    child: Image.asset(
                                      'lib/image/food.png',
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
                            width: (MediaQuery.of(context).size.width - 40) / 2,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0)),
                                color: Colors.yellowAccent.shade100,
                                border: Border.all(color: Colors.black38)),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyHomePage()),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width:MediaQuery.of(context).size.width / 4,
                                    height: MediaQuery.of(context).size.height / 10,
                                    child: Image.asset(
                                      'lib/image/water.png',
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
                        ],
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height / 100,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 5,
                            width: (MediaQuery.of(context).size.width - 40) / 2,
                            decoration: BoxDecoration(
                                borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                                color: Colors.lightGreenAccent.shade100,
                                border: Border.all(color: Colors.black38)),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyHomePage()),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width / 4,
                                    height: MediaQuery.of(context).size.height / 10,
                                    child: Image.asset(
                                      'lib/image/pee.png',
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

                          Container(
                            height: MediaQuery.of(context).size.height / 5,
                            width: (MediaQuery.of(context).size.width - 40) / 2,
                            decoration: BoxDecoration(
                                borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                                color: Colors.lightGreenAccent.shade100,
                                border: Border.all(color: Colors.black38)),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyHomePage()),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width / 4,
                                    height: MediaQuery.of(context).size.height / 10,
                                    child: Image.asset(
                                      'lib/image/peo.png',
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
                        ],
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height / 100,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 5,
                            width: (MediaQuery.of(context).size.width - 40) / 2,
                            decoration: BoxDecoration(
                                borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                                color: Colors.orangeAccent.shade100,
                                border: Border.all(color: Colors.black38)),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyHomePage()),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width / 4,
                                    height: MediaQuery.of(context).size.height / 10,
                                    child: const Icon(
                                      Icons.psychology_outlined,
                                      size: 60,
                                      color: Colors.black54,
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
                            width: (MediaQuery.of(context).size.width - 40) / 2,
                            decoration: BoxDecoration(
                                borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                                color: Colors.orangeAccent.shade100,
                                border: Border.all(color: Colors.black38)),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyHomePage()),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width / 4,
                                    height: MediaQuery.of(context).size.height / 10,
                                    child: const Icon(
                                      Icons.psychology_outlined,
                                      size: 60,
                                      color: Colors.black54,
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
                        height: MediaQuery.of(context).size.height / 100,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 5,
                            width: (MediaQuery.of(context).size.width - 40) / 2,
                            decoration: BoxDecoration(
                                borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                                color: Colors.purple.shade100,
                                border: Border.all(color: Colors.black38)),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyHomePage()),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width / 4,
                                    height: MediaQuery.of(context).size.height / 10,
                                    child: const Icon(
                                      Icons.psychology_outlined,
                                      size: 60,
                                      color: Colors.black54,
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
                            width: (MediaQuery.of(context).size.width - 40) / 2,
                            decoration: BoxDecoration(
                                borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                                color: Colors.purple.shade100,
                                border: Border.all(color: Colors.black38)),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyHomePage()),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width / 4,
                                    height: MediaQuery.of(context).size.height / 10,
                                    child: const Icon(
                                      Icons.psychology_outlined,
                                      size: 60,
                                      color: Colors.black54,
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
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 100,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 5,
                            width: (MediaQuery.of(context).size.width - 40) / 2,
                            decoration: BoxDecoration(
                                borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                                color: Colors.tealAccent.shade100,
                                border: Border.all(color: Colors.black38)),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyHomePage()),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width / 4,
                                    height: MediaQuery.of(context).size.height / 10,
                                    child: const Icon(
                                      Icons.psychology_outlined,
                                      size: 60,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  const Text(
                                    '不舒服',
                                    style: TextStyle(fontSize: 30),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 5,
                            width: (MediaQuery.of(context).size.width - 40) / 2,
                            decoration: BoxDecoration(
                                borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                                color: Colors.tealAccent.shade100,
                                border: Border.all(color: Colors.black38)),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyHomePage()),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width / 4,
                                    height: MediaQuery.of(context).size.height / 10,
                                    child: const Icon(
                                      Icons.psychology_outlined,
                                      size: 60,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  const Text(
                                    '散步',
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
                    ],
                  );
                }),
          ),
        ));
  }
}
