import RPi.GPIO as GPIO
import firebase_admin
from firebase_admin import credentials, db, storage
from pyfcm import FCMNotification
import time
import picamera2
import numpy as np

cred = credentials.Certificate('/home/pi/my-surveillance-app-firebase-adminsdk.json')
firebase_admin.initialize_app(cred, {'databaseURL': 'https://my-surveillance-app-default-rtdb.firebaseio.com/', 'storageBucket': 'my-surveillance-app.appspot.com'})

GPIO.setmode(GPIO.BOARD)
pir_pin = 7
GPIO.setup(pir_pin, GPIO.IN)


server_api_key = 'AAAAHcOEQd0:APA91bHEzj3KXd31N0lv6AWP3FGMwP-AKGimPE7k7ZbxrwT4F9hogGBu0rdX_i26D8I2_M0sYAknJjKSZ_kCddd7Gk9L6fzOxAdjem_86DylKnbdLwhIH6aPHmOi9YwCIentnJ4HHJG'

push_service = FCMNotification(api_key=server_api_key)

def capture_and_upload_to_firebase():
    with picamera2.Picamera2() as camera:

        camera_config = camera.create_still_configuration({"size": (1280, 720)})
        camera.configure(camera_config)
        camera.start()
        image_path = "mm.png"
        camera.capture_file(image_path)
        upload_image_to_firebase(image_path)

def upload_image_to_firebase(image_path):
    # Cr  er une r  f  rence    l'emplacement de stockage dans Firebase
   try:
    bucket = storage.bucket()
    blob = bucket.blob("images/" + image_path)
    
    # Envoyer l'image    Firebase Storage
    blob.upload_from_filename(image_path,timeout=120)
    print("Image uploaded to Firebase Storage.")
   except Exception as e:
    print(f"error upload: {e}")
