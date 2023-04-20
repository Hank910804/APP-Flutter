import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Sound Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    final appDir = await getApplicationDocumentsDirectory();
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

  Future<void> _playRecording() async {
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
      appBar: AppBar(
        title: Text('Flutter Sound Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _isRecording
                ? ElevatedButton(
                    onPressed: _stopRecording,
                    child: Text('Stop Recording'),
                  )
                : ElevatedButton(
                    onPressed: _startRecording,
                    child: Text('Start Recording'),
                  ),
            SizedBox(height: 16),
            _isPlaying
                ? ElevatedButton(
                    onPressed: _stopPlaying,
                    child: Text('Stop Playing'),
                  )
                : ElevatedButton(
                    onPressed: _playRecording,
                    child: Text('Play Recording'),
                  ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveRecording,
              child: Text('Save Recording'),
            ),
          ],
        ),
      ),
    );
  }
}
