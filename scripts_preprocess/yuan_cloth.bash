#!/bin/bash

# URL of the file to download
URL="http://data.csail.mit.edu/active_clothing/Data_ICRA18.tar"

# Number of attempts
MAX_ATTEMPTS=100000

# Counter for attempts
attempt=1

# Path to save the downloaded file
FILE_PATH="/home/vedant/RL-ViGen/scripts/file.zip"

# Log file
LOG_FILE="/home/vedant/RL-ViGen/scripts/download.log"

# Function to download file
download_file() {
    wget -c -O "$FILE_PATH" "$URL" >> "$LOG_FILE" 2>&1
}

# Loop until the file is successfully downloaded or maximum attempts are reached
while [ $attempt -le $MAX_ATTEMPTS ]; do
    echo "Attempt $attempt of $MAX_ATTEMPTS" | tee -a "$LOG_FILE"
    download_file

    # Check if the file was downloaded successfully
    if [ $? -eq 0 ]; then
        echo "Download successful." | tee -a "$LOG_FILE"
        break
    else
        echo "Download failed. Retrying..." | tee -a "$LOG_FILE"
        attempt=$((attempt + 1))
        sleep 1 # Add a 1-second delay before retrying
    fi
done

if [ $attempt -gt $MAX_ATTEMPTS ]; then
    echo "Failed to download file after $MAX_ATTEMPTS attempts." | tee -a "$LOG_FILE"
fi
