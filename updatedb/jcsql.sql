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

-- #################### Dependencies TABLE ####################

-- Create the table 'Dependencies' if it does not exist
CREATE TABLE IF NOT EXISTS `Dependencies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Check if column 'id' exists
SELECT COUNT(*) INTO @id_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'Dependencies'
  AND COLUMN_NAME = 'id';

-- If 'id' column does not exist, add it
SET @sql_id = IF(@id_exists = 0,
    'ALTER TABLE `Dependencies` ADD COLUMN `id` int NOT NULL AUTO_INCREMENT;',
    'SELECT "Column id already exists";');

PREPARE stmt FROM @sql_id;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check if column 'Name' exists
SELECT COUNT(*) INTO @name_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'Dependencies'
  AND COLUMN_NAME = 'Name';

-- If 'Name' column does not exist, add it
SET @sql_name = IF(@name_exists = 0,
    'ALTER TABLE `Dependencies` ADD COLUMN `Name` varchar(100) DEFAULT NULL;',
    'SELECT "Column Name already exists";');

PREPARE stmt FROM @sql_name;
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

-- #################### MissionDependencies TABLE ####################

-- Create the table 'MissionDependencies' if it does not exist
CREATE TABLE IF NOT EXISTS `MissionDependencies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `missionsid` int DEFAULT NULL,
  `dependenciesid` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Check if column 'id' exists
SELECT COUNT(*) INTO @id_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'MissionDependencies'
  AND COLUMN_NAME = 'id';

-- If 'id' column does not exist, add it
SET @sql_id = IF(@id_exists = 0,
    'ALTER TABLE `MissionDependencies` ADD COLUMN `id` int NOT NULL AUTO_INCREMENT;',
    'SELECT "Column id already exists";');

PREPARE stmt FROM @sql_id;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check if column 'missionsid' exists
SELECT COUNT(*) INTO @missionsid_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'MissionDependencies'
  AND COLUMN_NAME = 'missionsid';

-- If 'missionsid' column does not exist, add it
SET @sql_missionsid = IF(@missionsid_exists = 0,
    'ALTER TABLE `MissionDependencies` ADD COLUMN `missionsid` int DEFAULT NULL;',
    'SELECT "Column missionsid already exists";');

PREPARE stmt FROM @sql_missionsid;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check if column 'missionsid' exists
SELECT COUNT(*) INTO @dependenciesid_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'MissionDependencies'
  AND COLUMN_NAME = 'dependenciesid';

-- If 'dependenciesid' column does not exist, add it
SET @sql_dependenciesid = IF(@dependenciesid_exists = 0,
    'ALTER TABLE `MissionDependencies` ADD COLUMN `dependenciesid` int DEFAULT NULL;',
    'SELECT "Column dependenciesid already exists";');

PREPARE stmt FROM @sql_dependenciesid;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- #################### Missions TABLE ####################

