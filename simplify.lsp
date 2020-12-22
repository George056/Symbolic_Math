;Dr. Baird
;Simplify
(load 'MATCH)


(defun simplify (term rules)
	(let* ((new (applyallrules term rules)))
		(cond
			((equal new term) term)
			(T (simplify new rules))
		)
	)
)

(defun applyallrules (term rules)
	(cond
		((null rules) term)
		(T 
			(let* ((new (applyonerule term (car rules))))
				(applyallrules new (cdr rules))
			)
		)
	)
)

(defun applyonerule (term rule)
	(cond
		((null term) term)
		(T (let* ((sigma (match term (car rule))))
			(cond
				(sigma (applysub sigma (cadr rule)))
				((atom term) term)
				(T (cons (applyonerule (car term) rule) (applyonerule (cdr term) rule)))
			)
		))
	)
)