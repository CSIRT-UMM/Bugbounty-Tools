#!/bin/bash

sudo apt update -y && sudo apt upgrade -y
sudo apt install python3-pip -y
sudo apt-get install python -y
sudo apt-get install python3 -y
sudo apt install golang-go -y
sudo apt install -y libpcap-dev

echo ▶ Creat dir Bugbounty
mkdir ~/Bugbounty && cd ~/Bugbounty

#Install Commix
echo ▶ Install commix
git clone https://github.com/commixproject/commix.git
cd commix
echo "#!/bin/bash" >> commix
echo python3 ~/Bugbounty/commix/commix.py "$@" >> commix
chmod +x commix
sudo mv commix /bin/
cd ../

#Install Amass
echo ▶ Install amass
sudo apt-get install amass

#Install Arjun
echo ▶ Install arjun
sudo pip3 install arjun

#Install Evil Winrm
echo ▶ Install evil winrm
sudo gem install evil-winrm

#Install Rustscan
echo ▶ Install rustscan
mkdir rustscan && cd rustscan
wget https://github.com/RustScan/RustScan/releases/download/2.0.1/rustscan_2.0.1_amd64.deb
sudo dpkg -i rustscan_2.0.1_amd64.deb
cd ../

#Install ParamSpider
echo ▶ Install param spider
git clone https://github.com/devanshbatham/ParamSpider
cd ParamSpider
pip3 install -r requirements.txt
echo "#!/bin/bash" >> paramspider
echo python3 ~/Bugbounty/ParamSpider/paramspider.py "$@" >> paramspider
chmod +x paramspider
sudo mv paramspider /bin
cd ../

#Install Kxss
echo ▶ Install kxss
go install github.com/Emoe/kxss@latest

#Install Waybackurls
echo ▶ Install waybackurls
go install github.com/tomnomnom/waybackurls@latest

#Install Gf
echo ▶ Install gf
go install github.com/tomnomnom/gf@latest
git clone https://github.com/1ndianl33t/Gf-Patterns
mkdir ~/.gf
cd Gf-Patterns
mv *.json ~/.gf
cd ../

#Install Gauplus
echo ▶ Install gauplus
go install github.com/bp0lr/gauplus@latest

#Install Dalfox
echo ▶ Install dalfox
go install github.com/hahwul/dalfox/v2@latest

#Install Subfinder
echo ▶ Install subfinder
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

#Install Httpx
echo ▶ Install httpx
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest

#Install Muclei
echo ▶ Install nuclei
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest

#Install Qsreplace
echo ▶ Install Qsreplace
go install -v github.com/tomnomnom/qsreplace@latest

#Install Naabu
echo ▶ Install naabu
go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest


cd ~/go/bin
sudo mv * /bin

echo Finish
exit
