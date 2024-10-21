import cv2
import numpy as np
import requests
import base64
import platform
import jajucha2
import time

url = ''

architecture = platform.machine()

if architecture == 'aarch64':
    url = 'http://121.184.63.113:4000/center'
elif architecture == 'x86_64':
    url = 'http://121.184.63.113:4000/center'

compression_rate = 50  # Initial compression rate

while True:
    start_time = time.time()  # Track time before sending the image

    frame = jajucha2.camera.get_image()
    
    encode_param = [int(cv2.IMWRITE_JPEG_QUALITY), compression_rate]
    _, buffer = cv2.imencode('.jpg', frame, encode_param)

    jpg_as_text = base64.b64encode(buffer).decode('utf-8')

    data = {'image': jpg_as_text}
    response = requests.post(url, json=data)

    if response.status_code != 200:
        print('Failed to send data')

    time.sleep(0.1)

