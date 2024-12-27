-- Drop the examples table if it exists
DROP TABLE IF EXISTS Examples;

-- Create the table 'Examples' if it does not exist
CREATE TABLE `Examples` (
  `name` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `level` varchar(100) DEFAULT NULL,
  `func` int DEFAULT NULL,
  `dbtype` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `Examples` (`name`, `type`, `level`, `func`, `dbtype`)
VALUES
('python', 'learn', 'easy', 0, NULL),
('opencv', 'learn', 'intermediate', 0, NULL),
('jajucha', 'learn', 'easy', 0, NULL),
('classification', 'learn', 'intermediate', 2, 'classification'),
('jupyter', 'empty', 'none', 0, NULL),
('driving', 'learn', 'intermediate', 0, NULL),
('objectdetection', 'learn', 'intermediate', 2, 'objectdetection'),
('pytorch', 'learn', 'hard', 0, NULL),
('depth', 'learn', 'hard', 2, NULL),
('numpy', 'learn', 'intermediate', 2, NULL),
('Line-Classification-Basic', 'mission', 'easy', 2, 'classification'),
('Vision-ObjectDetection-Basic', 'mission', 'easy', 2, 'objectdetection'),
('LiDAR-ObjectDetection-Basic', 'mission', 'easy', 0, 'objectdetection'),
('Depth-ObjectDetection-Basic', 'mission', 'easy', 0, 'objectdetection'),
('Line-Detection-Basic', 'mission', 'easy', 0, NULL),
('Line-Detection-Advanced', 'mission', 'intermediate', 0, NULL),
('Line-Classification-Advanced', 'mission', 'intermediate', 2, 'classification'),
('Vision-ObjectDetection-Advanced', 'mission', 'intermediate', 2, 'objectdetection'),
('LiDAR-ObjectDetection-Advanced', 'mission', 'intermediate', 0, 'objectdetection'),
('Depth-ObjectDetection-Advanced', 'mission', 'intermediate', 0, NULL),
('TrafficLight-ObjectDetection-Basic', 'mission', 'easy', 2, 'objectdetection'),
('TrafficLight-ObjectDetection-Advanced', 'mission', 'intermediate', 2, 'objectdetection');

-- Drop the Models table if it exists
DROP TABLE IF EXISTS Models;

-- Create the table 'Models' if it does not exist
CREATE TABLE  `Models` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Type` varchar(100) DEFAULT NULL,
  `shape` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `Models` (`id`, `Name`, `Type`, `shape`, `Description`)
VALUES
(1, 'RESNET18', 'classification', '[1, 3, 224, 224]', 'ResNet18은 잔차 연결을 사용해 깊은 신경망의 기울기 소실 문제를 해결한 18층 딥러닝 모델입니다.'),
(2, 'RESNET34', 'classification', '[1, 3, 224, 224]', 'ResNet34은 잔차 연결을 사용해 깊은 신경망의 기울기 소실 문제를 해결한 34층 딥러닝 모델입니다.'),
(3, 'RESNET50', 'classification', '[1, 3, 224, 224]', 'ResNet50은 잔차 연결을 사용해 깊은 신경망의 기울기 소실 문제를 해결한 50층 딥러닝 모델입니다.'),
(4, 'YOLO8N', 'objectdetection', '[1,3,640,640]', 'YOLOv8n은 Object Detection 경량화된 딥러닝 모델로, YOLO 모델의 최신 버전 중 하나입니다.'),
(5, 'YOLO9N', 'objectdetection', '[1,3,640,640]', 'YOLO9N은 Object Detection 경량화된 딥러닝 모델로, YOLO 모델의 최신 버전 중 하나입니다.'),
(6, 'YOLO11N', 'objectdetection', '[1,3,640,640]', 'YOLO11N은 Object Detection 경량화된 딥러닝 모델로, YOLO 모델의 최신 버전 중 하나입니다.');

-- Drop the Missions table if it exists
DROP TABLE IF EXISTS Missions;

-- Create the table 'Missions' if it does not exist
CREATE TABLE `Missions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `Missions` (`id`, `name`, `Description`)
VALUES
(1, 'Line-Detection', 'Opencv-python 알고리즘을 이용하여 그리드를 그리고 특징점을 추출합니다'),
(2, 'Line-Classification', '인공지능 기반 Classification 알고리즘을 이용하여 차선을 종류별로 분류합니다'),
(3, 'Vision-ObjectDetection', '인공지능 기반 ObjectDetection 알고리즘을 이용하여 물체를 장애물로 감지합니다'),
(4, 'LiDAR-ObjectDetection', 'LiDAR 센서를 이용하여 주변 장애물을 감지합니다'),
(5, 'Depth-ObjectDetection', '3차원 Depth 카메라를 이용하여 장애물을 감지합니다'),
(6, 'TrafficLight-ObjectDetection', '신호등을 인식하여 신호등의 색을 분류합니다')
ON DUPLICATE KEY UPDATE
`name` = VALUES(`name`), `Description` = VALUES(`Description`);
