-- #################### CLASS TABLE ####################

-- Create the table 'Classes' if it does not exist
CREATE TABLE IF NOT EXISTS `Classes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project` varchar(100) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Check if column 'id' exists
SELECT COUNT(*) INTO @id_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'Classes'
  AND COLUMN_NAME = 'id';

-- If 'id' column does not exist, add it
SET @sql_id = IF(@id_exists = 0,
    'ALTER TABLE `Classes` ADD COLUMN `id` int NOT NULL AUTO_INCREMENT;',
    'SELECT "Column id already exists";');

PREPARE stmt FROM @sql_id;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check if column 'project' exists
SELECT COUNT(*) INTO @project_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'Classes'
  AND COLUMN_NAME = 'project';

-- If 'project' column does not exist, add it
SET @sql_project = IF(@project_exists = 0,
    'ALTER TABLE `Classes` ADD COLUMN `project` varchar(100) DEFAULT NULL;',
    'SELECT "Column project already exists";');

PREPARE stmt FROM @sql_project;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check if column 'Name' exists
SELECT COUNT(*) INTO @name_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'Classes'
  AND COLUMN_NAME = 'Name';

-- If 'Name' column does not exist, add it
SET @sql_name = IF(@name_exists = 0,
    'ALTER TABLE `Classes` ADD COLUMN `Name` varchar(100) DEFAULT NULL;',
    'SELECT "Column Name already exists";');

PREPARE stmt FROM @sql_name;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SELECT COUNT(*) INTO @color_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'Classes'
  AND COLUMN_NAME = 'color';

-- If 'color' column does not exist, add it
SET @sql_color = IF(@color_exists = 0,
    'ALTER TABLE `Classes` ADD COLUMN `color` varchar(100) DEFAULT NULL;',
    'SELECT "Column color already exists";');

PREPARE stmt FROM @sql_color;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- #################### EXAMPLES TABLE ####################

