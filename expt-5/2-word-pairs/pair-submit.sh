#!/bin/bash
#
# pair-submit.sh
#
# Batch word-pair counting script.
#
# Loop over all of the corpora files (all the files in $CORPORA_DIR),
# and then (optionally) sentence-split them and submit them for
# word-pair counting.
#
# ---------

if [ -r ../0-config/0-pipeline.sh ]; then
	. ../0-config/0-pipeline.sh
else
	echo "Cannot find master configuration file!"
	exit -1
fi

../common/process-corpus.sh $PAIR_CONF_FILE
