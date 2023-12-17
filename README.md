# surveillance-and-security-system
Flutter application for monitoring using a Raspberry Pi camera

It is a mobile surveillance and security application developed using Dart.
If the PIR motion sensor detects movement, it sends an 'alert' notification to our application, captures an image, and stores it in Firebase. 
Additionally, there is another feature where the user can access the camera in real-time.

![Screenshot from 2023-12-17 10-59-44](https://github.com/hadilaff/surveillance-and-security-system/assets/58861613/b45eb378-843a-41ea-815d-795954ab65ac)




Hardware:
- Raspberry pi
- camera module
- pir motion sensor  
Sorftware:
- Flutter
- Python
- Firebase

Make Sure That you Install picamera2 and other libraries like firebase_admin...  
- Connect to raspberry: ssh@raspberrypi.local (or with ipadress)
- python3 pircam.py (run the code to detect motion, send pictures and notifications to firebase, display notification and picture on the application)
- python3 live1.py (active live camera)