-- Create the table 'Examples' if it does not exist
CREATE TABLE IF NOT EXISTS `Examples` (
  `name` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `level` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- Check if column 'name' exists
SELECT COUNT(*) INTO @name_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'Examples'
  AND COLUMN_NAME = 'name';

-- If 'name' column does not exist, add it
SET @sql_name = IF(@name_exists = 0,
    'ALTER TABLE `Examples` ADD COLUMN `name` varchar(100) DEFAULT NULL;',
    'SELECT "Column name already exists";');

PREPARE stmt FROM @sql_name;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check if column 'type' exists
SELECT COUNT(*) INTO @type_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'Examples'
  AND COLUMN_NAME = 'type';

-- If 'type' column does not exist, add it
SET @sql_type = IF(@type_exists = 0,
    'ALTER TABLE `Examples` ADD COLUMN `type` varchar(100) DEFAULT NULL;',
    'SELECT "Column type already exists";');

PREPARE stmt FROM @sql_type;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check if column 'level' exists
SELECT COUNT(*) INTO @level_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'Examples'
  AND COLUMN_NAME = 'level';

-- If 'level' column does not exist, add it
SET @sql_level = IF(@level_exists = 0,
    'ALTER TABLE `Examples` ADD COLUMN `level` varchar(100) DEFAULT NULL;',
    'SELECT "Column level already exists";');

PREPARE stmt FROM @sql_level;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check if column 'func' exists
SELECT COUNT(*) INTO @func_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'Examples'
  AND COLUMN_NAME = 'func';

-- If 'func' column does not exist, add it
SET @sql_func = IF(@func_exists = 0,
    'ALTER TABLE `Examples` ADD COLUMN `func` int DEFAULT NULL;',
    'SELECT "Column func already exists";');

PREPARE stmt FROM @sql_func;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;


-- #################### MODELS TABLE ####################

-- Create the table 'Models' if it does not exist
CREATE TABLE IF NOT EXISTS `Models` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Type` varchar(100) DEFAULT NULL,
  `shape` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- Check if column 'id' exists
SELECT COUNT(*) INTO @id_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'Models'
  AND COLUMN_NAME = 'id';

-- If 'id' column does not exist, add it
SET @sql_id = IF(@id_exists = 0,
    'ALTER TABLE `Models` ADD COLUMN `id` int NOT NULL AUTO_INCREMENT;',
    'SELECT "Column id already exists";');

PREPARE stmt FROM @sql_id;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check if column 'Name' exists
SELECT COUNT(*) INTO @Name_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'Models'
  AND COLUMN_NAME = 'Name';

-- If 'Name' column does not exist, add it
SET @sql_Name = IF(@Name_exists = 0,
    'ALTER TABLE `Models` ADD COLUMN `Name` varchar(100) DEFAULT NULL;',
    'SELECT "Column Name already exists";');

PREPARE stmt FROM @sql_Name;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check if column 'Type' exists
SELECT COUNT(*) INTO @Type_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'Models'
  AND COLUMN_NAME = 'Type';

-- If 'Type' column does not exist, add it
SET @sql_Type = IF(@Type_exists = 0,
    'ALTER TABLE `Models` ADD COLUMN `Type` varchar(100) DEFAULT NULL;',
    'SELECT "Column Type already exists";');

PREPARE stmt FROM @sql_Type;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check if column 'shape' exists
SELECT COUNT(*) INTO @shape_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'Models'
  AND COLUMN_NAME = 'shape';

-- If 'shape' column does not exist, add it
SET @sql_shape = IF(@shape_exists = 0,
    'ALTER TABLE `Models` ADD COLUMN `shape` varchar(100) DEFAULT NULL;',
    'SELECT "Column shape already exists";');

PREPARE stmt FROM @sql_shape;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check if column 'description' exists
SELECT COUNT(*) INTO @description_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'Models'
  AND COLUMN_NAME = 'description';

-- If 'description' column does not exist, add it
SET @sql_description = IF(@description_exists = 0,
    'ALTER TABLE `Models` ADD COLUMN `description` varchar(100) DEFAULT NULL;',
    'SELECT "Column description already exists";');

PREPARE stmt FROM @sql_description;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- #################### PROJECTS TABLE ####################
-- Create the table 'Projects' if it does not exist

CREATE TABLE IF NOT EXISTS `Projects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Type` varchar(100) DEFAULT NULL,
  `func` int DEFAULT NULL,
  `dbtype` varchar(100) DEFAULT NULL,
  `model` varchar(100) DEFAULT NULL,
  `imported` tinyint(1) DEFAULT NULL,
  `section` int DEFAULT NULL,
  `subsection` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Check if column 'id' exists
SELECT COUNT(*) INTO @id_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'Projects'
  AND COLUMN_NAME = 'id';

-- If 'id' column does not exist, add it
SET @sql_id = IF(@id_exists = 0,
    'ALTER TABLE `Projects` ADD COLUMN `id` int NOT NULL AUTO_INCREMENT;',
    'SELECT "Column id already exists";');

PREPARE stmt FROM @sql_id;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check if column 'Name' exists
SELECT COUNT(*) INTO @Name_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'Projects'
  AND COLUMN_NAME = 'Name';

-- If 'Name' column does not exist, add it
SET @sql_Name = IF(@Name_exists = 0,
    'ALTER TABLE `Projects` ADD COLUMN `Name` varchar(100) DEFAULT NULL;',
    'SELECT "Column Name already exists";');

PREPARE stmt FROM @sql_Name;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check if column 'Type' exists
SELECT COUNT(*) INTO @Type_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'Projects'
  AND COLUMN_NAME = 'Type';

-- If 'Type' column does not exist, add it
SET @sql_Type = IF(@Type_exists = 0,
    'ALTER TABLE `Projects` ADD COLUMN `Type` varchar(100) DEFAULT NULL;',
    'SELECT "Column Type already exists";');

PREPARE stmt FROM @sql_Type;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check if column 'func' exists
SELECT COUNT(*) INTO @func_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'Projects'
  AND COLUMN_NAME = 'func';

-- If 'func' column does not exist, add it
SET @sql_func = IF(@func_exists = 0,
    'ALTER TABLE `Projects` ADD COLUMN `func` int DEFAULT NULL;',
    'SELECT "Column func already exists";');

PREPARE stmt FROM @sql_func;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check if column 'dbtype' exists
SELECT COUNT(*) INTO @dbtype_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'Projects'
  AND COLUMN_NAME = 'dbtype';

-- If 'dbtype' column does not exist, add it
SET @sql_dbtype = IF(@dbtype_exists = 0,
    'ALTER TABLE `Projects` ADD COLUMN `dbtype` varchar(100) DEFAULT NULL;',
    'SELECT "Column dbtype already exists";');

PREPARE stmt FROM @sql_dbtype;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check if column 'model' exists
SELECT COUNT(*) INTO @model_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'Projects'
  AND COLUMN_NAME = 'model';

-- If 'model' column does not exist, add it
SET @sql_model = IF(@model_exists = 0,
    'ALTER TABLE `Projects` ADD COLUMN `model` varchar(100) DEFAULT NULL;',
    'SELECT "Column model already exists";');

PREPARE stmt FROM @sql_model;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check if column 'imported' exists
SELECT COUNT(*) INTO @imported_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'Projects'
  AND COLUMN_NAME = 'imported';

-- If 'imported' column does not exist, add it
SET @sql_imported = IF(@imported_exists = 0,
    'ALTER TABLE `Projects` ADD COLUMN `imported` tinyint(1) DEFAULT NULL;',
    'SELECT "Column imported already exists";');

PREPARE stmt FROM @sql_imported;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check if column 'section' exists
SELECT COUNT(*) INTO @section_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'Projects'
  AND COLUMN_NAME = 'section';

-- If 'section' column does not exist, add it
SET @sql_section = IF(@section_exists = 0,
    'ALTER TABLE `Projects` ADD COLUMN `section` int DEFAULT NULL;',
    'SELECT "Column section already exists";');

PREPARE stmt FROM @sql_section;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check if column 'subsection' exists
SELECT COUNT(*) INTO @subsection_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'Projects'
  AND COLUMN_NAME = 'subsection';

-- If 'subsection' column does not exist, add it
SET @sql_subsection = IF(@subsection_exists = 0,
    'ALTER TABLE `Projects` ADD COLUMN `subsection` int DEFAULT NULL;',
    'SELECT "Column subsection already exists";');

PREPARE stmt FROM @sql_subsection;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check if column 'genstatus' exists
SELECT COUNT(*) INTO @genstatus_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'Projects'
  AND COLUMN_NAME = 'genstatus';

-- If 'genstatus' column does not exist, add it
SET @sql_genstatus = IF(@genstatus_exists = 0,
    'ALTER TABLE `Projects` ADD COLUMN `genstatus` tinyint(1) DEFAULT NULL;',
    'SELECT "Column genstatus already exists";');

PREPARE stmt FROM @sql_genstatus;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- #################### USERS TABLE ####################
-- Step 1: Create the table if it doesn't exist
CREATE TABLE IF NOT EXISTS `UserModels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Location` varchar(100) DEFAULT NULL,
  `Model` varchar(100) DEFAULT NULL,
  `uuid` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Step 2: Add missing columns

-- Check and add 'id' column
SELECT COUNT(*) INTO @id_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'UserModels'
  AND COLUMN_NAME = 'id';

SET @sql_id = IF(@id_exists = 0,
    'ALTER TABLE `UserModels` ADD COLUMN `id` int NOT NULL AUTO_INCREMENT;',
    'SELECT "Column id already exists";');

PREPARE stmt FROM @sql_id;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check and add 'Name' column
SELECT COUNT(*) INTO @Name_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'UserModels'
  AND COLUMN_NAME = 'Name';

SET @sql_Name = IF(@Name_exists = 0,
    'ALTER TABLE `UserModels` ADD COLUMN `Name` varchar(100) NOT NULL DEFAULT \'DefaultName\';',
    'SELECT "Column Name already exists";');

PREPARE stmt FROM @sql_Name;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Optional: Remove default value from 'Name' column if necessary
-- ALTER TABLE `UserModels` MODIFY COLUMN `Name` varchar(100) NOT NULL;

-- Check and add 'Location' column
SELECT COUNT(*) INTO @Location_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'UserModels'
  AND COLUMN_NAME = 'Location';

SET @sql_Location = IF(@Location_exists = 0,
    'ALTER TABLE `UserModels` ADD COLUMN `Location` varchar(100) DEFAULT NULL;',
    'SELECT "Column Location already exists";');

PREPARE stmt FROM @sql_Location;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check and add 'Model' column
SELECT COUNT(*) INTO @Model_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'UserModels'
  AND COLUMN_NAME = 'Model';

SET @sql_Model = IF(@Model_exists = 0,
    'ALTER TABLE `UserModels` ADD COLUMN `Model` varchar(100) DEFAULT NULL;',
    'SELECT "Column Model already exists";');

PREPARE stmt FROM @sql_Model;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check and add 'uuid' column
SELECT COUNT(*) INTO @uuid_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'UserModels'
  AND COLUMN_NAME = 'uuid';

SET @sql_uuid = IF(@uuid_exists = 0,
    'ALTER TABLE `UserModels` ADD COLUMN `uuid` varchar(100) DEFAULT NULL;',
    'SELECT "Column uuid already exists";');

PREPARE stmt FROM @sql_uuid;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- #################### WORKING DIRECTORY TABLE ####################

-- Create the table 'WorkingDirectory' if it does not exist
CREATE TABLE IF NOT EXISTS `WorkingDirectory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `projectname` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

-- Check if column 'id' exists
SELECT COUNT(*) INTO @id_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'WorkingDirectory'
  AND COLUMN_NAME = 'id';

-- If 'id' column does not exist, add it
SET @sql_id = IF(@id_exists = 0,
    'ALTER TABLE `WorkingDirectory` ADD COLUMN `id` int NOT NULL AUTO_INCREMENT;',
    'SELECT "Column id already exists";');

PREPARE stmt FROM @sql_id;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check if column 'projectname' exists
SELECT COUNT(*) INTO @projectname_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'WorkingDirectory'
  AND COLUMN_NAME = 'projectname';

-- If 'projectname' column does not exist, add it
SET @sql_projectname = IF(@projectname_exists = 0,
    'ALTER TABLE `WorkingDirectory` ADD COLUMN `projectname` varchar(100) DEFAULT NULL;',
    'SELECT "Column projectname already exists";');

PREPARE stmt FROM @sql_projectname;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check if column 'location' exists
SELECT COUNT(*) INTO @location_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'WorkingDirectory'
  AND COLUMN_NAME = 'location';

-- If 'location' column does not exist, add it
SET @sql_location = IF(@location_exists = 0,
    'ALTER TABLE `WorkingDirectory` ADD COLUMN `location` varchar(100) DEFAULT NULL;',
    'SELECT "Column location already exists";');

PREPARE stmt FROM @sql_location;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- #################### YOLO IMAGE #################### 

-- Create the table 'YoloBoxes' if it does not exist
CREATE TABLE IF NOT EXISTS `YoloBoxes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `x` varchar(100) DEFAULT NULL,
  `y` varchar(100) DEFAULT NULL,
  `w` varchar(100) DEFAULT NULL,
  `h` varchar(100) DEFAULT NULL,
  `class` varchar(100) DEFAULT NULL,
  `color` varchar(100) DEFAULT NULL,
  `num` int DEFAULT NULL,
  `projectname` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `YoloBoxes_YoloImage_FK` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Check if column 'id' exists
SELECT COUNT(*) INTO @id_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'YoloBoxes'
  AND COLUMN_NAME = 'id';

-- If 'id' column does not exist, add it
SET @sql_id = IF(@id_exists = 0,
    'ALTER TABLE `YoloBoxes` ADD COLUMN `id` int NOT NULL AUTO_INCREMENT;',
    'SELECT "Column id already exists";');

PREPARE stmt FROM @sql_id;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check if column 'Name' exists
SELECT COUNT(*) INTO @Name_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'YoloBoxes'
  AND COLUMN_NAME = 'Name';

-- If 'Name' column does not exist, add it
SET @sql_Name = IF(@Name_exists = 0,
    'ALTER TABLE `YoloBoxes` ADD COLUMN `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL;',
    'SELECT "Column Name already exists";');