-- Create the table 'Missions' if it does not exist
CREATE TABLE IF NOT EXISTS `Missions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Check if column 'id' exists
SELECT COUNT(*) INTO @id_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'Missions'
  AND COLUMN_NAME = 'id';

-- If 'id' column does not exist, add it
SET @sql_id = IF(@id_exists = 0,
    'ALTER TABLE `Missions` ADD COLUMN `id` int NOT NULL AUTO_INCREMENT;',
    'SELECT "Column id already exists";');

PREPARE stmt FROM @sql_id;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check if column 'name' exists
SELECT COUNT(*) INTO @name_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'Missions'
  AND COLUMN_NAME = 'name';

-- If 'Name' column does not exist, add it
SET @sql_name = IF(@name_exists = 0,
    'ALTER TABLE `Missions` ADD COLUMN `name` varchar(100) DEFAULT NULL;',
    'SELECT "Column name already exists";');

PREPARE stmt FROM @sql_name;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Check if column 'Description' exists
SELECT COUNT(*) INTO @Description_exists
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE()
  AND TABLE_NAME = 'Missions'
  AND COLUMN_NAME = 'Description';

-- If 'Description' column does not exist, add it
SET @sql_Description = IF(@Description_exists = 0,
    'ALTER TABLE `Missions` ADD COLUMN `Description` varchar(100) DEFAULT NULL;',
    'SELECT "Column Description already exists";');

PREPARE stmt FROM @sql_Description;
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

-- Eighth row
INSERT INTO `Examples` (`name`, `type`, `level`, `func`)
SELECT 'pytorch', 'learn', 'hard', 0
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `Examples` AS `e2`
    WHERE `e2`.`name` = 'pytorch' AND `e2`.`type` = 'learn' AND `e2`.`level` = 'hard' AND `e2`.`func` = 0
);

-- Ninth row
INSERT INTO `Examples` (`name`, `type`, `level`, `func`)
SELECT 'depth', 'learn', 'hard', 2
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `Examples` AS `e2`
    WHERE `e2`.`name` = 'depth' AND `e2`.`type` = 'learn' AND `e2`.`level` = 'hard' AND `e2`.`func` = 2
);

-- Tenth row
INSERT INTO `Examples` (`name`, `type`, `level`, `func`)
SELECT 'numpy', 'learn', 'intermediate', 2
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `Examples` AS `e2`
    WHERE `e2`.`name` = 'numpy' AND `e2`.`type` = 'learn' AND `e2`.`level` = 'intermediate' AND `e2`.`func` = 2
);

-- Eleventh row
INSERT INTO `Examples` (`name`, `type`, `level`, `func`)
SELECT 'Line-Classification-Basic', 'mission', 'easy', 2
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `Examples` AS `e2`
    WHERE `e2`.`name` = 'Line-Classification-Basic' AND `e2`.`type` = 'mission' AND `e2`.`level` = 'easy' AND `e2`.`func` = 2
);

-- Twelfth row
INSERT INTO `Examples` (`name`, `type`, `level`, `func`)
SELECT 'Vision-ObjectDetection-Basic', 'mission', 'easy', 2
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `Examples` AS `e2`
    WHERE `e2`.`name` = 'Vision-ObjectDetection-Basic' AND `e2`.`type` = 'mission' AND `e2`.`level` = 'easy' AND `e2`.`func` = 2
);

-- Thirteenth row
INSERT INTO `Examples` (`name`, `type`, `level`, `func`)
SELECT 'LiDAR-ObjectDetection-Basic', 'mission', 'easy', 0
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `Examples` AS `e2`
    WHERE `e2`.`name` = 'LiDAR-ObjectDetection-Basic' AND `e2`.`type` = 'mission' AND `e2`.`level` = 'easy' AND `e2`.`func` = 0
);

-- Fourteenth row
INSERT INTO `Examples` (`name`, `type`, `level`, `func`)
SELECT 'Depth-ObjectDetection-Basic', 'mission', 'easy', 0
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `Examples` AS `e2`
    WHERE `e2`.`name` = 'Depth-ObjectDetection-Basic' AND `e2`.`type` = 'mission' AND `e2`.`level` = 'easy' AND `e2`.`func` = 0
);

-- Fifteenth row
INSERT INTO `Examples` (`name`, `type`, `level`, `func`)
SELECT 'Line-Detection-Basic', 'mission', 'easy', 0
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `Examples` AS `e2`
    WHERE `e2`.`name` = 'Line-Detection-Basic' AND `e2`.`type` = 'mission' AND `e2`.`level` = 'easy' AND `e2`.`func` = 0
);

-- Sixteenth row
INSERT INTO `Examples` (`name`, `type`, `level`, `func`)
SELECT 'Line-Detection-Advanced', 'mission', 'intermediate', 0
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `Examples` AS `e2`
    WHERE `e2`.`name` = 'Line-Detection-Advanced' AND `e2`.`type` = 'mission' AND `e2`.`level` = 'intermediate' AND `e2`.`func` = 0
);

-- Seventeenth row
INSERT INTO `Examples` (`name`, `type`, `level`, `func`)
SELECT 'Line-Classification-Advanced', 'mission', 'intermediate', 2
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `Examples` AS `e2`
    WHERE `e2`.`name` = 'Line-Classification-Advanced' AND `e2`.`type` = 'mission' AND `e2`.`level` = 'intermediate' AND `e2`.`func` = 2
);

-- Eighteenth row
INSERT INTO `Examples` (`name`, `type`, `level`, `func`)
SELECT 'Vision-ObjectDetection-Advanced', 'mission', 'intermediate', 2
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `Examples` AS `e2`
    WHERE `e2`.`name` = 'Vision-ObjectDetection-Advanced' AND `e2`.`type` = 'mission' AND `e2`.`level` = 'intermediate' AND `e2`.`func` = 2
);

-- Nineteenth row
INSERT INTO `Examples` (`name`, `type`, `level`, `func`)
SELECT 'LiDAR-ObjectDetection-Advanced', 'mission', 'intermediate', 0
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `Examples` AS `e2`
    WHERE `e2`.`name` = 'LiDAR-ObjectDetection-Advanced' AND `e2`.`type` = 'mission' AND `e2`.`level` = 'intermediate' AND `e2`.`func` = 0
);

-- Twentieth row
INSERT INTO `Examples` (`name`, `type`, `level`, `func`)
SELECT 'Depth-ObjectDetection-Advanced', 'mission', 'intermediate', 0
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `Examples` AS `e2`
    WHERE `e2`.`name` = 'Depth-ObjectDetection-Advanced' AND `e2`.`type` = 'mission' AND `e2`.`level` = 'intermediate' AND `e2`.`func` = 0
);

-- Twenty-first row
INSERT INTO `Examples` (`name`, `type`, `level`, `func`)
SELECT 'TrafficLight-ObjectDetection-Basic', 'mission', 'easy', 2
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `Examples` AS `e2`
    WHERE `e2`.`name` = 'TrafficLight-ObjectDetection-Basic' AND `e2`.`type` = 'mission' AND `e2`.`level` = 'easy' AND `e2`.`func` = 2
);

-- Twenty-second row
INSERT INTO `Examples` (`name`, `type`, `level`, `func`)
SELECT 'TrafficLight-ObjectDetection-Advanced', 'mission', 'intermediate', 2
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `Examples` AS `e2`
    WHERE `e2`.`name` = 'TrafficLight-ObjectDetection-Advanced' AND `e2`.`type` = 'mission' AND `e2`.`level` = 'intermediate' AND `e2`.`func` = 2
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

INSERT INTO `Models` (`id`, `Name`, `Type`, `shape`, `Description`)
SELECT 2, 'RESNET34', 'classification', '[1, 3, 224, 224]', 'ResNet34은 잔차 연결을 사용해 깊은 신경망의 기울기 소실 문제를 해결한 34층 딥러닝 모델입니다.'
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `Models` AS `e2`
    WHERE `e2`.`id` = 2
);

INSERT INTO `Models` (`id`, `Name`, `Type`, `shape`, `Description`)
SELECT 3, 'RESNET50', 'classification', '[1, 3, 224, 224]', 'ResNet50은 잔차 연결을 사용해 깊은 신경망의 기울기 소실 문제를 해결한 50층 딥러닝 모델입니다.'
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `Models` AS `e2`
    WHERE `e2`.`id` = 3
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

-- Insert YOLO9N if it doesn't exist
INSERT INTO `Models` (`id`, `Name`, `Type`, `shape`, `Description`)
SELECT 6, 'YOLO11N', 'objectdetection', '[1,3,640,640]', 'YOLO11N은 Object Detection 경량화된 딥러닝 모델로, YOLO 모델의 최신 버전 중 하나입니다.'
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `Models` AS `e2`
    WHERE `e2`.`id` = 6
);


-- Re-enable keys
ALTER TABLE `Models` ENABLE KEYS;

-- Unlock the tables
UNLOCK TABLES;

-- Missions

-- Lock the table for writing and alias for reading
LOCK TABLES `Missions` WRITE, `Missions` AS `e2` READ;

-- Disable keys for faster insertion (if applicable)
ALTER TABLE `Missions` DISABLE KEYS;

-- Insert Line-Classification-Basic if it doesn't exist
INSERT INTO `Missions` (`id`, `name`, `Description`)
SELECT 1, 'Line-Detection', 'Opencv-python 알고리즘을 이용하여 그리드를 그리고 특징점을 추출합니다'
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `Missions` AS `e2`
    WHERE `e2`.`id` = 1
);

-- Insert Line-Classification if it doesn't exist
INSERT INTO `Missions` (`id`, `name`, `Description`)
SELECT 2, 'Line-Classification', '인공지능 기반 Classification 알고리즘을 이용하여 차선을 종류별로 분류합니다'
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `Missions` AS `e2`
    WHERE `e2`.`id` = 2
);

-- Insert Vision-ObjectDetection if it doesn't exist
INSERT INTO `Missions` (`id`, `name`, `Description`)
SELECT 3, 'Vision-ObjectDetection', '인공지능 기반 ObjectDetection 알고리즘을 이용하여 물체를 장애물로 감지합니다'
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `Missions` AS `e2`
    WHERE `e2`.`id` = 3
);

-- Insert LiDAR-ObjectDetection if it doesn't exist
INSERT INTO `Missions` (`id`, `name`, `Description`)
SELECT 4, 'LiDAR-ObjectDetection', 'LiDAR 센서를 이용하여 주변 장애물을 감지합니다'
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `Missions` AS `e2`
    WHERE `e2`.`id` = 4
);

-- Insert Depth-ObjectDetection if it doesn't exist
INSERT INTO `Missions` (`id`, `name`, `Description`)
SELECT 5, 'Depth-ObjectDetection', '3차원 Depth 카메라를 이용하여 장애물을 감지합니다'
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `Missions` AS `e2`
    WHERE `e2`.`id` = 5
);

-- Insert TrafficLight-ObjectDetection if it doesn't exist
INSERT INTO `Missions` (`id`, `name`, `Description`)
SELECT 6, 'TrafficLight-ObjectDetection', '신호등을 인식하여 신호등의 색을 분류합니다'
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `Missions` AS `e2`
    WHERE `e2`.`id` = 6
);

-- Re-enable keys
ALTER TABLE `Missions` ENABLE KEYS;

-- Unlock the tables
UNLOCK TABLES;

-- Dependencies

-- Lock the table for writing and alias for reading
LOCK TABLES `Dependencies` WRITE, `Dependencies` AS `e2` READ;

-- Disable keys for faster insertion (if applicable)
ALTER TABLE `Dependencies` DISABLE KEYS;

-- Insert Python if it doesn't exist
INSERT INTO `Dependencies` (`id`, `Name`)
SELECT 1, 'Python'
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `Dependencies` AS `e2`
    WHERE `e2`.`id` = 1
);

-- Insert Numpy if it doesn't exist
INSERT INTO `Dependencies` (`id`, `Name`)
SELECT 2, 'Numpy'
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `Dependencies` AS `e2`
    WHERE `e2`.`id` = 2
);

-- Insert Opencv if it doesn't exist
INSERT INTO `Dependencies` (`id`, `Name`)
SELECT 3, 'Opencv'
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `Dependencies` AS `e2`
    WHERE `e2`.`id` = 3
);

-- Insert Pytorch if it doesn't exist
INSERT INTO `Dependencies` (`id`, `Name`)
SELECT 4, 'Pytorch'
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `Dependencies` AS `e2`
    WHERE `e2`.`id` = 4
);

-- Insert Classification if it doesn't exist
INSERT INTO `Dependencies` (`id`, `Name`)
SELECT 5, 'Classification'
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `Dependencies` AS `e2`
    WHERE `e2`.`id` = 5
);

-- Insert ObjectDetection if it doesn't exist
INSERT INTO `Dependencies` (`id`, `Name`)
SELECT 6, 'ObjectDetection'
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `Dependencies` AS `e2`
    WHERE `e2`.`id` = 6
);

-- insert RGBCam with id = 10 if it doesn't exist
INSERT INTO `Dependencies` (`id`, `Name`)
SELECT 10, 'RGBCam'
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `Dependencies` AS `e2`
    WHERE `e2`.`id` = 10 AND `e2`.`Name` = 'RGBCam'
);

-- insert DepthCam with id = 11 if it doesn't exist
INSERT INTO `Dependencies` (`id`, `Name`)
SELECT 11, 'DepthCam'
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `Dependencies` AS `e2`
    WHERE `e2`.`id` = 11 AND `e2`.`Name` = 'DepthCam'
);

-- insert LiDAR with id = 12 if it doesn't exist
INSERT INTO `Dependencies` (`id`, `Name`)
SELECT 12, 'LiDAR'
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `Dependencies` AS `e2`
    WHERE `e2`.`id` = 12 AND `e2`.`Name` = 'LiDAR'
);


-- Re-enable keys
ALTER TABLE `Dependencies` ENABLE KEYS;

-- Unlock the tables
UNLOCK TABLES;

-- MissionDependencies

-- Lock the table for writing and alias for reading
LOCK TABLES `MissionDependencies` WRITE, `MissionDependencies` AS `e2` READ;

-- Disable keys for faster insertion (if applicable)
ALTER TABLE `MissionDependencies` DISABLE KEYS;

-- Insert 1,1,1 if it doesn't exist
INSERT INTO `MissionDependencies` (`id`, `missionsid`, `dependenciesid`)
SELECT 1, 1, 1
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `MissionDependencies` AS `e2`
    WHERE `e2`.`id` = 1 AND `e2`.`missionsid` = 1 AND `e2`.`dependenciesid` = 1
);

-- Insert 2,1,3 if it doesn't exist
INSERT INTO `MissionDependencies` (`id`, `missionsid`, `dependenciesid`)
SELECT 2, 1, 3
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `MissionDependencies` AS `e2`
    WHERE `e2`.`id` = 2 AND `e2`.`missionsid` = 1 AND `e2`.`dependenciesid` = 3
);

-- Insert 3,1,10 if it doesn't exist
INSERT INTO `MissionDependencies` (`id`, `missionsid`, `dependenciesid`)
SELECT 3, 1, 10
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `MissionDependencies` AS `e2`
    WHERE `e2`.`id` = 3 AND `e2`.`missionsid` = 1 AND `e2`.`dependenciesid` = 10
);

-- Insert 4,2,1 if it doesn't exist
INSERT INTO `MissionDependencies` (`id`, `missionsid`, `dependenciesid`)
SELECT 4, 2, 1
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `MissionDependencies` AS `e2`
    WHERE `e2`.`id` = 4 AND `e2`.`missionsid` = 2 AND `e2`.`dependenciesid` = 1
);

-- Insert 5,2,4 if it doesn't exist
INSERT INTO `MissionDependencies` (`id`, `missionsid`, `dependenciesid`)
SELECT 5, 2, 4
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `MissionDependencies` AS `e2`
    WHERE `e2`.`id` = 5 AND `e2`.`missionsid` = 2 AND `e2`.`dependenciesid` = 4
);

-- Insert 6,2,5 if it doesn't exist
INSERT INTO `MissionDependencies` (`id`, `missionsid`, `dependenciesid`)
SELECT 6, 2, 5
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `MissionDependencies` AS `e2`
    WHERE `e2`.`id` = 6 AND `e2`.`missionsid` = 2 AND `e2`.`dependenciesid` = 5
);

-- Insert 7,2,10 if it doesn't exist
INSERT INTO `MissionDependencies` (`id`, `missionsid`, `dependenciesid`)
SELECT 7, 2, 10
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `MissionDependencies` AS `e2`
    WHERE `e2`.`id` = 7 AND `e2`.`missionsid` = 2 AND `e2`.`dependenciesid` = 10
);

-- Insert 8,3,1 if it doesn't exist
INSERT INTO `MissionDependencies` (`id`, `missionsid`, `dependenciesid`)
SELECT 8, 3, 1
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `MissionDependencies` AS `e2`
    WHERE `e2`.`id` = 8 AND `e2`.`missionsid` = 3 AND `e2`.`dependenciesid` = 1
);

-- Insert 9,3,4 if it doesn't exist
INSERT INTO `MissionDependencies` (`id`, `missionsid`, `dependenciesid`)
SELECT 9, 3, 4
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `MissionDependencies` AS `e2`
    WHERE `e2`.`id` = 9 AND `e2`.`missionsid` = 3 AND `e2`.`dependenciesid` = 4
);

-- Insert 10,3,6 if it doesn't exist
INSERT INTO `MissionDependencies` (`id`, `missionsid`, `dependenciesid`)
SELECT 10, 3, 6
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `MissionDependencies` AS `e2`
    WHERE `e2`.`id` = 10 AND `e2`.`missionsid` = 3 AND `e2`.`dependenciesid` = 6
);

-- Insert 11,3,10 if it doesn't exist
INSERT INTO `MissionDependencies` (`id`, `missionsid`, `dependenciesid`)
SELECT 11, 3, 10
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `MissionDependencies` AS `e2`
    WHERE `e2`.`id` = 11 AND `e2`.`missionsid` = 3 AND `e2`.`dependenciesid` = 10
);

-- Insert 12,4,1 if it doesn't exist
INSERT INTO `MissionDependencies` (`id`, `missionsid`, `dependenciesid`)
SELECT 12, 4, 1
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `MissionDependencies` AS `e2`
    WHERE `e2`.`id` = 12 AND `e2`.`missionsid` = 4 AND `e2`.`dependenciesid` = 1
);

-- Insert 13,4,2 if it doesn't exist
INSERT INTO `MissionDependencies` (`id`, `missionsid`, `dependenciesid`)
SELECT 13, 4, 2
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `MissionDependencies` AS `e2`
    WHERE `e2`.`id` = 13 AND `e2`.`missionsid` = 4 AND `e2`.`dependenciesid` = 2
);

-- Insert 14,4,12 if it doesn't exist
INSERT INTO `MissionDependencies` (`id`, `missionsid`, `dependenciesid`)
SELECT 14, 4, 12
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `MissionDependencies` AS `e2`
    WHERE `e2`.`id` = 14 AND `e2`.`missionsid` = 4 AND `e2`.`dependenciesid` = 12
);

-- Insert 15,5,1 if it doesn't exist
INSERT INTO `MissionDependencies` (`id`, `missionsid`, `dependenciesid`)
SELECT 15, 5, 1
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `MissionDependencies` AS `e2`
    WHERE `e2`.`id` = 15 AND `e2`.`missionsid` = 5 AND `e2`.`dependenciesid` = 1
);

-- Insert 16,5,2 if it doesn't exist
INSERT INTO `MissionDependencies` (`id`, `missionsid`, `dependenciesid`)
SELECT 16, 5, 2
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `MissionDependencies` AS `e2`
    WHERE `e2`.`id` = 16 AND `e2`.`missionsid` = 5 AND `e2`.`dependenciesid` = 2
);

-- Insert 17,5,11 if it doesn't exist
INSERT INTO `MissionDependencies` (`id`, `missionsid`, `dependenciesid`)
SELECT 17, 5, 11
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `MissionDependencies` AS `e2`
    WHERE `e2`.`id` = 17 AND `e2`.`missionsid` = 5 AND `e2`.`dependenciesid` = 11
);

-- Insert 18,6,1 if it doesn't exist
INSERT INTO `MissionDependencies` (`id`, `missionsid`, `dependenciesid`)
SELECT 18, 6, 1
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `MissionDependencies` AS `e2`
    WHERE `e2`.`id` = 18 AND `e2`.`missionsid` = 6 AND `e2`.`dependenciesid` = 1
);

-- Insert 19,6,2 if it doesn't exist
INSERT INTO `MissionDependencies` (`id`, `missionsid`, `dependenciesid`)
SELECT 19, 6, 2
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `MissionDependencies` AS `e2`
    WHERE `e2`.`id` = 19 AND `e2`.`missionsid` = 6 AND `e2`.`dependenciesid` = 2
);

-- Insert 20,6,6 if it doesn't exist
INSERT INTO `MissionDependencies` (`id`, `missionsid`, `dependenciesid`)
SELECT 20, 6, 6
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `MissionDependencies` AS `e2`
    WHERE `e2`.`id` = 20 AND `e2`.`missionsid` = 6 AND `e2`.`dependenciesid` = 6
);

-- Insert 21,6,10 if it doesn't exist
INSERT INTO `MissionDependencies` (`id`, `missionsid`, `dependenciesid`)
SELECT 21, 6, 10
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `MissionDependencies` AS `e2`
    WHERE `e2`.`id` = 21 AND `e2`.`missionsid` = 6 AND `e2`.`dependenciesid` = 10
);

-- Insert 22,6,4 if it doesn't exist
INSERT INTO `MissionDependencies` (`id`, `missionsid`, `dependenciesid`)
SELECT 22, 6, 4
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `MissionDependencies` AS `e2`
    WHERE `e2`.`id` = 22 AND `e2`.`missionsid` = 6 AND `e2`.`dependenciesid` = 4
);

-- Insert 23,7,1 if it doesn't exist
INSERT INTO `MissionDependencies` (`id`, `missionsid`, `dependenciesid`)
SELECT 23, 7, 1
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `MissionDependencies` AS `e2`
    WHERE `e2`.`id` = 23 AND `e2`.`missionsid` = 7 AND `e2`.`dependenciesid` = 1
);

-- Insert 24,7,2 if it doesn't exist
INSERT INTO `MissionDependencies` (`id`, `missionsid`, `dependenciesid`)
SELECT 24, 7, 2
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `MissionDependencies` AS `e2`
    WHERE `e2`.`id` = 24 AND `e2`.`missionsid` = 7 AND `e2`.`dependenciesid` = 2
);

-- Insert 25,7,12 if it doesn't exist
INSERT INTO `MissionDependencies` (`id`, `missionsid`, `dependenciesid`)
SELECT 25, 7, 12
FROM (SELECT 1) AS tmp
WHERE NOT EXISTS (
    SELECT 1 FROM `MissionDependencies` AS `e2`
    WHERE `e2`.`id` = 25 AND `e2`.`missionsid` = 7 AND `e2`.`dependenciesid` = 12
);


-- Re-enable keys
ALTER TABLE `MissionDependencies` ENABLE KEYS;

-- Unlock the tables
UNLOCK TABLES;




