#! /bin/bash
#
# Configuration parameters for artificial language corpus generation.
#
# Directory where dictionary will be written
export DICT_DIR=$TEXT_DIR/fake-lang

# Directory where corpora files will be written
export CORPORA_DIR=$TEXT_DIR/fake-corpus

# The length of the shortest and the longest sentences to generate.
# Sentences between these lengths (inclusive) will be generated.
SHORTEST=5
LONGEST=5

# Pair counting runs at about 15 to 30 sentences per second
# on present-day desktop CPUs.
# MPG parsing runs at about 100 to 300 sentences per second.
NSENT=25000
