cd ~/
yum update
yum install perl,perl-libwww,perl-LWP-Protocol-https,sox,mpg123,format_sln -y
git clone git://github.com/zaf/asterisk-googletts
cd ~/asterisk-googletts
cp googletts.agi /var/lib/asterisk/agi-bin/
