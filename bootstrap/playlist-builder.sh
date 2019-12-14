
#### Setup playlist for stream fallback ####

# Sort-out the playlist file...
touch /etc/ezstream_playlist.m3u

FALLBACK_MEDIA=`find $EXTERNAL_MEDIA -type f -name *.mp3`
if [ $? -eq 0 ]; then
    if [[ $(echo "$FALLBACK_MEDIA" | wc -l) -ge 0 ]];then
        echo "$FALLBACK_MEDIA" > /etc/ezstream_playlist.m3u
    fi
fi

echo "Wrote ezstream_playlist.m3u & Reloaded ezstream"

# See here: https://icecast.imux.net/viewtopic.php?t=6438&sid=98f01c25910c27fa7276d89ae24def64 -- Supervisor will take care of the rest...
killall -HUP ezstream
