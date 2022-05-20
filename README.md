
Fake Language Experiments
=========================
Experiments in learning fake, artificial languages.
March-May 2021.  Abandoned, due to experimental and practical
difficulties.  Basically:
* Hard to debug, because no intuitive sense of the fake langauges.
* Grammar ambiguity: there are many grammars that general equivalent
  and nearly-equivalent languages.

See the diary for details. Diary is at
https://github.com/opencog/learn/tree/master/language-learning-diary

Experimental configuration data
------------------------------

This repo contains config files for running the language-learning
pipeline, as well as occasional scripts and data. The summary of
results can be found in:

https://github.com/opencog/learn/learn-lang-diary-part-two.lyx
and
https://github.com/opencog/learn/notes

Although config files get checked into git, the older runs are then
deleted (as documented below) to minimize clutter.

A quick guide:

* expt-1, expt-2 - Never checked into git. Pipeline commisioning.
* expt-3 through expt-9 - Pipeline commisioning, first science runs.
  Deleted 18 March 2021.
* expt-10 through expt-18 start resucitating the shape code, and
  restart work on connector merging. Also debug rocksdb version 5.17
  in expt-17 and debug rocksdb 6.19 in expt-18 See
  https://github.com/opencog/atomspace-rocks/issues/10
  Delete expt-17 and expt-18 on 25 May 2021
* expt-19 (25 May 2021) is the first run with what I think is correct,
  working shape code. Its a copy of the same corpus as expt-18.
