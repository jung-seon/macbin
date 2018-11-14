vlc -I dummy Music/ANTONIO_CARLOS_JOBIM_1969_Wave.webm --sout '#standard{access=http,mux=ogg,dst=192.168.0.2:8081}' 

vlc -I dummy search.mkv sout='#transcode{vcodec=h264,acodec=mp3,ab=128,channels=2,samplerate=44100}:http{dst=:8081/search.mpg}'

youtube-dl -j --flat-playlist https://www.youtube.com/watch\?v\=yMQncICQFYs\&list\=PLW_uvsSPlijvMY-6Y-0I-bi4tlUFKEuFK | jq '.id' | sed 's_^_https://youtube.com/v/_'
