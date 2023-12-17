import 'package:firebase_messaging/firebase_messaging.dart';


class FirebaseApi{
  final _firebaseMessaging =FirebaseMessaging.instance;


  Future<void> initNotifications() async{

   try{
    await _firebaseMessaging.requestPermission();


    final FCMToken= await _firebaseMessaging.getToken();
    print('Token: $FCMToken');
   } catch (e){
    print('error: $e');}
   } 



  }

