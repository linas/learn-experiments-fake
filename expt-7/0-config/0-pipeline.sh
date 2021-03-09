#! /bin/bash
#
# 0-pipeline.sh

export TEXT_DIR=/home/ubuntu/run/expt-7
export ROCKS_DATA_DIR=/home/ubuntu/data/expt-7

# Directory in which configuration parameters (including this file)
# are located.
export CONFIG_DIR=$TEXT_DIR/0-config

# File containing artificial-languaage generation configuration
export GEN_CONF_FILE=$CONFIG_DIR/1-corpus-conf.sh

# File containing pair-counting configuration
export PAIR_CONF_FILE=$CONFIG_DIR/2-pair-conf-fake.sh

# File containing MST-parsing configuration
export MST_CONF_FILE=$CONFIG_DIR/3-mpg-conf-fake.sh
