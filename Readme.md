# Streaming video from Raspberry Pi 3(+) to AWS Kinesis Video

## Camera

Install the camera module to the Raspberry Pi. Enable it in raspi-config.


## amazon-kinesis-video-streams-producer-sdk-cpp

You need the _kvssink_ plugin for _gstreamer_ to be able to send your video stream to aws kinesis.

For this you have to build the [Amazon Kinesis Video Streams Producer SDK C/C++](https://github.com/awslabs/amazon-kinesis-video-streams-producer-sdk-cpp) project.

### install prerequisites

See also [Install Steps for Ubuntu 17.x and Raspbian Stretch using apt-get](https://github.com/awslabs/amazon-kinesis-video-streams-producer-sdk-cpp/blob/master/install-instructions-linux.md#install-steps-for-ubuntu-17x-and-raspbian-stretch-using-apt-get)

Install with apt-get / aptitude:

git
cmake
g++
libssl-dev
libcurl4-openssl-dev
liblog4cplus-1.1-9
liblog4cplus-dev
libgstreamer1.0-dev
libgstreamer-plugins-base1.0-dev
gstreamer1.0-plugins-base-apps
gstreamer1.0-plugins-bad
gstreamer1.0-plugins-good
gstreamer1.0-plugins-ugly
gstreamer1.0-tools
gstreamer1.0-omx

Check if you gstreamer can find the omx plugins.

```
pi@camera2:~ $ gst-inspect-1.0 | grep omx
omx:  omxmpeg2videodec: OpenMAX MPEG2 Video Decoder
omx:  omxmpeg4videodec: OpenMAX MPEG4 Video Decoder
...
```
If you don't see them. It might help to delete the directory `~/.cache/gstreamer-1.0` directory.

### build

Clone the repository of the [Amazon Kinesis Video Streams Producer SDK C/C++](https://github.com/awslabs/amazon-kinesis-video-streams-producer-sdk-cpp) project.

Go into the project directory, then the subdirectory _kinesis_video_native_build_ and run:

```
./min-install-script
```
