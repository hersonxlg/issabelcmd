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

# ***************************************************************************
# Descargar el esquema de colores "molokai" para vim.
# ***************************************************************************
cd ~/.vim/colors
curl -o molokai.vim https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim

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
# Corregir la falla en "~/.bashrc"
# ***************************************************************************
line='[[ $- == *i* ]] || return'
b=$(grep -o "^${line}" /etc/ssh/sshd_config)
if [ -z "${b}" ];then
    cp ~/.bashrc ~/.bashrc.backup
    # No existe el la linea deseada.
    echo "--------------------------------------------------">~/.bashrc.temp
    echo "${line}">>~/.bashrc.temp
    echo "--------------------------------------------------">>~/.bashrc.temp
    echo ~/.bashrc>>~/.bashrc.temp
    # Reemplazar ".bashrc" por ".bashrc.temp":
    rm -f ~/.bashrc
    mv -f ~/.bashrc.temp ~/.bashrc

    # recargar el fichero "~/.bashrc":
    source ~/.bashrc
fi


cd $repdir
