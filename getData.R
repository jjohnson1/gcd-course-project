# Download data to working directory
if (!file.exists("wearable.zip")) {
fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "wearable.zip", method="curl")
}

# Extract data from Zip file
unzip("wearable.zip")