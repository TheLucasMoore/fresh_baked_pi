# first, take over the root user so we don't need sudo
# see https://vicpimakers.ca/tutorials/raspbian/change-the-raspbian-root-password/
# Is that a great idea? No. Does it simplify things? You betchya.

# TO USE THIS SCRIPT RUN
# wget https://raw.githubusercontent.com/TheLucasMoore/fresh_baked_pi/master/fresh_baked_pi.sh
# chmod +x fresh_baked_pi.sh
# /.fresh_baked_pi.sh

# @note comment this out if you're copying my script, ok? I need this to get pipe | to work
echo "################### WELCOME ###################"
echo "First things first. Fix up that keyboard, yo."
# This is essentially a reconfiguration of the keyboard with
# $ dpkg-reconfigure keyboard-configuration
# the BTC 9116URF one is 87 keys and seems to work just fine.
wget https://raw.githubusercontent.com/TheLucasMoore/fresh_baked_pi/master/keyboard etc/default/keyboard
echo "Restarting your keyboard configuration."
service keyboard-setup restart

echo "################### Step One ###################"
echo "Let's upgrade everything here and install some nice packages."
sudo apt-get update && sudo apt-get upgrade;
sudo apt-get install git zsh vim tmux;

echo "################### Step Two ###################"
echo "Great. Now let's get zsh installed."
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
# ZSH packages that I like.
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# set zshrc up nice and pretty
wget https://raw.githubusercontent.com/TheLucasMoore/fresh_baked_pi/master/zshrc ~/.zshrc
source ~/.zshrc

echo "################### Step Three ###################"
echo "Ok, things are pretty well set up on this machine now."
