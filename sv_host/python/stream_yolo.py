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

compression_rate = 40  # Initial compression rate

while True:
    start_time = time.time()  # Track time before sending the image

    frame = jajucha2.camera.get_image()
    
    resized_frame = cv2.resize(frame, (640, 640))

    encode_param = [int(cv2.IMWRITE_JPEG_QUALITY), compression_rate]
    _, buffer = cv2.imencode('.jpg', resized_frame, encode_param)

    jpg_as_text = base64.b64encode(buffer).decode('utf-8')

    data = {'image': jpg_as_text}
    response = requests.post(url, json=data)

    # Check the response time
    response_time = time.time() - start_time

    print('compression_rate:', compression_rate, 'response_time:', response_time)

    if response_time > 0.05:  # If response takes more than 100ms
        compression_rate = max(10, compression_rate - 5)  # Increase compression, lower quality
    else:
        compression_rate = min(100, compression_rate + 5)  # Decrease compression, improve quality

    if response.status_code != 200:
        print('Failed to send data')


