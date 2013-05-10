TiVo Transcode Is a set of cron-able shell scripts, designed to be a totally 
automated, maintenance-free, method of transcoding TiVo recordings to a 
destination.

I've created this as part of my end-to-end solution for recording live TV with a TiVo premiere, transcoding, and later viewing the recordings on Roku 2 set top boxes.

To that end, the script targets h264 video, and stereo aac in an mp4 container.

These scripts are designed to work on Debian Squeeze boxes, with the squeeze-backports apt source.

Detailed instructions are below....

1.) Enable non-free contrib for all normal apt sources.
2.) Add the squeeze-backports source.

3.) Install the necessary bits...
    sudo apt-get -t squeeze-backports install ffmpeg libvo-aacenc0 mencoder libavcodec-extra-53 libavcodec52
    sudo apt-get install build-essential subversion git curl apache2 libapache2-mod-php5


4.) Create a new system user with a home directory.
    sudo adduser --system --home /var/tivotranscode --shell /bin/bash --ingroup www-data tivotranscode
    sudo su tivotranscode -
    

5.) Setup the software...
    # Build tivodecode
    cd ~
    svn co https://tivodecode.svn.sourceforge.net/svnroot/tivodecode/tivodecode/trunk ./tivodecode
    cd tivodecode
    ./configure
    make
    
    # Get the tivotransfer code.
    
    # List the shows on your tivo.
    

