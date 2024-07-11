#!/bin/bash

# function to check if the previous command was successful return boolean
# 0 means success, 1 means failure
checkIfPreviousCommandWasSuccessful() {
    if [ $? -eq 0 ]; then
        return 0
    else
        return 1
    fi
}


# check if git is installed or not and if not install it

if ! [ -x "$(command -v git)" ]; then
    echo "Git is not installed. Installing git..."
    sudo apt install git
    if checkIfPreviousCommandWasSuccessful; then
        echo "Git installed successfully!"
    else
        echo "Git installation failed!"
    fi
fi



echo "Installing scrcpy..."

# for Debian/Ubuntu
sudo apt install ffmpeg libsdl2-2.0-0 adb wget \
                 gcc git pkg-config meson ninja-build libsdl2-dev \
                 libavcodec-dev libavdevice-dev libavformat-dev libavutil-dev \
                 libswresample-dev libusb-1.0-0 libusb-1.0-0-dev



# check if scrpy folder exists and if it does delete it
# -d file   True if file exists and is a directory.
if [ -d "scrcpy" ]; then
    echo "scrcpy folder exists. Deleting it..."
    rm -rf scrcpy
fi

git clone https://github.com/Genymobile/scrcpy
cd scrcpy
./install_release.sh



# check if the previous command was successful
if checkIfPreviousCommandWasSuccessful; then
    echo "scrcpy installed successfully!"
    cd ..
    rm -rf scrcpy
else
    echo "scrcpy installation failed!"
fi

echo "Installing vlc"
# for Debian/Ubuntu
sudo apt install vlc
# check if the previous command was successful
# check if the previous command was successful
if checkIfPreviousCommandWasSuccessful; then
    echo "vlc installed successfully!"
else
    echo "vlc installation failed!"
fi


echo "Downloading sndcpy zip file with verbose output"
wget -v -O sndcpy.zip "https://github.com/rom1v/sndcpy/releases/download/v1.1/sndcpy-v1.1.zip"
# Making $HOME/bin directory
mkdir -p $HOME/bin/sndcpy

echo "Unzipping sndcpy zip file to $HOME/bin/sndcpy"
if ! [ -x "$(command -v 7z)" ]; then
    echo "7z is not installed. Installing 7z..."
    sudo apt install p7zip-full
    if checkIfPreviousCommandWasSuccessful; then
        echo "7z installed successfully!"
    else
        echo "7z installation failed!"
    fi
fi

7z x sndcpy.zip -o$HOME/bin/sndcpy

# remove sndcpy.zip file
rm sndcpy.zip

# check if $HOME/bin is in the PATH

if [[ ":$PATH:" == *":$HOME/bin/sndcpy:"* ]]; then
    echo "Path $HOME/bin/sndcpy is in PATH"
else
    echo "Path $HOME/bin/sndcpy is not in PATH"
    echo "Adding $HOME/bin/sndcpy to PATH"
    echo "export PATH=$HOME/bin/sndcpy:$PATH" >> $HOME/.bashrc
    echo "export PATH=$HOME/bin/sndcpy:$PATH" >> $HOME/.zshrc
    source $HOME/.bashrc
    if checkIfPreviousCommandWasSuccessful; then
        echo "Added $HOME/bin/sndcpy to PATH successfully!"
    else
        echo "Failed to add $HOME/bin/sndcpy to ./bashrc PATH"
    fi
    source $HOME/.zshrc
    if checkIfPreviousCommandWasSuccessful; then
        echo "Added $HOME/bin/sndcpy to PATH successfully!"
    else
        echo "Failed to add $HOME/bin/sndcpy to ./zshrc PATH"
    fi
fi


echo "sndcpy installed successfully!"

# copy the scrcpysndcpy script to $HOME/bin with all the permissions
cp scrcpysndcpy $HOME/bin
chmod +x $HOME/bin/scrcpysndcpy

echo -e "\e[1;32mInstallation completed successfully!\e[0m\n\n"

# please make the below command enclose with '' in color using the echo color command
echo "Please make sure to enable USB debugging on your android device"
echo "Connect your android device to your computer using a USB cable"
echo -e "Run the command \e[1;32m'scrcpysndcpy'\e[0m in the terminal"
echo -e "For \e[1;31mFULLSCREEN\e[0m use \e[1;32m'scrcpysndcpy f'\e[0m"
echo -e "To stop mirroring run \e[1;32m'scrcpysndcpy stop'\e[0m in the terminal"

