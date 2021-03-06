#! /bin/bash
#
# Automated corpus generation. Configurable parameters are located
# in `0-config/1-corpus-conf.sh` and in `1-dict-conf.scm`. Edit those
# file as desired.
#
# ---------

if [ -r ../0-config/0-pipeline.sh ]; then
	. ../0-config/0-pipeline.sh
else
	echo "Cannot find master configuration file!"
	exit -1
fi

if [ -r $CONFIG_DIR/1-corpus-conf.sh ]; then
	. $CONFIG_DIR/1-corpus-conf.sh
else
	echo "Cannot find corpus configuration file!"
	exit -1
fi

# Generate a dictionary. The return string is either an error message,
# or its the configured directory.
RET_STR=`./gen-dict.scm $CONFIG_DIR/$DICT_CONF $DICT_DIR`

if [ $? -ne 0 ]; then
	echo $RET_STR
	exit -1
fi

DICT=$DICT_DIR
CORP=$CORPORA_DIR

if [[ -d $CORP ]]; then
	echo Corpus directory exists: $CORP
	echo Delete or move this directory and try again
	exit -1
fi

echo Dictionary is located in $DICT
echo Corpus is in $CORP

mkdir $CORP

# Generate corpus files, containing sentences of different lengths.
# For example:
# link-generator -l $DICT -s 4 -c 150000 > $CORP/corpus-4.txt

for (( n=$SHORTEST; n<=$LONGEST; n++)); do
	echo Generating sentences of length $n
	link-generator -l $DICT -s $n -c $NSENT > $CORP/corpus-$n.txt
done

exit 0
