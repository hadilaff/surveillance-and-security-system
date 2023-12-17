import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_app/LoginPage.dart';
import 'package:my_app/firebase_api.dart';
import 'NewBar.dart';
import 'SplashPage.dart';
import 'LiveCameraScreen.dart';
//import 'package:contacts_service/contacts_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//import 'notif.dart';
//import 'RegisterPage.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  try{
   await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyD8dqZ0VEj8DiGJyuyPrdjMLkt4bdLx8YU" , 
      appId: "1:127834276317:android:e619af33b9c115c4797634", 
      messagingSenderId: "127834276317", 
      projectId: "my-surveillance-app",
      storageBucket: "my-surveillance-app.appspot.com",
      ),
   );
  } catch(e){
    print("error: $e");

  }
  //await initLocalNotifications();
  try{
   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print("FCM Message Received:");
    print("  Notification: ${message.notification?.title} ${message.notification?.body}");
    print("  Data: ${message.data}");
    String? status = message.data['status'];
    String? body = message.data['body'];
    String? title = message.data['title'];
    print('Status: $status');
    print('Title: $title');
    print('Body: $body');

  // Display a local notification
    showLocalNotification(title, body);
    
    //showNotification(message.notification?.title, message.notification?.body);
  // Handle the notification or data as needed.
});

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    handleNotification(message);
  });

  // Check if the app was opened from a terminated state
  RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();
  if (initialMessage != null) {
    handleNotification(initialMessage);
  }


  } catch(e){print("error: $e");}
  
  const AndroidInitializationSettings androidInitializationSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  final InitializationSettings initializationSettings =
      InitializationSettings(android: androidInitializationSettings);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  //await initNotifications();


  
  await FirebaseApi().initNotifications();
  print('Running the app...');
  


  
  //await FirebaseApi().initNotifications();
  runApp(const MyApp());
}

void handleNotification(RemoteMessage message) {
  // Handle the notification tap action
  if (message.data['payload'] == 'LiveCameraScreen') {
    // Navigate to the LiveCameraScreen
    Navigator.of(MyApp.navigatorKey.currentContext!).push(
      MaterialPageRoute(builder: (context) => LiveCameraScreen()),
    );
  }
}

/*main()  {
  
  runApp(const MyApp());
}*/


void showLocalNotification(String? title, String? body) async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'your_channel_id', // Change this to your own channel ID
    'your_channel_name', // Change this to your own channel name
    
    importance: Importance.max,
    priority: Priority.high,
  );
  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);

  await flutterLocalNotificationsPlugin.show(
    0, // Notification ID
    title ?? 'Default Title',
    body ?? 'Default Body',
    platformChannelSpecifics,
    payload: 'LiveCameraScreen',
    
  );
}





class MyApp extends StatelessWidget {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF60BBBD)),
        useMaterial3: true,
      ),
      
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: SplashPage(
        duration: 2, // Adjust the duration as needed
        //goToPage: MyHomePage(title: 'Flutter Demo Home Page'),
        goToPage: LoginPage(),
      ),
      
    );
  }
}




class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      drawer: NewBar(),
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text("Monitoring Home Page"),
      ),
      body: Container(
       color: Color(0xFF847c90),
      
       child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text(
              "Protecting What Matters Most",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w200,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20), //space between text and image

            Image.asset(
              //'security-system-techno.jpg',
              'home.png',
              width: 450,
              height: 450,
            )
          ],
        ),
      ),
      
        
      ),    
    );
  }
}