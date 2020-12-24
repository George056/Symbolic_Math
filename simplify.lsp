;Dr. Baird
;George Cook
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

(defun number_simplify (term)
	(let* ((new (number_simplify_helper term)))
		(cond
			((null new) (pprint "I could not do that."))
			((equal new term) term)
			(T (number_simplify new))
		)
	)
)

(defun number_simplify_helper (term)
	(cond
		((atom term) term)
		((= (length term) 1) (car term))
		((not (contains operators (car term))) nil)
		((and (contains unary_operators (car term)) (= (length term) 2))
			(cond
				((numberp (cadr term)) (eval term))
				((listp (cadr term)) (list (car term) (number_simplify (cadr term))))
				(T term)
			)
		)
		((and (contains binary_operators (car term)) (= (length term) 3))
			(cond
				((and (numberp (cadr term)) (numberp (caddr term))) (eval term))
				((listp (cadr term)) (list (car term) (number_simplify (cadr term)) (caddr term)))
				((listp (caddr term)) (list (car term) (cadr term) (number_simplify (caddr term))))
				(T term)
			)
		)
	)
)