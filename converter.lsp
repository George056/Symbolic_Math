;George Cook
;Converter
;Converts n-fix to pre-fix
;Converts pre-fix to n-fix
;@note: they both can convert from one to the other

(defun infix_to_prefix (fun)
	(cond
		((or (atom fun) (= (list-length fun) 1)) fun)
		((member (car fun) unary_operators) (list (car fun) (if (atom (cadr fun))
			(infix_to_prefix (list (cadr fun)))
			(infix_to_prefix (cadr fun)))))
		((and (equal (type-of (car fun)) 'symbol) (string= (car fun) '-) (= (list-length fun) 2))
			(list (car fun) (infix_to_prefix (cadr fun))))
		(T (list (second fun) (infix_to_prefix (first fun)) (infix_to_prefix (third fun))))
	)
)

(defun prefix_to_nfix (fun)
	(cond 
		((or (atom fun) (= (list-length fun) 1)) fun)
		((member (car fun) unary_operators) (list (car fun) (if (atom (cadr fun))
			(prefix_to_nfix (list (cadr fun)))
			(prefix_to_nfix (cadr fun)))))
		((and (equal (type-of (car fun)) 'symbol) (string= (car fun) '-) (= (list-length fun) 2))
			(list (car fun) (prefix_to_nfix (cadr fun))))
		(T (list (prefix_to_nfix (cadr fun)) (car fun) (prefix_to_nfix (caddr fun))))
	)
)