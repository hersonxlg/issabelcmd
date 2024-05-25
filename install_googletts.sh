temp=$(pwd)
cd ~/
yum update
yum install perl perl-libwww perl-LWP-Protocol-https sox mpg123 format_sln -y
git clone https://github.com/zaf/asterisk-googletts.git
cd ~/asterisk-googletts
cp googletts.agi /var/lib/asterisk/agi-bin/
cd $temp