PREPARE stmt FROM @sql_Name;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check if column 'x' exists
SELECT COUNT(*) INTO @x_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'YoloBoxes'
  AND COLUMN_NAME = 'x';

-- If 'x' column does not exist, add it
SET @sql_x = IF(@x_exists = 0,
    'ALTER TABLE `YoloBoxes` ADD COLUMN `x` varchar(100) DEFAULT NULL;',
    'SELECT "Column x already exists";');

PREPARE stmt FROM @sql_x;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check if column 'y' exists
SELECT COUNT(*) INTO @y_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'YoloBoxes'
  AND COLUMN_NAME = 'y';

-- If 'y' column does not exist, add it
SET @sql_y = IF(@y_exists = 0,
    'ALTER TABLE `YoloBoxes` ADD COLUMN `y` varchar(100) DEFAULT NULL;',
    'SELECT "Column y already exists";');

PREPARE stmt FROM @sql_y;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check if column 'w' exists
SELECT COUNT(*) INTO @w_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'YoloBoxes'
  AND COLUMN_NAME = 'w';

-- If 'w' column does not exist, add it
SET @sql_w = IF(@w_exists = 0,
    'ALTER TABLE `YoloBoxes` ADD COLUMN `w` varchar(100) DEFAULT NULL;',
    'SELECT "Column w already exists";');

