#!/bin/sh
#Manual custom buffersize enabler for MPC/FORCE by Amit Talwar
ofile="/media/az01-internal-sd/custtomBuffer.txt"
DISABLE() {
	rm -f "$ofile" 2>/dev/null
	systemctl restart inmusic-mpc
	exit 0
}

ENABLE() {
	bf=0;
while [ $bf -ne 96 ] && [ $bf -ne 128 ] && [ $bf -ne 64 ] ; do
    read -p "Please Enter Required Buffer Period Size from [64, 96, 128]: " bf
  
    if [ -n "$bf" ] && [ "$bf" -eq "$bf" ] 2>/dev/null; then
  # echo you entered: $bf   	
echo "$bf" > "$ofile"
systemctl restart inmusic-mpc
exit 0
    else
    	echo "invalid input"
    	bf=0
    fi

done


exit 0
}

HELP() {

	echo "
	*********** CustomBufferSizes for Akai Force/MPC ***********
	Usage:
	customBufferSizer.sh ENABLE
	customBufferSizer.sh DISABLE
	"

}

opt=$1

[[ "$opt" == "ENABLE" ]] && ENABLE && exit 0


[[ "$opt" == "DISABLE" ]] && DISABLE && exit 0

HELP





