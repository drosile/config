TIZONIA=$(pgrep -x tizonia)
if [ $? -eq 1 ]; then
    echo 
    echo
    echo
    echo
    exit 1
fi


STATUS=$(tizonia-remote playstatus);
TEXT="";

PARAMS=(
    --session
    --dest=org.freedesktop.DBus
    --type=method_call
    --print-reply
    /org/freedesktop/DBus
    org.freedesktop.DBus.ListNames
)

TIZBUSNAME=$(dbus-send ${PARAMS[@]} | grep tizonia | awk -F'"' '{ print $2 }')
DBUSCMD="dbus-send --print-reply --dest=$TIZBUSNAME /com/aratelia/tiz/tizonia"
PROPGETIFC='org.freedesktop.DBus.Properties.Get'
PLAYERIFC='org.mpris.MediaPlayer2.Player'
METADATA=$($DBUSCMD $PROPGETIFC string:"$PLAYERIFC" string:"Metadata")
#PROPGETIFC='org.freedesktop.DBus.Properties.GetAll'
#METADATA=$($DBUSCMD $PROPGETIFC string:"$PLAYERIFC")

echo $DBUSCMD >&2
echo $METADATA >&2

if [ $STATUS = '"Playing"' ]; then
    TEXT="";
elif [ $STATUS = '"Paused"' ]; then
    TEXT="";
elif [ $STATUS = '"Stopped"' ]; then
    TEXT="⏹";
fi

# echo '{"text": "'$TEXT'", "tooltip": "", "class": "", "percentage": 100}'

echo $TEXT
echo
echo
echo