PREPARE stmt FROM @sql_w;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check if column 'h' exists
SELECT COUNT(*) INTO @h_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'YoloBoxes'
  AND COLUMN_NAME = 'h';

-- If 'h' column does not exist, add it
SET @sql_h = IF(@h_exists = 0,
    'ALTER TABLE `YoloBoxes` ADD COLUMN `h` varchar(100) DEFAULT NULL;',
    'SELECT "Column h already exists";');

PREPARE stmt FROM @sql_h;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check if column 'class' exists
SELECT COUNT(*) INTO @class_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'YoloBoxes'
  AND COLUMN_NAME = 'class';

-- If 'class' column does not exist, add it
SET @sql_class = IF(@class_exists = 0,
    'ALTER TABLE `YoloBoxes` ADD COLUMN `class` varchar(100) DEFAULT NULL;',
    'SELECT "Column class already exists";');

PREPARE stmt FROM @sql_class;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check if column 'color' exists
SELECT COUNT(*) INTO @color_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'YoloBoxes'
  AND COLUMN_NAME = 'color';

-- If 'color' column does not exist, add it
SET @sql_color = IF(@color_exists = 0,
    'ALTER TABLE `YoloBoxes` ADD COLUMN `color` varchar(100) DEFAULT NULL;',
    'SELECT "Column color already exists";');

