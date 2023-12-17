/*import 'package:flutter/material.dart';
//import 'package:camera/camera.dart';


class LiveCameraScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Camera'),
      ),
      body: Center(
        child: Text('Your Live Camera Content Goes Here'),
      ),
    );
  }
}
*/


 //send 1 image
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class LiveCameraScreen extends StatefulWidget {
  @override
  _LiveCameraScreenState createState() => _LiveCameraScreenState();
}

class _LiveCameraScreenState extends State<LiveCameraScreen> {
  late String imageUrl = ''; // Provide a default value

  @override
  void initState() {
    super.initState();
    // Call the function to fetch the image when the widget is initialized
    fetchImage();
  }

  // Function to fetch the image from Firebase Storage
  Future<void> fetchImage() async {
    try {
      var downloadUrl = await firebase_storage.FirebaseStorage.instance
          .ref('images/mm.png') // Replace with the correct path
          .getDownloadURL();

      setState(() {
        imageUrl = downloadUrl;
      });
    } catch (e) {
      print('Error fetching image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Camera'),
      ),
      body: Center(
        child: imageUrl.isNotEmpty
            ? Image.network(imageUrl)
            : CircularProgressIndicator(), // Show a loading indicator while fetching
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class LiveCameraScreen extends StatefulWidget {
  @override
  _LiveCameraScreenState createState() => _LiveCameraScreenState();
}

class _LiveCameraScreenState extends State<LiveCameraScreen> {
  late List<String> imageUrls = [];

  @override
  void initState() {
    super.initState();
    fetchImages();
  }

  Future<void> fetchImages() async {
    try {
      var result = await firebase_storage.FirebaseStorage.instance
          .ref('images/') // Replace with the correct directory path
          .listAll();

      for (var ref in result.items) {
        var downloadUrl = await ref.getDownloadURL();
        setState(() {
          imageUrls.add(downloadUrl);
        });
      }
    } catch (e) {
      print('Error fetching images: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Camera'),
      ),
      body: Center(
        child: imageUrls.isNotEmpty
            ? ListView.builder(
                itemCount: imageUrls.length,
                itemBuilder: (context, index) {
                  return Image.network(imageUrls[index]);
                },
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}*/





