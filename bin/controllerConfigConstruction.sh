#!/bin/bash
echo Constructing the controller configs to match the splashscreen quick reference image...

pushd ~
mkdir temp
cd temp
for file in ~/primestationone/reference/opt/retropie/emulators/retroarch/configs/*.header.cfg; do
    filename=$(basename "$file")
    extension="${filename##*.}"
    filename="${filename%.*}"
    cat "$file" > "$filename.cfg"
    cat ~/primestationone/reference/opt/retropie/emulators/retroarch/configs/PS3Controller.master.cfg >> "$filename.cfg"
    echo "Constructed new controller config file: $filename.cfg with contents: "
    cat "$filename.cfg"
done
popd
echo Installing constructed controller configs to RetroArch autoconfig folder...
sudo cp -vr ~/temp/*.cfg /opt/retropie/emulators/retroarch/configs/