PREPARE stmt FROM @sql_color;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check if column 'num' exists
SELECT COUNT(*) INTO @num_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'YoloBoxes'
  AND COLUMN_NAME = 'num';

-- If 'num' column does not exist, add it
SET @sql_num = IF(@num_exists = 0,
    'ALTER TABLE `YoloBoxes` ADD COLUMN `num` int DEFAULT NULL;',
    'SELECT "Column num already exists";');

PREPARE stmt FROM @sql_num;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check if column 'projectname' exists
SELECT COUNT(*) INTO @projectname_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'YoloBoxes'
  AND COLUMN_NAME = 'projectname';

-- If 'projectname' column does not exist, add it
SET @sql_projectname = IF(@projectname_exists = 0,
    'ALTER TABLE `YoloBoxes` ADD COLUMN `projectname` varchar(100) DEFAULT NULL;',
    'SELECT "Column projectname already exists";');

PREPARE stmt FROM @sql_projectname;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- #################### YOLO IMAGE ####################

-- Create the table 'YoloImage' if it does not exist
CREATE TABLE IF NOT EXISTS `YoloImage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project` varchar(100) DEFAULT NULL,
  `Name` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

-- Check if column 'id' exists
SELECT COUNT(*) INTO @id_exists FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'YoloImage' AND COLUMN_NAME = 'id';

