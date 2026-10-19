#! /bin/bash
echo "0" > /tmp/cislo

while true

cislo=`cat /tmp/cislo`

do
if  (("$cislo" > "4"))
then
    echo "0" > /tmp/cislo
    cislo=`cat /tmp/cislo`
fi

if ! pgrep -f "ffplay" > /dev/null
then

if  (("$cislo" == "0"))
then
curl -k -L https://rozhlas.stream/vltava_low.aac | ffplay -protocol_whitelist file,udp,rtp,pipe -af "pan=mono|c0=c0" -

elif  (("$cislo" == "1"))
then
curl -k -L https://rozhlas.stream/dvojka_low.aac | ffplay -protocol_whitelist file,udp,rtp,pipe -af "pan=mono|c0=c0" -

elif  (("$cislo" == "2"))
then
curl -k -L https://ice3.radia.cz/povidka64.mp3 | ffplay -protocol_whitelist file,udp,rtp,pipe -af "pan=mono|c0=c0" -

elif  (("$cislo" == "3"))
then
#mplayer -af channels=1 /var/radio/stream.sdp
ffplay -protocol_whitelist file,udp,rtp -af "pan=mono|c0=c0" stream.sdp

elif  (("$cislo" == "4"))
then
curl -k -L https://rozhlas.stream/plus_low.aac | ffplay -protocol_whitelist file,udp,rtp,pipe -af "pan=mono|c0=c0" -

fi
else killall ffplay
fi
done

# set here the stations URLs with desidered formats from any source like https://fmstream.org/
