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
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_sound/flutter_sound.dart';

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
  FlutterSoundRecorder? _recorder;
  FlutterSoundPlayer? _player;
  bool _isRecording = false;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    initRecorder();
    _recorder = FlutterSoundRecorder();
    _player = FlutterSoundPlayer();
  }

  @override
  void dispose() {
    _recorder?.closeRecorder();
    _player?.closePlayer();
    super.dispose();
  }
  Future initRecorder() async{
    final status = await Permission.microphone.request();
    if(status != PermissionStatus.granted){
      throw 'Microphone permission not granted';
    }
  }

  Future<String> _getFilePath() async {
    final appDir = await getApplicationDocumentsDirectory();  //抓取手機路徑
    final filePath = '${appDir.path}/audio.wav';
    return filePath;
  }

  Future<void> _startRecording() async {
    try {
      print('錯誤1');
      final filePath = await _getFilePath();
      print('錯誤2 ${filePath}');
      await _recorder?.openRecorder();
      print('錯誤3');
      await _recorder?.startRecorder(
        toFile: filePath, //錄製音檔的儲存位置
        codec: Codec.pcm16WAV,  //音檔的格式
      );
      print('錯誤4');
      setState(() {
        _isRecording = true;
      });
      print('錯誤5');
    } catch (e) {
      print(e);
    }
  }

  Future<void> _stopRecording() async {
    try {
      print('錯誤一');
      await _recorder?.stopRecorder();
      print('錯誤二');
      await _recorder?.closeRecorder();
      print('錯誤三');
      _saveRecording();
      print('錯誤四}');
      setState(() {
        _isRecording = false;
      });
      print('錯誤五');
    } catch (e) {
      print('錯誤六');
      print(e);
    }
  }

  Future<void> _startPlaying() async {
    try {
      final filePath = await _getFilePath();
      await _player?.openPlayer();
      await _player?.startPlayer(fromURI: filePath);
      setState(() {
        _isPlaying = true;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> _stopPlaying() async {
    try {
      await _player?.stopPlayer();
      await _player?.closePlayer();
      setState(() {
        _isPlaying = false;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> _saveRecording() async {
    final filePath = await _getFilePath();
    print('${filePath}');
    final file = File(filePath);
    print("${file}");
    final bytes = await file.readAsBytes();
    final savedFile = File('/path/to/saved/file.wav');  //設定儲存的路徑
    await file.writeAsBytes(bytes);  //將設定的路徑，存入手機內
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightGreenAccent.shade100,
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
                        'lib/image/talk.png',
                      ),
                    ),
                    const Text(
                      '自主言語',
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
                  height: 350,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        child: Image.asset(
                          'lib/image/backtalk.png',
                          height:MediaQuery.of(context).size.height,
                          width:MediaQuery.of(context).size.width,
                        ),
                      ),
                      Container(
                        child: Image.asset(
                          'lib/image/cold.png',
                          height: MediaQuery.of(context).size.height/4 ,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    ],
                  ),
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
                        width: 80,
                        height: 80,
                        child: ElevatedButton(
                          onPressed:() async{
                            if(_isRecording){
                              _stopRecording();
                            }else{
                              _startRecording();
                            }
                          },
                          child:Icon(
                            _isRecording? Icons.stop:Icons.mic,
                            size: 50,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width / 100,),
                    ClipOval(
                      child: Container(
                        color: Colors.redAccent,
                        width: 80,
                        height: 80,
                        child: ElevatedButton(
                          onPressed:() async{
                            if(_isPlaying){
                              _stopPlaying();
                            }else{
                              _startPlaying();
                            }
                          },
                          child:Icon(
                            _isPlaying? Icons.stop:Icons.play_arrow,
                            size: 50,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // ClipOval(
                //   child: Container(
                //     color: Colors.redAccent,
                //     width: 80,
                //     height: 80,
                //     child: ElevatedButton(
                //       onPressed:() async{
                //         if(_isRecording){
                //           stop();
                //         }else{
                //           record();
                //         }
                //       },
                //       child:Icon(
                //         _isRecording? Icons.stop:Icons.mic,
                //         size: 50,
                //         color: Colors.black87,
                //       ),
                //     ),
                //   ),
                // ),

              ],
            ),
          ),
        ));
  }
}
