setup-spotify:
    #!/usr/bin/env bash
    STFINST=0
    if [[ $(id -u) -eq 0 ]]; then
        echo "Please do not run this command as root"
        exit 1
    fi
    if grep -q 'com.spotify.Client' <<< $(flatpak list); then
        echo "Spotify is already installed"
    else
        echo "Installing Spotify"
        flatpak install flathub com.spotify.Client -y
    fi
    if grep -q 'spicetify-cli' <<< $(brew list); then
        echo "Spicetify is already installed"
        STFINST=1
    else
        echo "Installing Spicetify"
        brew install spicetify-cli
    fi
    echo "Changing Spotify files permissions"
    sudo chmod a+wr /var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify
    sudo chmod a+wr -R /var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify/Apps
    if [ ! "${STFINST}" -eq 1 ]; then
        echo "Opening Spotify at least once. Close it manually"
        flatpak run com.spotify.Client
        sleep 5s
        spicetify > /dev/null
        echo "Setting up required prefs and installing Spicetify Marketplace"
        sed -i -e '/prefs_path/ s/$/ \~\/.var\/app\/com.spotify.Client\/config\/spotify\/prefs/' -e "s|~|$HOME|g" ~/.config/spicetify/config-xpui.ini
        pushd ~/.config/spicetify/CustomApps/ > /dev/null
            wget https://github.com/spicetify/marketplace/releases/latest/download/marketplace.zip
            unzip marketplace.zip
            rm -rf marketplace.zip marketplace
            mv marketplace-dist marketplace
            cd ../Themes
            mkdir marketplace
            cd marketplace
            echo "[Marketplace]" > color.ini
        popd > /dev/null
        echo "Applying the changes"
        spicetify config inject_css 1
        spicetify config replace_colors 1
        spicetify config current_theme marketplace
        spicetify config custom_apps marketplace
    fi
    spicetify apply
    if [ ! $? -eq 0 ]; then
        spicetify backup apply
    fi
