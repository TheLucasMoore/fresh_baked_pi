# first, take over the root user so we don't need sudo
# see https://vicpimakers.ca/tutorials/raspbian/change-the-raspbian-root-password/
# Is that a great idea? No. Does it simplify things? You betchya.

# This is essentially a reconfiguration of the keyboard with
# $ dpkg-reconfigure keyboard-configuration
# the BTC 9116URF one is 87 keys and seems to work just fine.
# @note comment this out if you're copying my script, ok? I need this to get pipe | to work
echo "First things first. Fix up that keyboard, yo."
wget https://raw.githubusercontent.com/TheLucasMoore/fresh_baked_pi/master/keyboard etc/default/keyboard
echo "Restarting your keyboard configuration."
service keyboard-setup restart

echo "Let's upgrade everything here and install some nice packages."
sudo apt-get update && sudo apt-get upgrade;
sudo apt-get install git zsh vim tmux;

echo "Great. Now let's get zsh installed."
wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
chmod +x ./install.sh
./install.sh # shell script inception
# ZSH packages that I like.
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# set my zshrc up nice and pretty
wget https://raw.githubusercontent.com/TheLucasMoore/fresh_baked_pi/master/zshrc ~/.zshrc
source ./zshrc

echo "Ok, things are pretty well set up on this machine now."
