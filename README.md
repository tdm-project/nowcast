
# TDM Nowcasting application


## Build the Docker image

    make

## Run it

    docker run -it --rm tdmproject/nowcast --help
    docker run -it --rm --volume /home/user/RadarMeteo/:/home/tdm tdmproject/nowcast radarData.npy nowcast-output.npy
