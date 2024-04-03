#! /usr/bin/zsh
echo
echo "***********************************************************"
echo "*                                                         *"
echo "*                  CONFIGURE NEW MACHINE                  *"
echo "*                                                         *"
echo "***********************************************************"
echo
# Variables
root_my_config="/home/$USER/my_config"
echo
echo "====================> Install asdf"
echo
echo 'Press any key to continue...'; read -k1 -s
echo
cd ~
git clone https://github.com/asdf-vm/asdf.git ~/.asdf &&
echo
echo "====================> Configure ZSH"
echo
echo "--------------------> Installing fonts"
echo
echo 'Press any key to continue...'; read -k1 -s
echo
cp $root_my_config/fonts/* ~/.local/share/fonts/ &&
echo
echo "--------------------> Configure files for zsh"
echo
echo 'Press any key to continue...'; read -k1 -s
echo
cd ~ &&
rm -f ~/.zshrc;
rm -f ~/.sh_aliases;
ln $root_my_config/configs/.zshrc_starship ~/.zshrc;
ln $root_my_config/configs/.sh_aliases ~/.sh_aliases;
ln $root_my_config/configs/starship.toml ~/.config/starship.toml
echo
echo "====================> Configure Terminal Visual"
echo
echo 'Press any key to continue...'; read -k1 -s
echo
rm ~/.config/gtk-4.0/gtk.css &&
ln $root_my_config/configs/gtk-X.0-gtk.css ~/.config/gtk-4.0/gtk.css &&
rm ~/.config/gtk-3.0/gtk.css &&
ln $root_my_config/configs/gtk-3.0-gtk.css ~/.config/gtk-4.0/gtk.css
echo
echo "====================> Downloading .gitconfig file"
echo
echo 'Press any key to continue...'; read -k1 -s
echo
cd ~
git clone git@gist.github.com:4fafb520ad03493ceac0a998e7c27f02.git git_config &&
rm -rf ~/.gitconfig &&
ln git_config/.gitconfig ~/ &&
echo
echo "====================> Download zsh Plugins"
echo
echo "--------------------> fast-syntax-highlighting"
echo
echo 'Press any key to continue...'; read -k1 -s
echo
mkdir -p ~/.config/zsh/plugins &&
git clone git@github.com:zdharma/fast-syntax-highlighting.git ~/.config/zsh/plugins/fast-syntax-highlighting &&
ln $root_my_config/configs/clean_my.ini ~/.config/zsh/plugins/fast-syntax-highlighting/themes &&
source ~/.zshrc
fast-theme clean_my
echo
echo "--------------------> zsh-autosuggestions"
echo
echo 'Press any key to continue...'; read -k1 -s
echo
git clone git@github.com:zsh-users/zsh-autosuggestions.git ~/.config/zsh/plugins/zsh-autosuggestions &&
source ~/.zshrc
echo
echo "====================> Install Starship terminal"
echo
echo 'Press any key to continue...'; read -k1 -s
echo
sudo zypper install starship -y
echo
echo "====================> Install Starship terminal"
echo
echo 'Press any key to continue...'; read -k1 -s
echo
echo "====================> Install Patterns"
echo
echo "--------------------> devel_basis"
echo
echo 'Press any key to continue...'; read -k1 -s
echo
sudo zypper install -t pattern devel_basis
echo
echo "--------------------> devel_python3"
echo
echo 'Press any key to continue...'; read -k1 -s
echo
sudo zypper install -t pattern devel_python3
echo
echo
echo
read -rsp $"Configuration process finished. Press any key to proceed..."
echo
exit
