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
desired_fps = 10      # Set the desired frames per second
frame_interval = 1 / desired_fps  # Calculate time interval between frames

def center_crop(image):
    h, w = image.shape[:2]
    
    # Find the smaller dimension and calculate cropping start
    if h > w:
        crop_size = w
        y_start = (h - w) // 2
        x_start = 0
    else:
        crop_size = h
        x_start = (w - h) // 2
        y_start = 0

    # Crop the image to the largest centered square
    cropped_image = image[y_start:y_start + crop_size, x_start:x_start + crop_size]
    
    return cropped_image

last_frame_time = 0  # Track the last frame's timestamp

while True:
    current_time = time.time()
    elapsed_time = current_time - last_frame_time

    if elapsed_time >= frame_interval:
        last_frame_time = current_time

        frame = jajucha2.camera.get_image()

        # Center crop the image to make it square
        cropped_frame = center_crop(frame)

        # Resize the cropped image to 640x640
        resized_frame = cv2.resize(cropped_frame, (640, 640))
        
        encode_param = [int(cv2.IMWRITE_JPEG_QUALITY), compression_rate]
        _, buffer = cv2.imencode('.jpg', resized_frame, encode_param)

        jpg_as_text = base64.b64encode(buffer).decode('utf-8')

        data = {'image': jpg_as_text}
        response = requests.post(url, json=data)

        if response.status_code != 200:
            print('Failed to send data')
