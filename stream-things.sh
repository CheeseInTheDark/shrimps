#!/bin/bash

ffmpeg -f x11grab -video_size cif -i :0.0 \
    -c:a aac -ac 2 -b:a 128k -c:v libx264 -pix_fmt yuv420p -profile:v baseline -preset ultrafast -tune zerolatency -vsync cfr -x264-params "nal-hrd=cbr" -b:v 500k -minrate 500k -maxrate 500k -bufsize 1000k -g 60 -s 640x360 -f flv rtmp://localhost/dash/shrimps_low \
    -c:a aac -ac 2 -b:a 128k -c:v libx264 -pix_fmt yuv420p -profile:v baseline -preset ultrafast -tune zerolatency -vsync cfr -x264-params "nal-hrd=cbr" -b:v 1500k -minrate 1500k -maxrate 1500k -bufsize 3000k -g 60 -s 1280x720 -f flv rtmp://localhost:1935/dash/shrimps_med \
    -c:a aac -ac 2 -b:a 128k -c:v libx264 -pix_fmt yuv420p -profile:v baseline -preset ultrafast -tune zerolatency -vsync cfr -x264-params "nal-hrd=cbr" -b:v 5000k -minrate 5000k -maxrate 5000k -bufsize 10000k -g 60 -s 1920x1080 -f flv rtmp://localhost:1935/dash/shrimps_high
