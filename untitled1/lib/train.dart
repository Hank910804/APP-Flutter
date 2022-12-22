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
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.keyboard_return,
            ),
            onPressed: (){
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
          ),
          title: const Text(
            "語言訓練",
            style: TextStyle(
            ),
          ),
        ),
        backgroundColor:Colors.orange.shade50,
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
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
                            'lib/image/talk.png',
                          ),
                        ),
                        Text(
                          '表達練習',
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
                        '閱讀練習',
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
                        child: const Icon(
                          Icons.psychology_outlined,
                          size: 60,
                          color: Colors.black54,
                        ),
                      ),
                      const Text(
                        '理解練習',
                        style: TextStyle(
                            fontSize: 40
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        )
    );
  }

}