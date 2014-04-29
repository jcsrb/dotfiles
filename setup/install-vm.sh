#!/bin/bash
# ------------------------------------------------------------------
# [Author] Jakob Cosoroaba
#          Description
# ------------------------------------------------------------------

SUBJECT=programming-env-version-ma
USAGE=$'Usage: install-vm install [manager] \n Valid managers are: rvm, gvm, nvm, all'

# --- Option processing --------------------------------------------
if [ $# == 0 ] ; then
    echo $USAGE
    exit 1;
fi

while getopts ":vh" optname
  do
    case "$optname" in
      "v")
        echo "Version $VERSION"
        exit 0;
        ;;
      "h")
        echo $USAGE
        exit 0;
        ;;
      "?")
        echo "Unknown option $OPTARG"
        exit 0;
        ;;
      ":")
        echo "No argument value for option $OPTARG"
        exit 0;
        ;;
      *)
        echo "Unknown error while processing options"
        exit 0;
        ;;
    esac
  done

shift $(($OPTIND - 1))

param=$2
# -----------------------------------------------------------------

LOCK_FILE=/tmp/${SUBJECT}.lock

if [ -f "$LOCK_FILE" ]; then
echo "Script is already running"
exit
fi

# -----------------------------------------------------------------
trap "rm -f $LOCK_FILE" EXIT
touch $LOCK_FILE 

# -----------------------------------------------------------------
#  SCRIPT LOGIC GOES HERE
# -----------------------------------------------------------------

function install_go_vm(){
	#gvm https://github.com/moovweb/gvm
	bash < <(curl -s -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)	
}

function install_ruby_vm(){
	#ruby https://rvm.io/
	curl -sSL https://get.rvm.io | bash -s stable
}

function install_node_vm(){
	#nvm https://github.com/creationix/nvm
	curl https://raw.githubusercontent.com/creationix/nvm/v0.5.1/install.sh | sh	
}

if [ "$1" == "install" ]; then
	case "$param" in
	      "gvm")
	        install_go_vm
	        exit 0;
	        ;;
	      "rvm")
	        install_ruby_vm
	        exit 0;
	        ;;
	      "nvm")
	        install_node_vm
	        exit 0;
	        ;;
	      "all")
	         install_go_vm
	         install_ruby_vm
	         install_node_vm
	        exit 0;
	        ;;
	      *)
	        echo "Unknown version manager to install"
	        exit 0;
	        ;;
	    esac
fi
