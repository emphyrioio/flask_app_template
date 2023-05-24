#!/bin/bash

#########################################################################################################
#                                                                                                       #
#    @@@@@@@    @@@@@@    @@@@@@   @@@  @@@      @@@@@@    @@@@@@@  @@@@@@@   @@@  @@@@@@@   @@@@@@@    #  
#    @@@@@@@@  @@@@@@@@  @@@@@@@   @@@  @@@     @@@@@@@   @@@@@@@@  @@@@@@@@  @@@  @@@@@@@@  @@@@@@@    #  
#    @@!  @@@  @@!  @@@  !@@       @@!  @@@     !@@       !@@       @@!  @@@  @@!  @@!  @@@    @@!      #  
#    !@   @!@  !@!  @!@  !@!       !@!  @!@     !@!       !@!       !@!  @!@  !@!  !@!  @!@    !@!      # 
#    @!@!@!@   @!@!@!@!  !!@@!!    @!@!@!@!     !!@@!!    !@!       @!@!!@!   !!@  @!@@!@!     @!!      #
#    !!!@!!!!  !!!@!!!!   !!@!!!   !!!@!!!!      !!@!!!   !!!       !!@!@!    !!!  !!@!!!      !!!      #
#    !!:  !!!  !!:  !!!       !:!  !!:  !!!          !:!  :!!       !!: :!!   !!:  !!:         !!:      #
#    :!:  !:!  :!:  !:!      !:!   :!:  !:!         !:!   :!:       :!:  !:!  :!:  :!:         :!:      #
#    :: ::::  ::   :::  :::: ::   ::   :::     :::: ::    ::: :::  ::   :::   ::   ::          ::       #
#    :: : ::    :   : :  :: : :     :   : :     :: : :     :: :: :   :   : :  :     :           :       #
#                                                                                                       #
#########################################################################################################

# Syntax: add_pypath.sh project_folder

if [ -z "$1" ]; then
    echo "Error: module folder required."
    echo "Usage: '$0 module_folder'"
    exit 1
fi

ACTIVATE_PATH="$(pwd)/.venv/bin/activate"

if [ ! -f $ACTIVATE_PATH ]; then
    echo "'activate' script could not be found in $ACTIVATE_PATH"
    exit 1
fi

MODULE_PATH="$(pwd)/$1"

if [[ -v PYTHONPATH ]]; then
    echo "" >> $ACTIVATE_PATH
    echo "# Adding $MODULE_PATH to PYTHONPATH." >> $ACTIVATE_PATH
    echo "MODULE_PATH=\"$MODULE_PATH\"" >> $ACTIVATE_PATH
    echo 'export PYTHONPATH="$PYTHONPATH:$MODULE_PATH"' >> $ACTIVATE_PATH
   
    echo "$MODULE_PATH added to PYTHONPATH."
else
    echo "" >> $ACTIVATE_PATH
    echo "# Adding $MODULE_PATH to PYTHONPATH." >> $ACTIVATE_PATH
    echo "MODULE_PATH=\"$MODULE_PATH\"" >> $ACTIVATE_PATH
    echo 'export PYTHONPATH="$MODULE_PATH"' >> $ACTIVATE_PATH
    
    echo "PYTHONPATH created with $MODULE_PATH"
fi