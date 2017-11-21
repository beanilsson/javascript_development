echo ===================================================================
echo Setting timezone
echo ===================================================================

echo "Europe/Stockholm" | sudo tee /etc/timezone
sudo dpkg-reconfigure --frontend noninteractive tzdata

echo ===================================================================
echo Modifying prompt
echo ===================================================================

echo 'function parse_git_branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo "("${ref#refs/heads/}") "
}' >> ~/.bashrc
echo 'PS1="\[\033[48;5;244;38;5;255m\]\u@\h:\W \$(parse_git_branch)$\[\033[00m\] "' >> ~/.bashrc

echo ===================================================================
echo Upgrading packages
echo ===================================================================

sudo apt-get update
sudo apt-get -y upgrade

echo ===================================================================
echo Installing the Silver Searcher
echo ===================================================================

sudo apt-get -y install silversearcher-ag

echo ===================================================================
echo Installing Git
echo ===================================================================

sudo apt-get -y install git git-flow
touch ~/.ssh/known_hosts
ssh-keyscan -H github.com >> ~/.ssh/known_hosts
ssh-keyscan -H bitbucket.org >> ~/.ssh/known_hosts

echo ===================================================================
echo Installing MongoDB
echo ===================================================================

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt-get update
sudo dpkg --configure -a
sudo apt-get install -y mongodb-org

echo ===================================================================
echo Installing NodeJS
echo ===================================================================

curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install build-essential -y

echo ===================================================================
echo Installing Bower
echo ===================================================================

sudo npm install -g bower

echo ===================================================================
echo Installing Mean.io
echo ===================================================================

sudo npm install -g mean-cli

echo ===================================================================
echo All set up!
echo Commands used, and more, can be found here:
echo https://linuxacademy.com/howtoguides/posts/show/topic/11960-how-to-install-mean-on-ubuntu-1604
echo ===================================================================

echo Install nodemon/forever!!
