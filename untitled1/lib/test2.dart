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
import 'package:permission_handler/permission_handler.dart';
import 'dart:typed_data';

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
  var isrecord = 1;
  final recorder = FlutterSoundRecorder();
  // bool _isRecorderInitialised = false;
  // bool get isRecording => recorder!.isRecording;
  bool isRecorderReady = false;
  @override
  void initState() {
    super.initState();
    initRecorder();
  }
  @override
  void dispose() {
    // if(!_isRecorderInitialised) return;
    //
    // recorder!.closeRecorder();
    // // recorder = null;
    // _isRecorderInitialised = false;
    recorder.closeRecorder();
    super.dispose();
  }
  Future initRecorder() async{
    // recorder = FlutterSoundRecorder();

    // final statusMic = await Permission.microphone.request();
    // if(statusMic != PermissionStatus.granted){
    //   throw RecordingPermissionException('microphone permission');
    // }
    // final statusStorage = await Permission.storage.status;
    // if (!statusStorage.isGranted) {
    //   await Permission.storage.request();
    // }
    // await recorder!.openRecorder();
    // directoryPath = await _directoryPath();
    // completePath = await _completePath(directoryPath);
    // _createDirectory();
    // _createFile();
    // _isRecorderInitialised = true;
    final status = await Permission.microphone.request();
    if(status != PermissionStatus.granted){
      throw 'Microphone permission not granted';
    }
    await recorder.openRecorder();
    recorder.setSubscriptionDuration(
      const Duration(milliseconds: 500),
    );
  }
  Future record() async{
    // if(!_isRecorderInitialised) return;
    // print("Path where the file will be : "+completePath);
    // await recorder!.startRecorder(
    //   toFile: completePath,
    //   numChannels : 1,
    //   sampleRate: 44100,
    // );
    await recorder.startRecorder(toFile: 'audio.wav',codec: Codec.pcm16WAV);
  }
  Future stop() async{
    // if(!_isRecorderInitialised) return;
    // var s = await recorder!.stopRecorder();
    // File f = File(completePath);
    // print("The created file : $f");
    final path = await recorder.stopRecorder();
    final audioFile = File(path!);
    print('Recorded audio: $audioFile');
  }
  Future toggleRecording() async{
    if(recorder!.isStopped){
      await record();
    }else{
      await stop();

    }
  }
/*
  String completePath = "";
  String directoryPath = "";
  Future<String> _completePath(String directory) async {
    var fileName = _fileName();
    return "$directory$fileName";
  }
  Future<String> _directoryPath() async {
    var directory = await getExternalStorageDirectory();
    var directoryPath = directory!.path;
    return "$directoryPath/records/";
  }
  String _fileName() {
    return "record.wav";
  }
  Future _createFile() async {
    File(completePath)
        .create(recursive: true)
        .then((File file) async {
      //write to file
      Uint8List bytes = await file.readAsBytes();
      file.writeAsBytes(bytes);
      print("FILE CREATED AT : "+file.path);
    });
  }
  void _createDirectory() async {
    bool isDirectoryCreated = await Directory(directoryPath).exists();
    if (!isDirectoryCreated) {
      Directory(directoryPath).create()
          .then((Directory directory) {
        print("DIRECTORY CREATED AT : " +directory.path);
      });
    }
  }
*/
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
                ElevatedButton(
                    child: Icon(
                      recorder.isRecording ? Icons.stop : Icons.mic,
                      size: 80,
                    ),
                    onPressed: () async{
                      if(recorder.isRecording){
                        await stop();
                      }else{
                        await record();
                      }
                      setState(() {});
                    }
                )

                // ClipOval(
                //   child: Container(
                //     color: Colors.redAccent,
                //     width: 80,
                //     height: 80,
                //     child: ElevatedButton(
                //       onPressed:() async{
                //         print('test,$isrecord');
                //         if(isrecord == 1){
                //           isrecord = 0;
                //         }else{
                //           isrecord = 1;
                //         }
                //       },
                //       child:Icon(
                //         isrecord == 0? Icons.stop:Icons.mic,
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
