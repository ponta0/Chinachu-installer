#! /bin/bash


for tuner in `cat tuners.txt` ; do
    cat ../tuners/"$tuner"/"$tuner".yml >> /usr/local/etc/mirakurun/tuners.yml
done

