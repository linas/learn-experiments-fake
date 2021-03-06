#! /usr/bin/env -S guile
!#
;
; dict-comp.scm
; Compare LG dictionary to the English dictionary.
;
; Usage:
; guile -s dict-comp.scm <dict-name> <sentence-file-name>
;
; <dict-name> should be a valid Link-Grammar dictionary
; <sentence-file-name> should be a file containing sentences
;
; Example:
; guile -s dict-comp.scm micro-fuzz sentences.txt
;

(use-modules (srfi srfi-1))
(use-modules (ice-9 rdelim))
(use-modules (opencog) (opencog nlp) (opencog nlp learn))

; Check usage
(if (not (equal? 3 (length (program-arguments))))
	(begin
		(format #t
			"Usage: ~A <dict-name> <sentence-file-name>\n"
			(first (program-arguments)))
		(exit #f)))

(define test-dict (second (program-arguments)))
(define sent-file (third (program-arguments)))

; Check file access
(if (not (equal? (stat:type (stat test-dict)) 'directory))
	(begin
		(format #t "Cannot find dictionary ~A\n" test-dict)
		(exit #f)))

(if (not (access? sent-file R_OK))
	(begin
		(format #t "Cannot find sentence file ~A\n" sent-file)
		(exit #f)))

; Perform comparison
(format #t "Verifying dicationary \"~A\" with sentences from \"~A\"\n"
	test-dict sent-file)


;; Set #:INCLUDE-MISSING to #f to disable the processing of sentences
;; containing words that the dictionary does not know about (i.e. to
;; disable unknown-word guessing.)
(define compare
	(make-lg-comparator (LgDictNode "en") (LgDictNode test-dict)
		#:INCLUDE-MISSING #t))

(define (process-file PORT)
	(define line (read-line PORT))
	(if (not (eof-object? line))
		(begin
			; The # symbol is a comment-card
			(if (and
				(< 0 (string-length line))
				; % is a comment for LG, ! is a directive for LG,
				; * means "bad sentence" and # is a comment for python
				(not (equal? #\# (string-ref line 0)))
				(not (equal? #\! (string-ref line 0)))
				(not (equal? #\* (string-ref line 0)))
				(not (equal? #\% (string-ref line 0))))
				(compare line))
			(process-file PORT))
		(compare #f)))

(process-file (open sent-file O_RDONLY))

(format #t "Finished verifying dictionary \"~A\" with sentences from \"~A\"\n"
	test-dict sent-file)
