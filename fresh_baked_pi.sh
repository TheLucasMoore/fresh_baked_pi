# first, take over the root user so we don't need sudo
# see https://vicpimakers.ca/tutorials/raspbian/change-the-raspbian-root-password/
# Is that a great idea? No. Does it simplify things? You betchya.

echo "First things first. Fix up that keyboard"
wget https://raw.githubusercontent.com/TheLucasMoore/fresh_baked_pi/master/keyboard
# This is essentially a reconfiguration of the keyboard with
# $ dpkg-reconfigure keyboard-configuration
# the BTC 9116URF one is 87 keys and seems to work just fine. Then run
echo "Restarting your keyboard configuration."
service keyboard-setup restart

echo "Let's upgrade everything here and install some nice packages."
sudo apt-get update && sudo apt-get upgrade;
sudo apt-get install git zsh vim tmux;

echo "Great. Now let's get zsh installed."
wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh;
chmod +x ./install.sh;
./install.sh;

# ZSH stuff
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions;
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting;
# then in .zshrc set plugins = (git zsh-autosuggestions zsh-syntax-highlighting)
