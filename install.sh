temp=$(pwd)

mkdir ~/.vim
mkdir ~/.vim/autoload
mkdir ~/.vim/backup
mkdir ~/.vim/colors
mkdir ~/.vim/plugged

# Descargar el administrador de paquetes "autoload"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Descargar el esquema de colores "molokai" para vim.
cd ~/.vim/colors
curl -o molokai.vim https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim

cd $temp
mv .vimrc ~/
