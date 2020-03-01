sudo apt install -y steamlink

# From clouma (https://github.com/cluoma/steamlink.service)
cd /etc/systemd/system/ && wget https://raw.githubusercontent.com/cluoma/steamlink.service/master/steamlink.service

cd ~
sudo systemctl daemon-reload
sudo systemctl enable steamlink.service
sudo reboot now