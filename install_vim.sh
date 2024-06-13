
repdir=$(pwd)

# ***************************************************************************
# Instalar VIM.
# ***************************************************************************
yum install vim -y

# ***************************************************************************
# Crear el arbol de directorios para la configuracion de vim.
# ***************************************************************************
mkdir ~/.vim
mkdir ~/.vim/autoload
mkdir ~/.vim/backup
mkdir ~/.vim/colors
mkdir ~/.vim/plugged

# ***************************************************************************
# Descargar el administrador de paquetes "autoload" de vim.
# ***************************************************************************
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim


# -----------------------------------------------------------------------------------
# Remover el parametro "--shallow-submodules" de git que se indica en el fichero:
#
# ~/.vim/bundle/Vundle.vim/autoload/vundle/installer.vim
#
# debido a que genera errores en la instalacion de paquetes "vim" en Vundle
# para "CentOS 7" (en issabel 4).
#
# -----------------------------------------------------------------------------------
tempdir=$(pwd)
cd ~/.vim/bundle/Vundle.vim/autoload/vundle/
mv installer.vim installer.vim.backup # creo un backup.
sed 's/\(.*\)\(--shallow-submodules \)\(.*\)/\1\3/i' installer.vim.backup >installer.vim
cd $tempdir



# ***************************************************************************
# Descargar el esquema de colores "molokai" para vim.
# ***************************************************************************
cd ~/.vim/colors
curl -o 'molokai.vim https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim'
wget 'https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim'

# ***************************************************************************
# mover el fichero de configuracion de vim ".vimrc" del repositorio
# al directorio "HOME" (~).
# ***************************************************************************
cd $repdir
cp .vimrc ~/


# ***************************************************************************
# Mover el fichero de configuracion ".inputrc" del repositorio
# al directorio "HOME" (~).
# ***************************************************************************
cd $repdir
cp .inputrc ~/
source ~/.inputrc

# ***************************************************************************
# Comprobar que vi-mode esta activo en bash
# sino, activarlo.
# ***************************************************************************
line='set -o vi'
b=$(grep -o "^${line}" ~/.bashrc)
if [ -z "${b}" ];then
    cp ~/.bashrc ~/.bashrc.backup
    # No existe el la linea deseada, por tanto:
    # agregar el siguiete fragmento de codigo al final de "~/.bashrc"
    echo "">>bashrc
    echo "# --------------------------------------------------">>~/.bashrc
    echo "# vi-mode">>~/.bashrc
    echo "${line}">>~/.bashrc
    echo "# --------------------------------------------------">>~/.bashrc
    echo "# cambiar el <esc>">>~/.bashrc
    echo "bind '\"kj\":\"\\e\"'">>~/.bashrc
    echo "">>~/.bashrc
    echo "">>~/.bashrc
    echo "alias ext='vim /etc/asterisk/extensions_custom.conf'">>~/.bashrc
    echo "">>bashrc

    # recargar el fichero "~/.bashrc":
    source ~/.bashrc
fi


cd $repdir
