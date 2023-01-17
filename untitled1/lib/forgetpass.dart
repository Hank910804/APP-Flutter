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

int list = 1;

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
  int info = 0;
  TextEditingController Email = TextEditingController();

  late bool error, sending, success;
  late String msg;

  String urlsend = "http://192.168.56.1/appcode/write.php";

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
    var res = await http.post(Uri.parse(urlsend), body: {
      "Email": Email.text,
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
        error = false;
        //寫入成功後，清空輸入框的值
        Email.text = "";

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
            "Forgot Password",
            style: TextStyle(),
          ),
        ),
        //backgroundColor:Colors.greenAccent,
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 12,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 20,
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 3 - 20,
                          child: Image.asset(
                            'lib/image/logo.jpg',
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 2 / 3 - 20,
                          child: const Text(
                            "請輸入您的電子信箱，我們將向您發送密碼至您的帳戶",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black54,
                              height: 1.5,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 20,
                    height: MediaQuery.of(context).size.height/10,
                    child: TextField(
                        controller: Email,
                        decoration: InputDecoration(
                            labelText: "Email：",
                              labelStyle: TextStyle(fontSize: 15),
                            // hintText: 'Email',
                            // isDense: true,
                            // filled: true,
                            // fillColor: Colors.white,
                            suffixIcon: Email.text != '' ? const Icon(Icons.done,) : const Icon(Icons.clear),
                            //counterText: '',
                            // errorText: Email.text != '' ? null : '請輸入電子信箱',  //判斷是否有錯誤訊息
                            //  errorStyle: TextStyle(fontSize: 15),
                            //錯誤代碼要判斷
                            border: const OutlineInputBorder(
                                gapPadding: 0,
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.white,
                                  style: BorderStyle.none,
                                )
                            )
                        )
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      info = 1;
                      //按下按鈕後設定sending為true
                      setState(() {
                        sending = true;
                      });
                      sendData();
                      },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                          color: Colors.blue,
                          border: Border.all(color: Colors.blue)
                      ),
                      child: const Text('寄送',
                          style: TextStyle(fontSize: 30, color: Colors.black)),
                    ),
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width - 20,
                    height: MediaQuery.of(context).size.height/8,
                    child: Text(
                      info == 0 ?
                        '' : error == false ?
                          '信箱驗證成功，密碼已傳送，請至信箱內收取' : '查無綁定此信箱的帳戶，請確認輸入信箱是否正確',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              )
          ),
        )
    );
  }
}
