today=`date +%Y-%m-%d`

path='~/Documents/Logs'

if [[ ! -e $path/$today.log ]]; then
    mkdir -p $path
    touch $path/$today.log
fi

time=`date +%T`
echo "$time - " >> $path/$today.log
vi + $path/$today.log
 