#!/bin/bash
#alireza jahani fard
#email:alireza@jahanifard.ir
#ver:1.0
clear
notify_func (){
  if [ "$?" == "0" ];then
    notify-send -t 5000 "عملیات با موفقیت انجام شد"
  else
    notify-send -t 3000 "خطا در انجام عملیات لطفا مجددا انجام دهید"
  fi
}
public_application_func (){
  echo -e "select number:\n1)install fonts\t2)install pip and pip-pytho\t3)install anaconda2\n4)install virtualenv\t5)install curl\t6)install SimpleScreenRecorder\t7)install Shutter\n8)install cdo\t9)install  anydesk\t10)install Latex"
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
        sudo apt -y install pip python-pip
        notify_func;;
      "3")
        notify-send -t 1000 "نصب anaconda2"
        cd ~
        wget https://repo.continuum.io/archive/Anaconda2-4.2.0-Linux-x86_64.sh
        bash Anaconda2-4.2.0-Linux-x86_64.sh -b -p ~/anaconda
        rm Anaconda2-4.2.0-Linux-x86_64.sh
        echo 'export PATH="~/anaconda/bin:$PATH"' >> ~/.bashrc
        source .bashrc
        conda update conda;;
     "4")
       notify-send -t 1000 "نصب محیط ایزوله پایتون"
       notify-send -t 1000 "رمز حساب کاربری خود را وارد کنید"
       pip install virtualenv
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
       sudo apt -y install Shutter
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
home_application_func (){
  echo -e "select number:\n1)install public software\t2)install virtual env\t3)exit application"
  exit_application="n"
  while [ "$exit_application" == "n" ];do
    read -p "enter one a number: " step
    case "$step" in
      "1")
        public_application_func;;
      "2")
        echo "update";;
      "3")
        exit
   esac
   read -p "You want to exit the application(y/n)" exit_application
done
}
home_application_func
