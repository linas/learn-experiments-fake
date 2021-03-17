

(define (block-until-idle)
	(define now (get-internal-run-time))
	(sleep 1)
	(if (< 0.1 (/ (- (get-internal-run-time) now) 1000000000.0))
		(begin (display "wait ...\n")
			(block-until-idle))))
(define (block-until-idle)
	(define busy-fraction 0.1)
	(define (block cpuuse)
		(sleep 1)
		(let ((now (get-internal-run-time)))
			(if (< busy-fraction (/ (- now cpuuse) 1000000000.0))
				(begin (display "wait ...\n")
					(block now)))))
	(block (get-internal-run-time)))
	
