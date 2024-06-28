#!/bin/bash

for x in 0 10 20 30 40 50 60 70 80 90; do wget -c https://download.cs.stanford.edu/viscam/ObjectFolder_Real/tactile/tactile_data_$((x+1))_$((x+10)).tar.gz -O tactile_data_$((x+1))_$((x+10)).tar.gz && tar -xzf tactile_data_$((x+1))_$((x+10)).tar.gz; done
