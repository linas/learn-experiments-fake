#! /bin/bash
#
# all.sh
#
# Run everything needed for the language-learning pipeline.
#
# ----------------------

# Load config parameters
if [ -z $MASTER_CONFIG_FILE ]; then
	echo "MASTER_CONFIG_FILE not defined!"
	exit -1
fi

if [ -r $MASTER_CONFIG_FILE ]; then
	. $MASTER_CONFIG_FILE
else
	echo "Cannot find master configuration file!"
	exit -1
fi

if ! [ -z ${PAIR_CONF_FILE} ] && [ -r ${PAIR_CONF_FILE} ]; then
	. ${PAIR_CONF_FILE}
else
	echo "Cannot find pair-counting configuration file!"
	exit -1
fi

# Run the pair-counting cogserver
guile -l ${COMMON_DIR}/cogserver.scm -c "(sleep 150000000)" &

# Wait for the cogserver to intialize.
sleep 3

# Batch-process the corpus.
${COMMON_DIR}/process-corpus.sh $PAIR_CONF_FILE

# Shut down the server.
echo Done pair counting
echo "(exit-server)" | nc $HOSTNAME $PORT >> /dev/null

# Wait for the shutdown to complete.
sleep 1

# Compute the pair marginals.
guile -s ${COMMON_DIR}/marginals-pair.scm

# ------------------------
if ! [ -z ${MST_CONF_FILE} ] && [ -r ${MST_CONF_FILE} ]; then
	. ${MST_CONF_FILE}
else
	echo "Cannot find MST configuration file!"
	exit -1
fi

# Copy the database, to provide iolation between stages.
if [[ $STORAGE_NODE = "(RocksStorageNode"* ]]; then
	cp -pr ${PAIRS_DB} ${MST_DB}
elif [[ $STORAGE_NODE = "(PostgresStorageNode"* ]]; then
	createdb -T ${PAIRS_DB} ${MST_DB}
else
	echo "Unknown storage medium!"
	exit -1
fi

# Run the MST cogserver
guile -l ${COMMON_DIR}/cogserver-mst.scm -c "(sleep 150000000)" &

# Wait for the cogserver to intialize.
sleep 3

# Batch-process the corpus.
${COMMON_DIR}/process-corpus.sh $MST_CONF_FILE

# Shut down the server.
echo Done MST parsing
echo "(exit-server)" | nc $HOSTNAME $PORT >> /dev/null

# Wait for the shutdown to complete.
sleep 1

# Compute the disjunct marginals.
guile -s ${COMMON_DIR}/marginals-mst.scm

echo yoa quit
# ------------------------
