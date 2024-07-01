# play youtube music in mpv
ytmusic () {
    mpv --no-audio-display $(yt-dlp --get-url --extract-audio "ytsearch:$*")
}
