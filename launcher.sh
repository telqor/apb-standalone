
#!/bin/bash
echo -e "Starting APB Reloaded standalone installer..."

# Variables

UMU_URL="https://github.com/telqor/apb-standalone/raw/main/umu-launcher.tar.gz"

UMU_FILE="umu-launcher.tar.gz"

UMU_PATH="$HOME/.local"

UMU_CMD="umu-run"

GAME_PATH="$HOME/Games/APB Reloaded"

# Game links. TODO, parse the XML to always get latest

APB_URL="http://apb.patch.gamersfirst.com/Launcher1.30.0.839857/Launcher"

# Anti stutter config "for good measure"

export DXVK_CONFIG="d3d9.cachedDynamicBuffers = True"

# Check for and install umu
if ! command -v umu-run &> /dev/null
then
    UMU_CMD=$UMU_PATH/bin/umu-run
    if [ ! -f $UMU_CMD ];
    then
        echo "umu-launcher not found in your system!"
        # Install UMU
        read -p "Would you like to install umu-launcher for the current user? (y/n) " inst
        case $inst in
        y ) echo "Proceeding with install..." ;;
        n ) echo "Cannot proceed without umu-launcher, exiting...";
            exit 1;;
        * ) echo "Invalid response, exiting...";
            exit 1;;
        esac

        mkdir -p $UMU_PATH
        cd $UMU_PATH
        wget $UMU_URL
        tar xfvz $UMU_FILE
        rm $UMU_FILE
    fi
fi

echo "Found umu install!"

mkdir -p "$GAME_PATH/Launcher"
cd "$GAME_PATH/Launcher"

# Download the launcher if needed
if [ ! -f ./APBLauncher.exe ]; then
  echo "Downloading launcher..."
  wget "$APB_URL/APBLauncher.exe" -O APBLauncher.exe.zip
  wget "$APB_URL/environment.config" -O environment.config.zip
  unzip APBLauncher.exe.zip
  unzip environment.config.zip
  rm APBLauncher.exe.zip
  rm environment.config.zip
fi

# Run the launcher which will install the game if not installed
GAMEID=113400 PROTONPATH=GE-Proton "$UMU_CMD" APBLauncher.exe
