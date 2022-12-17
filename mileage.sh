today=`date +%Y-%m-%d`
year=`date +%Y`

dir=~/Documents/Logs/miles
file=~/Documents/Logs/miles/$year-mileage.json

if [[ ! -e "$file" ]]; then
    mkdir -p "$dir"
    touch "$file"
    echo "{}" >> "$file"
fi

amount=$1
re='^[+-]?[0-9]*\.?[0-9]+$'
if ! [[ $amount =~ $re ]] ; then
   echo "ERROR: Input is not a number \"$amount\"" >&2; exit 1
fi

jq --arg t "$today" --arg a "$amount" '.[$t] += ($a|tonumber)' "$file" | sponge "$file"


GREEN='\033[0;32m'
NC='\033[0m' # No Color
echo "\n"
echo "Current mileage for $today:\t$(jq --arg t "$today" '.[$t]' "$file") miles"
echo "${GREEN}Total mileage for $year:\t$(jq '. | map(values) | add ' "$file") miles"
echo "\n"