-- If 'id' column does not exist, add it
SET @sql_id = IF(@id_exists = 0,
    'ALTER TABLE `YoloImage` ADD COLUMN `id` int NOT NULL AUTO_INCREMENT;',
    'SELECT "Column id already exists";');

PREPARE stmt FROM @sql_id;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check if column 'project' exists
SELECT COUNT(*) INTO @project_exists FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'YoloImage' AND COLUMN_NAME = 'project';

-- If 'project' column does not exist, add it
SET @sql_project = IF(@project_exists = 0,
    'ALTER TABLE `YoloImage` ADD COLUMN `project` varchar(100) DEFAULT NULL;',
    'SELECT "Column project already exists";');

PREPARE stmt FROM @sql_project;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check if column 'Name' exists
SELECT COUNT(*) INTO @Name_exists FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'YoloImage' AND COLUMN_NAME = 'Name';

-- If 'Name' column does not exist, add it
SET @sql_Name = IF(@Name_exists = 0,
    'ALTER TABLE `YoloImage` ADD COLUMN `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL;',
    'SELECT "Column Name already exists";');

PREPARE stmt FROM @sql_Name;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check if column 'Name' exists
SELECT COUNT(*) INTO @Name_exists FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'YoloImage' AND COLUMN_NAME = 'Name';

-- If 'Name' column does not exist, add it
SET @sql_Name = IF(@Name_exists = 0,
    'ALTER TABLE `YoloImage` ADD COLUMN `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL;',
    'SELECT "Column Name already exists";');

PREPARE stmt FROM @sql_Name;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check if column 'type' exists
SELECT COUNT(*) INTO @type_exists FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'YoloImage' AND COLUMN_NAME = 'type';

-- If 'type' column does not exist, add it
SET @sql_type = IF(@type_exists = 0,
    'ALTER TABLE `YoloImage` ADD COLUMN `type` varchar(100) DEFAULT NULL;',
    'SELECT "Column type already exists";');

PREPARE stmt FROM @sql_type;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Examples

-- Lock the table for writing and alias for reading
LOCK TABLES `Examples` WRITE, `Examples` AS `e2` READ;

-- Disable keys for faster insertion (if applicable)
ALTER TABLE `Examples` DISABLE KEYS;

-- Insert data rows only if they do not already exist

-- First row
INSERT INTO `Examples` (`name`, `type`, `level`, `func`)
SELECT 'python', 'learn', 'easy', 0
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `Examples` AS `e2`
    WHERE `e2`.`name` = 'python' AND `e2`.`type` = 'learn' AND `e2`.`level` = 'easy' AND `e2`.`func` = 0
);

-- Second row
INSERT INTO `Examples` (`name`, `type`, `level`, `func`)
SELECT 'opencv', 'learn', 'intermediate', 0
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `Examples` AS `e2`
    WHERE `e2`.`name` = 'opencv' AND `e2`.`type` = 'learn' AND `e2`.`level` = 'intermediate' AND `e2`.`func` = 0
);

