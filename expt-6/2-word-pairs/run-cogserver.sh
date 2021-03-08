#! /bin/bash
# Load config paramters
if [ -r ../0-config/0-pipeline.sh ]; then
	   . ../0-config/0-pipeline.sh
   else
	      echo "Cannot find master configuration file!"
	         exit -1
fi

if [ -r ${PAIR_CONF_FILE} ]; then
	   . ${PAIR_CONF_FILE}
   else
	      echo "Cannot find pair-counting configuration file!"
	         exit -1
fi



exec guile -l ../common/cogserver-rocks.scm

