#!/bin/bash

if [ -z "$1" ];then
	echo "Usage: $0 <stream name>" >&2
	exit 2;
fi

WIDTH=1920
HEIGHT=1080
FRAMERATE=30
BITRATE=5120000
PERIODICITY=45
STREAM_NAME=$1
LOG_CONFIG=/usr/local/etc/kvs_log_configuration


gst-launch-1.0 v4l2src do-timestamp=TRUE device=/dev/video0 \
  ! videoconvert \
  ! video/x-raw,format=I420,width=$WIDTH,height=$HEIGHT,framerate=${FRAMERATE}/1 \
  ! omxh264enc control-rate=1 target-bitrate=$BITRATE periodicty-idr=$PERIODICITY inline-header=FALSE \
  ! h264parse \
  ! video/x-h264,stream-format=avc,alignment=au,width=$WIDTH,height=$HEIGHT,framerate=${FRAMERATE}/1,profile=baseline \
  ! kvssink stream-name=$STREAM_NAME log-config=$LOG_CONFIG

