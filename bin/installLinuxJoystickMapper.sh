#!/bin/bash
JOYMAPPER_FILENAME="joymap-0.2"

cowsay -f dragon Installing Linux Joystick Mapper...
echo Installing Linux Joystick Mapper
#sayWithGoogle Now installing Linux Joystick Mapper you have no chance to survive make your time
pushd ~

echo Clearing out old versions...
rm "$JOYMAPPER_FILENAME.tar.gz"
sudo rm -rf "$JOYMAPPER_FILENAME"

echo "Downloading $JOYMAPPER_FILENAME..."
wget "http://downloads.sourceforge.net/project/linuxjoymap/$JOYMAPPER_FILENAME.tar.gz"

echo Extracting...
tar xfvz "$JOYMAPPER_FILENAME.tar.gz"
cd "$JOYMAPPER_FILENAME"

echo Cleaning...
make clean

echo Generating keycodes for this system...
./makekeys.sh

echo Compiling...
make

echo Installing...
sudo cp reserve_js /usr/local/bin/
sudo cp loadmap /usr/local/bin/

echo Installation complete!

popd
