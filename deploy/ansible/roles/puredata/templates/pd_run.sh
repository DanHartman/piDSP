#!/bin/bash

sudo /usr/bin/pd -nogui -rt -r "44100" -audiobuf 2 {{ default_puredata_patch }}
