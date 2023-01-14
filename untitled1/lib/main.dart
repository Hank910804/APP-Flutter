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

TextEditingController pust_string_controller = new TextEditingController();
TextEditingController pust_string_controller01 = new TextEditingController();
var myFile = File('file.txt');
int list = 1;              //設置ListView.builder顯示的倍數

class Mysql {
  static String host = '192.168.56.1',
      user = 'MyProject',
      password = '123',
      db = 'project';
  static int port = 3306;
  Mysql();

  Future<MySqlConnection> getConnection() async{
    var settings = new ConnectionSettings(
      host: host,
      user: user,
      password: password,
      db: db,
    );
    return await MySqlConnection.connect(settings);
  }
}

void main(){
  runApp(MyApp());
  File('file.txt').readAsString().then((String contents) {
    print(contents);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  var db = new Mysql();
  var name = "";
  void _getCustomer() {
    db.getConnection().then((conn) {
      String sql = "SELECT * FROM doctor_database WHERE id = 'A00007'";
      conn.query(sql).then((results) {
        for(var row in results){
          print("${row} <東西在這");
          setState(() {
            name = row[0];
          });
        }
      });
      conn.close();
    });
  }
  var p ;
  var sex = "男";
  pic(String a){
    if(a == "男"){
      p = 'lib/image/mpatient.jpg';
      print(a);
      return p;
    }
    else if(a == "女"){
      p = 'lib/image/wpatient.jpg';
      print(a);
      return p;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor:Colors.greenAccent,
        body: Center(
            child: Container(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    alignment: Alignment.center,
                    child: ListView.builder(
                        itemCount: list.abs(),
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      width: 250,
                                      height: 250,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(200.0)),
                                          color: Colors.white60,
                                          border: Border.all(color:Colors.black)
                                      ),
                                      child: ClipOval(
                                        child: Image.asset(
                                            pic(sex),
                                          height: MediaQuery.of(context).size.height,
                                          width: MediaQuery.of(context).size.width,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(
                                height: 30,
                              ),

                              Container(
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        '名稱',
                                        style: TextStyle(
                                          fontSize:30,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),

                                    Container(
                                      width: MediaQuery.of(context).size.width-20,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                          color: Colors.white60,
                                          border: Border.all(color:Colors.black38)
                                      ),
                                      child: Text(
                                        '${pust_string_controller.text}',   //從pust_string_controller呼叫字串
                                        style: TextStyle(
                                          fontSize: 30,
                                        ),   //字串的大小
                                      ),
                                    ),

                                    SizedBox(
                                      height: 5,
                                    ),

                                    SizedBox(
                                      height: 5,
                                    ),

                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        '性別',
                                        style: TextStyle(
                                          fontSize:30,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),

                                    Container(
                                      width: MediaQuery.of(context).size.width-20,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                          color: Colors.white60,
                                          border: Border.all(color:Colors.black38)
                                      ),
                                      child: Text(
                                        '${pust_string_controller.text}',   //從pust_string_controller呼叫字串
                                        style: TextStyle(
                                          fontSize: 30,
                                        ),   //字串的大小
                                      ),
                                    ),

                                    SizedBox(
                                      height: 5,
                                    ),

                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        '年齡',
                                        style: TextStyle(
                                          fontSize:30,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),

                                    Container(
                                      width: MediaQuery.of(context).size.width-20,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                          color: Colors.white60,
                                          border: Border.all(color:Colors.black38)
                                      ),
                                      child: Text(
                                        '${pust_string_controller.text}',   //從pust_string_controller呼叫字串
                                        style: TextStyle(
                                          fontSize: 30,
                                        ),   //字串的大小
                                      ),
                                    ),

                                    SizedBox(
                                      height: 5,
                                    ),

                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        '診斷',
                                        style: TextStyle(
                                          fontSize:30,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),

                                    Container(
                                      width: MediaQuery.of(context).size.width-20,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                          color: Colors.white60,
                                          border: Border.all(color:Colors.black38)
                                      ),
                                      child: Text(
                                        '${pust_string_controller.text}',   //從pust_string_controller呼叫字串
                                        style: TextStyle(
                                          fontSize: 30,
                                        ),   //字串的大小
                                      ),
                                    ),

                                    SizedBox(
                                      height: 5,
                                    ),

                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        '連絡電話',
                                        style: TextStyle(
                                          fontSize:30,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),

                                    Container(
                                      width: MediaQuery.of(context).size.width-20,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                          color: Colors.white60,
                                          border: Border.all(color:Colors.black38)
                                      ),
                                      child: Text(
                                        '${pust_string_controller.text}',   //從pust_string_controller呼叫字串
                                        style: TextStyle(
                                          fontSize: 30,
                                        ),   //字串的大小
                                      ),
                                    ),

                                    SizedBox(
                                      height: 5,
                                    ),

                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        '個案編號',
                                        style: TextStyle(
                                          fontSize:30,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),

                                    Container(
                                      width: MediaQuery.of(context).size.width-20,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                          color: Colors.white60,
                                          border: Border.all(color:Colors.black38)
                                      ),
                                      child: Text(
                                        '${pust_string_controller.text}',   //從pust_string_controller呼叫字串
                                        style: TextStyle(
                                          fontSize: 30,
                                        ),   //字串的大小
                                      ),
                                    ),

                                    SizedBox(
                                      height: 5,
                                    ),

                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        '使用日期',
                                        style: TextStyle(
                                          fontSize:30,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),

                                    Container(
                                      width: MediaQuery.of(context).size.width-20,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                          color: Colors.white60,
                                          border: Border.all(color:Colors.black38)
                                      ),
                                      child: Text(
                                        '${pust_string_controller.text}',   //從pust_string_controller呼叫字串
                                        style: TextStyle(
                                          fontSize: 30,
                                        ),   //字串的大小
                                      ),
                                    ),

                                    SizedBox(
                                      height: 5,
                                    ),

                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        '個案來源',
                                        style: TextStyle(
                                          fontSize:30,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),

                                    Container(
                                      width: MediaQuery.of(context).size.width-20,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                          color: Colors.white60,
                                          border: Border.all(color:Colors.black38)
                                      ),
                                      child: Text(
                                        '${pust_string_controller.text}',   //從pust_string_controller呼叫字串
                                        style: TextStyle(
                                          fontSize: 30,
                                        ),   //字串的大小
                                      ),
                                    ),

                                    SizedBox(
                                      height: 5,
                                    ),

                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        '緊急聯絡人',
                                        style: TextStyle(
                                          fontSize:30,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),

                                    Container(
                                      width: MediaQuery.of(context).size.width-20,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                          color: Colors.white60,
                                          border: Border.all(color:Colors.black38)
                                      ),
                                      child: Text(
                                        '${pust_string_controller.text}',   //從pust_string_controller呼叫字串
                                        style: TextStyle(
                                          fontSize: 30,
                                        ),   //字串的大小
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }
                    ),
                  ),
                ],
              ),
            )

        )
    );
  }

  void filePicker() async{
    final XFile? selectImage = await _picker.pickImage(source: ImageSource.gallery);
    print(selectImage!.path);
    setState(() {
      image = selectImage;
    });
  }
}

