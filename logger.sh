today=`date +%Y-%m-%d`

if [[ ! -e ~/Documents/Logs/$today.log ]]; then
    mkdir -p ~/Documents/Logs
    touch ~/Documents/Logs/$today.log
fi

time=`date +%T`
echo "$time - " >> ~/Documents/Logs/$today.log
vi + ~/Documents/Logs/$today.log
 