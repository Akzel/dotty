#!/bin/bash

file=$1
socket="/tmp/mpv.socket"
playlist="/tmp/playlist"

if pgrep -x mpv > /dev/null; then
	echo "mpv is running, sending file to playlist";
	# Send 'loadfile' command to mpv via its IPC socket
	echo '{ "command": ["loadfile", "'"$file"'", "append"] }' | socat - "$socket"
else
	echo "mpv not running, starting new instance"
	echo "$file" > "$playlist"
	nohup mpv --input-ipc-server="$socket" --ytdl-raw-options=cookies-from-browser=firefox --playlist=/tmp/playlist --prefetch-playlist --save-position-on-quit --load-unsafe-playlists > /dev/null 2>&1 &
fi
