#!/bin/bash
#alireza jahani fard
#email:alireza@jahanifard.ir
#ver:2.4
clear
notify_func (){
  if [ "$?" == "0" ];then
    notify-send -t 5000 "عملیات با موفقیت انجام شد"
  else
    notify-send -t 3000 "خطا در انجام عملیات لطفا مجددا انجام دهید"
  fi
}
public_application_func (){
  echo -e "select number:\n1)install fonts\t2)install pip and pip-pytho\t3)install anaconda2\n4)install virtualenv\t5)install curl\t6)install SimpleScreenRecorder\t7)install Shutter\n8)install cdo\t9)install  anydesk\t10)install Latex\t11)install tor\n12)config tor"
  exit_application="n"
  while [ "$exit_application" == "n" ];do
    read -p "enter one a number: " step
    case "$step" in
      "1")
        notify-send -t 1000 "نصب فونت"
        notify-send -t 1000 "رمز حساب کاربری خود را وارد کنید"
        sudo apt -y install git &&git clone https://github.com/fzerorubigd/persian-fonts-linux.git &&cd persian-fonts-linux/ &&./farsifonts.sh
        notify_func;;
      "2")
        notify-send -t 1000 "نصب pip و pip-python"
        notify-send -t 1000 "رمز حساب کاربری خود را وارد کنید"
        #gerp_pip2=`dpkg -l|grep -i "pip"|grep -i "python2"`
        #grep_pip3=`dpkg -l|grep -i "pip"|grep -i "python3"`
        sudo apt -y install python3-pip python-pip
        notify_func;;
      "3")
        notify-send -t 1000 "نصب anaconda2"
        cd ~
        wget https://repo.continuum.io/archive/Anaconda2-2019.03-Linux-x86_64.sh
        bash Anaconda2-*-Linux-x86_64.sh -b -p ~/anaconda
        rm Anaconda2-*-Linux-x86_64.sh
        echo 'export PATH="~/anaconda/bin:$PATH"' >> ~/.bashrc
        source .bashrc
        conda update conda;;
     "4")
       notify-send -t 1000 "نصب محیط ایزوله پایتون"
       notify-send -t 1000 "رمز حساب کاربری خود را وارد کنید"
       pip install virtualenv
       pip3 install virtualenv
       notify_func;;
     "5")
       notify-send -t 1000 "نصب curl"
       notify-send -t 1000 "رمز حساب کاربری خود را وارد کنید"
       sudo apt -y install curl
       notify_func;;
     "6")
       notify-send -t 1000 "نصب SimpleScreenRecorder"
       notify-send -t 1000 "رمز حساب کاربری خود را وارد کنید"
       sudo apt -y install simplescreenrecorder
       notify_func;;
     "7")
       notify-send -t 1000 "نصب Shutter"
       notify-send -t 1000 "رمز حساب کاربری خود را وارد کنید"
       sudo apt -y install shutter
       notify_func;;
     "8")
       notify-send -t 1000 "نصب cdo"
       notify-send -t 1000 "رمز حساب کاربری خود را وارد کنید"
       sudo apt -y install cdo
       notify_func;;
     "9")
       notify-send -t 1000 "نصب anydesk"
       notify-send -t 1000 "رمز حساب کاربری خود را وارد کنید"
       sudo apt -y install flatpak
       sudo add-apt-repository ppa:alexlarsson/flatpak
       sudo apt update &&sudo apt -y install flatpak gnome-software-plugin-flatpak
       flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
       flatpak install flathub com.anydesk.Anydesk
       notify_func;;
     "10")
       notify-send -t 1000 "نصب Latex"
       notify-send -t 3000 "ما فرض کردیم که فایل iso لاتک را در پوشه دانلود دارید و ضمنا با اسم texlive شروع میشود"
       notify-send -t 1000 "رمز حساب کاربری خود را وارد کنید"
       sudo apt -y install perl
       sudo mkdir /media/iso
       sudo mount -o loop $HOME/downloads/texlive*.iso  /media/iso
       cd $/media/iso
       sudo perl install-tl
       sudo apt install -y texstudio
       notify_func;;
    "11")
       notify-send -t 1000 "نصب tor"
       read -p "Do you have a tour?(y/n)" install_tor
       if [ "$install_tor"  == "n" ];then
         sudo apt install tor obfs4proxy obfsproxy privoxy torsocks
         sudo systemctl enable tor.service
         sudo systemctl start tor.service
         sudo systemctl enable privoxy.service
         sudo systemctl start privoxy.service
         sudo echo "[Unit]
