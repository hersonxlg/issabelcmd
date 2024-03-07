wget -O bat.zip https://github.com/sharkdp/bat/releases/download/v0.8.0/bat-v0.8.0-aarch64-unknown-linux-gnu.tar.gz
tar -xvzf bat.zip -C /usr/local
mv /usr/local/bat-v0.8.0-aarch64-unknown-linux-gnu /usr/local/bat
alias bat='/usr/local/bat/bat'
