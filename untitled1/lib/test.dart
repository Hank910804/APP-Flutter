import 'package:http/http.dart' as http;
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

void main(){
  runApp( CreateInterface());
}

class CreateInterface extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.red, //primary color for theme
        ),
        home: WriteSQLdata() //set the class here
    );
  }
}

class WriteSQLdata extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WriteSQLdataState();
  }
}

class WriteSQLdataState extends State<WriteSQLdata> {
  TextEditingController idctl = TextEditingController();
  TextEditingController namectl = TextEditingController();
  TextEditingController timectl = TextEditingController();
  TextEditingController typectl = TextEditingController();
  TextEditingController scorectl = TextEditingController();

  late bool error, sending, success;
  late String msg;

  String phpurl = "http://192.168.56.1/appcode/test.php";

  //本地不能使用 http://localhost/
  //使用本地 IP 地址或 URL
  //Windows 使用 ipconfig ；在 Linux 上使用 ip a 取得 IP 地址

  @override
  //初始化參數
  void initState() {
    error = false;
    sending = false;
    success = false;
    msg = "";
    super.initState();
  }

  Future<void> sendData() async {
    //發送帶有標題data的post request
    var res = await http.post(Uri.parse(phpurl), body: {
      "id": idctl.text,
      "name": namectl.text,
      "time": timectl.text,
      "type": typectl.text,
      "score": scorectl.text,
    });

    if (res.statusCode == 200) {
      print(res.body);
      var data = json.decode(res.body); //將json解碼為陣列形式
      if (data["error"]) {
        //錯誤的話
        setState(() {
          //從 server 收到錯誤時刷新 UI 介面顯示文字
          sending = false;
          error = true;
          msg = data["message"]; //來自server 的錯誤消息
        });
      } else {
        //寫入成功後，清空輸入框的值
        idctl.text = "";
        namectl.text = "";
        timectl.text = "";
        typectl.text = "";
        scorectl.text = "";

        setState(() {
          sending = false;
          success = true; //使用 setState 設定success為成功狀態(true)並刷新 UI 介面顯示文字
        });
      }
    } else {
      //存在錯誤的話
      setState(() {
        error = true;
        msg = "Error!";
        sending = false; //標記錯誤並使用 setState 刷新 UI 介面顯示文字
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("PHP and Mysql 測試"),
          backgroundColor: Colors.redAccent),
      body: SingleChildScrollView(
        //能滾動，鍵盤出現時，高度變小，防止溢出
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Container(
                child: Text(error ? msg : "Input"),
                //如果有錯誤則顯示消息，否則顯示文本消息
              ),
              Container(
                child: Text(success ? "success!" : "send data"),
                //如果成功顯示成功，否則顯示寄送資料
              ),
              Container(
                  child: TextField(
                    controller: idctl,
                    decoration: const InputDecoration(
                      labelText: "id:",
                    ),
                  )),
              Container(
                child: TextField(
                  controller: namectl,
                  decoration: const InputDecoration(
                    labelText: "name:",
                  ),
                ),
              ),
              Container(
                child: TextField(
                  controller: timectl,
                  decoration: const InputDecoration(
                    labelText: "time:",
                  ),
                ),
              ),
              Container(
                child: TextField(
                  controller: typectl,
                  decoration: const InputDecoration(
                    labelText: "type:",
                  ),
                ),
              ),
              Container(
                child: TextField(
                  controller: scorectl,
                  decoration: const InputDecoration(
                    labelText: "score:",
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      //按下按鈕後設定sending為true
                      setState(() {
                        sending = true;
                      });
                      sendData();
                    },
                    child: Text(
                      sending
                          ? "寄送中..."
                          : "送出資料", //如果 sending == true 顯示寄送中...，否則顯示送出資料；
                    ),
                    //background of button is darker color, so set brightness to dark
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