Description=Anonymizing overlay network for TCP (multi-instance-master)

[Service]
User=debian-tor
Type=simple
RemainAfterExit=yes
ExecStart=/usr/bin/tor -f /etc/tor/torrc
ExecReload=/usr/bin/kill -HUP $MAINPID
KillSignal=SIGINT
LimitNOFILE=8192
PrivateDevices=yes

[Install]
WantedBy=multi-user.target"  > /etc/systemd/system/multi-user.target.wants/tor.service
        sudo systemctl daemon-reload
        sudo systemctl restart tor.service
        sudo echo "UseBridges 1
ClientTransportPlugin obfs4 exec /usr/bin/obfs4proxy
Bridge obfs4 104.168.175.42:443 F369D235DFAE703DBD6DDF7FEF4CB945B06CE152 cert=GrDMVEjlYGznY5Qb6v36q4ILPYmocekLSZsZhi1zLVC6p740xJzs5Y02lVbe6H1m/Vw3Yg iat-mode=0
Bridge obfs4 87.149.111.72:36693 6DB3073771FAE9A49C2DDBDA84E3F150007E7E6A cert=aIMKw+in93NYz9imrFxmGoS4ivVBV0AkbW4GjfPKi85HoWwouUegHYhWFhmLcsrDbsq1WQ iat-mode=0
" >> /etc/tor/torrc
        notify-send -t 2000 "در صورت قطع شدن یا عدم اتصال به تور"
        notify-send -t 2000 "برای دریافت پل جمله پیام بعدی را"
        notify-send -t 2000 "get transport obfs4"
        notify-send -t 2000 "به ایمیل که در پیام بعدی نمایش داده میشود ارسال کنید"
        notify-send -t 2000 "bridges@torproject.org"
        notify-send -t 2000 "در صورت نصب بودن تور و عدم اتصال"
        notify-send -t 2000 "حتما از مرحله ۱۲ استفاده بکنید"
        sudo echo " forward-socks5t / 127.0.0.1:9050 ." >> /etc/privoxy/config
        sudo systemctl enable privoxy.service
        sudo systemctl start privoxy.service
      else
        notify-send -t 2000 "از مرحله ۱۲ استفاده بکنید"
        public_application_func
      fi;;
  "12")
  echo "update";;
   esac
   read -p "You want to exit the application(y/n)" exit_application
done
exit_application_func
}
exit_application_func (){
  if [ "$exit_application" == "y" ];then
    home_application_func
  fi
}
install_python_pack (){
	exit_application="n"
	while { "$exit_application" == "y" };do
          notify-send -t 1000 "نصب پیکیج های پایتون"
          #sudo apt-get install libgeos-dev
          #sudo virtualenv -p /usr/bin/python2.7 env1_PHDNet
          #source env1_PHDNet/bin/activate
          sudo apt install python3-pip
          python3 -m pip install -U matplotlib
          sudo apt install git
          sudo apt-get install libgeos-3.6.2 libgeos-c1v5 libgeos-dev
          pip3 install --upgrade --user matplotlib numpy pyproj pyshp OWSLib Pillow
	  sudo apt-get install python-mpltoolkits.basemap
          sudo pip3 install nglpy
          sudo conda install -c conda-forge pynio
          sudo pip3 install python-igraph
          sudo pip3 install weave
          sudo pip3 install netCDF4
          sudo pip3 install mpi4py
          sudo pip3 install Sphinx
          sudo pip3 install pyunicorn
          sudo conda install -c conda-forge proj4
          sudo pip3 install numpy
          sudo pip3 install scipy
          sudo pip3 install --user https://github.com/matplotlib/basemap/archive/master.zip
          sudo pip3 install matplotlib
          notify_func;;
          read -p "You want to exit the application(y/n)" exit_application
        done
	exit_application_func
}

home_application_func (){
  echo -e "select number:\n1)install public software\t2)install python pack\t3)exit application"
  exit_application="n"
  while [ "$exit_application" == "n" ];do
    read -p "enter one a number: " step
    case "$step" in
      "1")
        public_application_func;;
      "2")
        virtualenviroment_func;;
      "3")
        exit
   esac
   read -p "You want to exit the application(y/n)" exit_application
done
}
home_application_func
