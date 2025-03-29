setup-spicetify:
    #!/usr/bin/env bash
    if [[ $(id -u) -eq 0 ]]; then
        echo "Please do not run this command as root"
        exit 1
    fi
    echo "Installing Spotify"
    flatpak install flathub com.spotify.Client -y
    echo "Installing Spicetify"
    brew install spicetify-cli
    echo "Changing Spotify files permissions"
    sudo chmod a+wr /var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify
    sudo chmod a+wr -R /var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify/Apps
    echo "Opening Spotify at least once. Close it manually"
    sleep 3s
    flatpak run com.spotify.Client
    echo "Setting up required prefs and installing Spicetify Marketplace"
    spicetify config prefs_path ~/.var/app/com.spotify.Client/config/spotify/prefs
    spicetify config spotify_path /var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify
    popd ~/.config/spicetify/CustomApps/ > /dev/null
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
    spicetify apply
