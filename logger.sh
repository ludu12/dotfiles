today=`date +%Y-%m-%d` 

if [[ ! -e ~/Logs/$today.log ]]; then
    mkdir -p ~/Logs
    touch ~/Logs/$today.log
fi

vi ~/Logs/$today.log