-- Third row
INSERT INTO `Examples` (`name`, `type`, `level`, `func`)
SELECT 'jajucha', 'learn', 'easy', 0
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `Examples` AS `e2`
    WHERE `e2`.`name` = 'jajucha' AND `e2`.`type` = 'learn' AND `e2`.`level` = 'easy' AND `e2`.`func` = 0
);

-- Fourth row
INSERT INTO `Examples` (`name`, `type`, `level`, `func`)
SELECT 'classification', 'learn', 'intermediate', 2
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `Examples` AS `e2`
    WHERE `e2`.`name` = 'classification' AND `e2`.`type` = 'learn' AND `e2`.`level` = 'intermediate' AND `e2`.`func` = 2
);

-- Fifth row
INSERT INTO `Examples` (`name`, `type`, `level`, `func`)
SELECT 'jupyter', 'empty', 'none', 0
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `Examples` AS `e2`
    WHERE `e2`.`name` = 'jupyter' AND `e2`.`type` = 'empty' AND `e2`.`level` = 'none' AND `e2`.`func` = 0
);

-- Sixth row
INSERT INTO `Examples` (`name`, `type`, `level`, `func`)
SELECT 'driving', 'learn', 'intermediate', 0
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `Examples` AS `e2`
    WHERE `e2`.`name` = 'driving' AND `e2`.`type` = 'learn' AND `e2`.`level` = 'intermediate' AND `e2`.`func` = 0
);

-- Seventh row
INSERT INTO `Examples` (`name`, `type`, `level`, `func`)
SELECT 'objectdetection', 'learn', 'intermediate', 2
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `Examples` AS `e2`
    WHERE `e2`.`name` = 'objectdetection' AND `e2`.`type` = 'learn' AND `e2`.`level` = 'intermediate' AND `e2`.`func` = 2
);

-- Re-enable keys
ALTER TABLE `Examples` ENABLE KEYS;

-- Unlock the tables
UNLOCK TABLES;


-- Models

-- Lock the table for writing and alias for reading
LOCK TABLES `Models` WRITE, `Models` AS `e2` READ;

-- Disable keys for faster insertion (if applicable)
ALTER TABLE `Models` DISABLE KEYS;

-- Insert RESNET18 if it doesn't exist
INSERT INTO `Models` (`id`, `Name`, `Type`, `shape`, `Description`)
SELECT 1, 'RESNET18', 'classification', '[1, 3, 224, 224]', 'ResNet18은 잔차 연결을 사용해 깊은 신경망의 기울기 소실 문제를 해결한 18층 딥러닝 모델입니다.'
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `Models` AS `e2`
    WHERE `e2`.`id` = 1 
);

-- Insert YOLO8N if it doesn't exist
INSERT INTO `Models` (`id`, `Name`, `Type`, `shape`, `Description`)
SELECT 4, 'YOLO8N', 'objectdetection', '[1,3,640,640]', 'YOLOv8n은 Object Detection 경량화된 딥러닝 모델로, YOLO 모델의 최신 버전 중 하나입니다.'
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `Models` AS `e2`
    WHERE `e2`.`id` = 4
);

-- Insert YOLO9N if it doesn't exist
INSERT INTO `Models` (`id`, `Name`, `Type`, `shape`, `Description`)
SELECT 5, 'YOLO9N', 'objectdetection', '[1,3,640,640]', 'YOLO9N은 Object Detection 경량화된 딥러닝 모델로, YOLO 모델의 최신 버전 중 하나입니다.'
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `Models` AS `e2`
    WHERE `e2`.`id` = 5
);

-- Re-enable keys
ALTER TABLE `Models` ENABLE KEYS;

-- Unlock the tables
UNLOCK TABLES;