#! /bin/bash
#
# Configuration parameters for Planar MST parsing.
#
export CORPORA_DIR=$TEXT_DIR/pair-counted
export SENTENCE_SPLIT=false

# IPv4 hostname and port number of where the cogserver is running.
export HOSTNAME=localhost
export PORT=18008
export PROMPT="scheme@(mpg-parse)> "
export COGSERVER_CONF=${CONFIG_DIR}/3-cogserver/cogserver-mst-fake.conf

# Scheme function name for planar MST parsing.
export OBSERVE="observe-mpg"

# URL for the database where disjunct counts will be accumulated
ROCKS_DB_URL=rocks://${ROCKS_DATA_DIR}/mpg_parse.rdb
export STORAGE_NODE="(RocksStorageNode \"${ROCKS_DB_URL}\")"

# Directories where in-process and completed files will be moved.
export IN_PROCESS_DIR=mpg-split
export COMPLETED_DIR=mpg-done

# Message printed for each processed file
export MSG="MPG-Processing"
