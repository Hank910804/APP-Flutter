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

void main() {
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
                child: TextField(
                    controller: pust_string_controller,
                    cursorColor: Colors.blue,
                    cursorRadius: const Radius.circular(4.0),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                    ),
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: 'Email',
                        isDense: true,
                        filled: true,
                        fillColor: Colors.white,
                        //counterText: '',
                        errorText: pust_string_controller.text == '' ? 'email不得為空' : '',  //判斷是否有錯誤訊息
                        //錯誤代碼要判斷
                        border: OutlineInputBorder(
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
                  String? encodeQueryParameters(Map<String, String> params) {
                    return params.entries
                        .map((MapEntry<String, String> e) =>
                            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                        .join('&');
                  }

                  final Uri emailLaunchUri = Uri(
                    scheme: 'mailto',
                    path: 'hank0910804@gmail.com',
                    query: encodeQueryParameters(<String, String>{
                      'subject': '寄送信件測試',
                      'body': '您好, 寄送信件測試。'
                    }),
                  );
                  launchUrl(emailLaunchUri);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                      color: Colors.blue,
                      border: Border.all(color: Colors.blue)),
                  child: const Text('寄送',
                      style: TextStyle(fontSize: 30, color: Colors.black)),
                ),
              ),
            ],
          )),
        ));
  }
}
