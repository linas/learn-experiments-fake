#! /bin/bash
#
# Configuration parameters for word-pair counting.
#
#
# Enable or disable sentence splitting.
# If the text corpora have one sentence per line, then splitting is not
# needed. If the corpora are arranged into paragraphs (as conventional
# for natural language), then the paragraphs must be split into distinct
# sentences.
export SENTENCE_SPLIT=false

# IPv4 hostname and port number of where the cogserver is running.
export HOSTNAME=localhost
export PORT=17108
export PROMPT="scheme@(fake-pairs)> "
export COGSERVER_CONF=config/opencog-pairs-fake.conf

export OBSERVE="observe-text"

# URL for the database where pair counts will be accumulated
export STORAGE_NODE="(PostgresStorageNode \"postgres:///fake_pairs\")"

# File processing grunge
export MSG="Splitting and word-pair counting"
export IN_PROCESS_DIR=pair-split
export COMPLETED_DIR=pair-counted
