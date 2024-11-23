#!/bin/bash

# Configuration variables
DB_USER="root"         # Replace with your MySQL username
DB_PASS="1111"     # Replace with your MySQL password
DB_NAME="datasets"   # Replace with your database name
DB_HOST="localhost"            # Replace with your host, usually 'localhost'
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SQL_FILE="$SCRIPT_DIR/jcsql.sql"  # Assumes jcsql.sql is in the same directory as the script

# sudo chmod 777 ~/server/updatedb/jcsql.sql

# Function to check if the SQL file exists
if [ ! -f "$SQL_FILE" ]; then
    echo "Error: SQL file not found!"
    exit 1
fi

# Running the SQL update
echo "Running the update on the $DB_NAME database..."

mysql -u"$DB_USER" -p"$DB_PASS" -h"$DB_HOST" "$DB_NAME" < "$SQL_FILE"

if [ $? -eq 0 ]; then
    echo "Database update successful!"
else
    echo "Error: Database update failed!"
    exit 1
fi
