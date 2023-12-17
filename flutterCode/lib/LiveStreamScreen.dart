/*import 'package:flutter/material.dart';

class LiveStreamScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Stream'),
      ),
      body: Center(
        child: Image.network(
          'http://192.168.1.16:8000/stream.mjpg',
          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                    : null,
              ),
            );
          },
        ),
      ),
    );
  }*/












  
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LiveStreamScreen extends StatelessWidget {
  final String mjpegStreamUrl = 'http://192.168.0.1:8000/stream.mjpg';

  Future<void> _launchBrowser() async {
    if (await canLaunch(mjpegStreamUrl)) {
      await launch(mjpegStreamUrl);
    } else {
      throw 'Could not launch $mjpegStreamUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Stream'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _launchBrowser,
          child: Text('Open MJPEG Stream in Browser'),
        ),
      ),
    );
  }
}








/*
import 'package:flutter/material.dart';
import 'package:android_intent/android_intent.dart';
import 'dart:io' show Platform;

class LiveStreamScreen extends StatelessWidget {
  Future<void> _launchBrowser() async {
    final String url = 'http://192.168.1.16:8000/stream.mjpg';

    try {
      final AndroidIntent intent = AndroidIntent(
        action: 'action_view',
        data: url,
        package: Platform.isAndroid ? 'com.android.chrome' : null,
      );

      await intent.launch();
    } catch (e) {
      print('Error launching browser: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Stream'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _launchBrowser,
          child: Text('Open MJPEG Stream in Browser'),
        ),
      ),
    );
  }
}

*/