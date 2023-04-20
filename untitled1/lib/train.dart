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


TextEditingController pust_string_controller = TextEditingController();
TextEditingController pust_string_controller01 = TextEditingController();
int list = 1;

void main(){
  runApp(const MyApp());
  File('file.txt').readAsString().then((String contents) {
    print(contents);
  });
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
        backgroundColor:Colors.orange.shade50,
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 5 / 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 4,
                          height: MediaQuery.of(context).size.height / 10,
                          child: const Icon(
                            Icons.mic,
                            size: 60,
                            color: Colors.black87,
                          ),
                        ),
                        const Text(
                          '語言訓練',
                          style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    TextButton(
                        onPressed: (){
                          Navigator.push(
                            context, MaterialPageRoute(builder: (context) => MyHomePage()),
                          );
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height/5,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                              color: Colors.yellowAccent.shade100,
                              border: Border.all(color:Colors.black38)
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width/4,
                                child: Image.asset(
                                  'lib/image/name.png',
                                ),
                              ),
                              const Text(
                                '命名練習',
                                style: TextStyle(
                                  fontSize: 40
                                ),
                              )
                            ],
                          ),
                        ),
                    ),

                    TextButton(
                      onPressed: (){
                        Navigator.push(
                          context, MaterialPageRoute(builder: (context) => MyHomePage()),
                        );
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height/5,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                            color: Colors.lightGreenAccent.shade100,
                            border: Border.all(color:Colors.black38)
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width/4,
                              child: Image.asset(
                                'lib/image/read.png',
                              ),
                            ),
                            const Text(
                              '覆誦練習',
                              style: TextStyle(
                                  fontSize: 40
                              ),
                            )

                          ],
                        ),
                      ),
                    ),

                    TextButton(
                      onPressed: (){
                        Navigator.push(
                          context, MaterialPageRoute(builder: (context) => MyHomePage()),
                        );
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height/5,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                            color: Colors.orangeAccent.shade100,
                            border: Border.all(color:Colors.black38)
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width/4,
                              child: Image.asset(
                                'lib/image/talk.png',
                              ),
                            ),
                            const Text(
                              '自主言語',
                              style: TextStyle(
                                  fontSize: 40
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          )
        )
    );
  }

}