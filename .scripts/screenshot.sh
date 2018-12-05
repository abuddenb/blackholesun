#!/bin/bash

ffmpeg -f x11grab -video_size 1920x1080 -i $DISPLAY -vframes 1 ~/screenshot-$(date -Iseconds).png
