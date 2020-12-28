;George Cook
;Some helpful functions that do not belong in other locations

;**********************************************************************************
(defun contains (lst target)
	(cond
		((atom lst) (if (eq lst target)
			T
			nil
		))
		(T (or (contains (car lst) target) (contains (cdr lst) target)))
	)
)
;**********************************************************************************

;**********************************************************************************
(defun myreplace (old new lst)
	(cond
		((null lst) nil)
		((atom lst) (if (equal lst old) new lst))
		(t
			(cons (myreplace old new (car lst)) (myreplace old new (cdr lst)))
		)
	)
)
;**********************************************************************************

;**********************************************************************************
(defun iseven (num)
	(cond
		((numberp num) (= (mod num 2) 0))
		(T nil)
	)
)
;**********************************************************************************