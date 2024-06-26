#!/usr/bin/bash

repdir=$(cd)
cd

echo '------------------------------------------------------------'
echo '              Instalar "kdb"                                '
echo '------------------------------------------------------------'
yum -y install kbd


echo '------------------------------------------------------------'
echo '         Descargar las fuentes "Powerline"...               '
echo '------------------------------------------------------------'
git clone https://github.com/powerline/fonts.git
sleep 1s


echo '------------------------------------------------------------'
echo '              Instalar Powerline...                         '
echo '------------------------------------------------------------'

cd fonts
./install.sh

if ! [ -d /usr/share/fonts ]; then
    mkdir /usr/share/fonts
fi

cp -R /root/.local/share/fonts/* /usr/share/fonts
cp ~/fonts/Terminus/PSF/* /usr/lib/kbd/consolefonts

cd
rm -rf fonts


echo "\n\n"
echo '------------------------------------------------------------'
echo '     Actualizar el archivo "/etc/vconsole.conf"             '
echo '------------------------------------------------------------'

vconlose="/etc/vconsole.conf"
if ! [ -f /etc/vconsole.conf.backup ]; then
    cp /etc/vconsole.conf /etc/vconsole.conf.backup
fi
sed 's/\(^FONT=\).*/\1ter-powerline-v14v.psf.gz/' /etc/vconsole.conf>/etc/vconsole.conf.temp
sed 's/\(^KEYMAP=\).*/\1us/' /etc/vconsole.conf.temp > /etc/vconsole.conf.temp2
rm -f /etc/vconsole.conf
rm -f /etc/vconsole.conf.temp
mv /etc/vconsole.conf.temp2 /etc/vconsole.conf

echo "\n\n\n"
echo '------------------------------------------------------------'
echo ' Guarda "ter-powerline-v14v.psf.gz" como funte del sistema  '
echo '------------------------------------------------------------'
systemctl setfont ter-powerline-v14v.psf.gz
showconsolefont

cd $repodir

