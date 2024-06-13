 
#!/bin/bash
echo -e "Starting APB Reloaded standalone installer..."


# Check for and install umu
if ! command -v umu-run &> /dev/null
then
    echo "No umu-launcher installation detected.  Checking requirements..."

    # Check for make and git
    if ! command -v git &> /dev/null
    then
        echo "git was not detected, please install git using your distribution's package management"
    fi

    if ! command -v make &> /dev/null
    then
        echo "make was not detected, please install make using your distribution's package management"
    fi

    # Install UMU
    read -p "Would you like to install umu-launcher for the current user? (y/n) " inst
    case $yn in
	y ) echo "Proceeding with install..."
		break;;
	n ) echo "Cannot proceed without umu-launcher, exiting...";
		exit 1;;
	* ) echo "Invalid response, exiting...";
        exit 1;;
    esac

    # TODO do the big bad umu install from sourcce (on user prefix)

    exit 1
fi

echo "Found umu install!"

# TODO check if the game is installed in $HOME/Games/APB Reloaded. If so exit (if this folder exists)

# TODO install the game by downloading the launcher and environment config file to "$HOME/Games/APB Reloaded/Launcher"

# TODO run the launcher

# TODO create a shortcut to the launcher and to the game  (for config users)
