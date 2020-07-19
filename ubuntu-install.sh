sudo add-apt-repository ppa:linrunner/tlp -y
sudo apt update -y
sudo apt install gnome-tweak-tool git tlp tlp-rdw acpi-call-dkms tp-smapi-dkms acpi-call-dkms build-essential python3-dev libdbus-glib-1-dev libgirepository1.0-dev libcairo2-dev python3-venv python3-wheel curl apt-transport-https ca-certificates software-properties-common -y 
git clone https://github.com/erpalma/lenovo-throttling-fix.git
sudo ./lenovo-throttling-fix/install.sh

sudo mv /usr/share/budgie-extras-daemon/tilix_alt.bde  /usr/share/budgie-extras-daemon/tilix_alt.bde.bak
sudo cp tlp.txt /etc/tlp.conf
sudo cp lenovo_fix.conf /etc/lenovo_fix.conf

echo "Installing Docker"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce -y
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable docker

sh common/pre-setup.sh
sh common/miniconda_install.sh&
sh common/snaps_install.sh
sh common/git_setup.sh
sh common/aws-cli-install.sh
