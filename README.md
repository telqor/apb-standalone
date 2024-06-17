# APB Standalone Launcher & Installer
Standalone (non-Steam) launcher for APB Reloaded. Very WIP.

This script downloads Little Orbit's official launcher to install, update or run the game, without the use of Steam. 
This is accomplished using umu to provide Proton and the Steam Runtime without the need for a Steam Client.

## How to use

This script requires **curl** (if using the below commands) and **unzip** (for extracting downloaded launcher files).

Clone the repository and run launcher.sh or use this command:

    bash <(curl -Ls https://raw.githubusercontent.com/telqor/apb-standalone/main/launcher.sh)

Alternatively, use this to install OTW:

    bash <(curl -Ls https://raw.githubusercontent.com/telqor/apb-standalone/main/otw-launcher.sh)

## Acknowledgments
Thanks to the developers of umu-launcher for making this method possible.

https://github.com/Open-Wine-Components/umu-launcher

Thanks to Liarus for help regarding obtaining the original installer from LO + testing help.

