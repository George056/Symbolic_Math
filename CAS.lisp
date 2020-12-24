;George Cook
;CAS lisp
(load 'simplify)
(load 'rules)
(load 'math)
(load 'converter)

(defun d/dx (u)
	(let* ((processed (nfix_to_prefix u)) (result))
		(setq processed (simplify processed simplification_rules))
		(setq result (d/d processed 'x))
		(if result
			(prefix_to_nfix (simplify result simplification_rules))
			(pprint "I was unable to do that.")
		)
	)
)

;derivative -- from textbook pg. 146
;extended for further uses (transindential functions added)
(defun d/d (fun x)
  (cond

    ;rules for a constant and for just x
    ((atom fun) (if (eq fun x) 1 0))
	
	;if a single atom list
	((= (list-length fun) 1) (d/d (car fun) x))
	
    ;rules for addition/subtraction of 2 functions being derived
    ((or (eq (first fun) '+) (eq (first fun) '-))
      (list (first fun) (d/d (second fun) x) (d/d (third fun) x))
    )

    ;product rule
    ((eq (first fun) '*)
      (list '+
        (list (first fun) (third fun) (d/d (second fun) x))
        (list (first fun) (second fun) (d/d (third fun) x))
      )
    )

    ;quotient rule
    ((eq (first fun) '/)
      (list '/
        (list '- (list '* (third fun) (d/d (second fun) x))
          (list '* (second fun) (d/d (third fun) x)))
        (list '* (third fun) (third fun))
      )
    )

    ;power rule
    ((and (eq (first fun) '^) (equal (second fun) x) (not (equal (type-of (third fun)) 'symbol)))
      (list '*
        (list '* (third fun)
          (if (eql (third fun) 2) 
            (second fun)
            (list (first fun) (second fun) (1- (third fun)))
          )
        )
        (d/d (second fun) x)
      )
    )

    ((string= (first fun) 'cos) 
      (list '* (d/d (cadr fun) x) (list '- (list 'sin (cadr fun))))
    )

    ((string= (first fun) 'sin) 
		(list '* (d/d (cadr fun) x) (list 'cos (cadr fun)))
    )

    ((string= (first fun) 'tan) 
		(list '* (d/d (cadr fun) x) (list '^ (list 'sec (cadr fun)) 2))
    )
	
	((string= (car fun) 'sec)
		(list '* (d/d (cadr fun) x) (list '* (list 'tan (cadr fun)) (list 'sec (cadr fun))))
	)
	
	((string= (car fun) 'csc)
		(list '* (list '- (d/d (cadr fun) x)) (list '* (list 'csc (cadr fun)) (list 'cot (cadr fun))))
	)
	
	((string= (car fun) 'cot)
		(list '* (list '- (d/d (cadr fun) x)) (list '^ (list 'csc (cadr fun)) 2))
	)

    ((string= (first fun) 'acos) ;-1/sqrt(1-x^2)
		(list '/ (list '- (d/d (cadr fun) x)) (list 'sqrt (list '- 1 (list '^ (cadr fun) 2))))
    )

    ((string= (first fun) 'asin) ;1/sqrt(1-x^2)
		(list '/ (d/d (cadr fun) x) (list 'sqrt (list '- 1 (list '^ (cadr fun) 2))))
    )

    ((string= (first fun) 'atan) ;1/(1+x^2)
		(list '/ (d/d (cadr fun) x) (list '+ 1 (list '^ (cadr fun) 2)))
    )
	
	((string= (car fun) 'asec) ;d/d fun /(fun^2 sqrt(1 - 1/fun^2))
		(list '/ 
			(d/d (cadr fun) x) 
			(list '* 
				(list '^ (cadr fun) 2) 
				(list 'sqrt 
					(list '- 1 (list '/ 1 (list '^ (cadr fun) 2))))))
	)
	
	((string= (car fun) 'acsc) ;- d/d asec(fun)
		(list '/ 
			(list '- (d/d (cadr fun) x)) 
			(list '* 
				(list '^ (cadr fun) 2) 
				(list 'sqrt 
					(list '- 1 (list '/ 1 (list '^ (cadr fun) 2))))))
	)
	
	((string= (car fun) 'acot) ;-a/(1+(ax)^2)
		(list '/ (list '- (d/d (cadr fun) x)) (list '+ 1 (list '^ (cadr fun) 2)))
	)

    ((string= (first fun) 'cosh) ;sinh(x)
		(list '* (d/d (cadr fun) x) (list 'sinh (cadr fun)))
    )

    ((string= (first fun) 'sinh) ;cosh(x)
		(list '* (d/d (cadr fun) x) (list 'cosh (cadr fun)))
    )

    ((string= (first fun) 'tanh) ;sech(x)^2
		(list '* (d/d (cadr fun) x) (list '^ (list 'sech (cadr fun)) 2))
    )
	
	((string= (car fun) 'sech) ;-tanh(x)sech(x)
		(list '* (list '- (d/d (cadr fun) x)) (list '* (list 'tanh (cadr fun)) (list 'sech (cadr fun))))
	)
	
	((string= (car fun) 'csch) ;-coth(x)csch(x)
		(list '* (list '- (d/d (cadr fun) x)) (list '* (list 'coth (cadr fun)) (list 'csch (cadr fun))))
	)
	
	((string= (car fun) 'coth) ;-csch(x)^2
		(list '* (list '- (d/d (cadr fun) x)) (list '^ (list 'csch (cadr fun)) 2))
	)

    ((string= (first fun) 'acosh) ;a/sqrt((ax)^2-1)
		(list '/ (d/d (cadr fun) x) (list 'sqrt (list '- 1 (list '^ (cadr fun) 2))))
    )

    ((string= (first fun) 'asinh) ;a/sqrt(1+(ax)^2)
		(list '/ (d/d (cadr fun) x) (list 'sqrt (list '+ 1 (list '^ (cadr fun) 2))))
    )

    ((string= (first fun) 'atanh) ;a/(1-(ax)^2)
		(list '/ (d/d (cadr fun) x) (list '- 1 (list '^ (cadr fun) 2)))
    )
	
	((string= (car fun) 'asech) ;-1/(x sqrt(1-(ax)^2))
		(list '/ (list '- (d/d (cadr fun) x)) (list '* (cadr fun) (list 'sqrt (list '- 1 (list '^ (cadr fun) 2)))))
	)
	
	((string= (car fun) 'acsch) ;-a/(|ax| sqrt(1+(ax)^2))
		(list '/ (list '- (d/d (cadr fun) x)) (list '* (list 'abs (cadr fun)) (list 'sqrt (list '+ 1 (list '^ (cadr fun) 2)))))
	)
	
	((string= (car fun) 'acoth) ;a/(1-(ax)^2)
		(list '/ (d/d (cadr fun) x) (list '- 1 (list '^ (cadr fun) 2)))
	)

    ((or (string= (first fun) 'ln) (and (string= (first fun) 'log) (= (list-length fun) 2)))
      (list '/ (d/d (cdr fun) x) (cadr fun))
    )

    ((string= (first fun) 'log10) ; d/d ln(fun) / ln(base)
		(list '/ (d/d '(ln (cdr fun)) x) (list 'ln (list 10)))
    )
	
	((string= (first fun) 'lg) ; d/d ln(fun) / ln(base)
		(list '/ (d/d '(ln (cdr fun)) x) (list 'ln (list 2)))
    )
	
	((and (string= (first fun) 'log) (= (list-length fun) 3)) ; d/d ln(fun) / ln(base)
		(list '/ (d/d '(ln (cdr fun)) x) (list 'ln (cddr fun)))
    )
	;I^X
	((and (string= (car fun) '^) (not (equal (type-of (second fun)) 'symbol))) 
		(list '* (list 'ln (list (second fun))) (list '^ (second fun) x))
	)
	;x^x
	((and (string= (car fun) '^) (equal (second fun) x))
		(d/d (list '^ 'e (list '* (list 'ln (second fun)) (third fun))) x)
	)
	
	((and (equal (second fun) 'e) (string= (car fun) '^))
      (list '* (d/d (cddr fun) x) fun)
    )

    (t nil)
  )
)

(defun antiderivative (fun d)
	(let* ((processed (nfix_to_prefix fun)) (result))
		(setq processed (simplify processed simplification_rules))
		(setq result (anti-derivative processed d))
		(if result
			(prefix_to_nfix (simplify result simplification_rules))
			(pprint "I was unable to do that.")
		)
	)
)

(defun anti-derivative (fun d)
	(cond
		;constant or single var
		((atom fun) (if (equal fun d) 
			(list '/ (list '^ fun 2) 2)
			(list '* fun d)))
		
		;does not have the var in it
		((not (contains fun d)) (list '* fun d))
		
		((equal (first fun) '+) (list '+ (anti-derivative (second fun) d) (anti-derivative (third fun) d)))
		
		((and (equal (first fun) '-) (= (list-length fun) 3)) (list '- (anti-derivative (second fun) d) (anti-derivative (third fun) d)))
		
		((and (equal (first fun) '-) (= list-length fun) 2) (list '- (anti-derivative (second fun) d)))
		
		((and (string= (first fun) '^) (string= (second fun) d)) 
			(list '/ (list '^ (cadr fun) (+ (caddr fun) 1)) (+ (caddr fun) 1))
		)
		
		((and (equal (first fun) '^) (equal (second fun) 'e)) 
			(cond 
				((equal (third fun) d) fun)
				((atom (third fun)) (list '* fun d))
				((equal (first (third fun)) '*) 
					(if (xor (equal (second (third fun)) d) (equal (third (third fun)) d))
						(if (equal (second (third fun)) d) 
							(list '/ fun (third (third fun)))
							(list '/ fun (second (third fun)))
						)
					)
				)
				((equal (first (third fun)) '+)
					(if (xor (equal (second (third fun)) d) (equal (third (third fun)) d)) fun
						(if (and (equal (second (third fun)) d) (equal (third (third fun)) d)) nil
							(list '* fun d)
						)
					)
				)
				(T nil)
			)
		)
		
		((string= (first fun) 'cos)
			(list 'sin (cadr fun))
		)
		
		((string= (first fun) 'sin)
			(list '- (list 'cos (cadr fun)))
		)
		((string= (first fun) 'ln)
			(cond
				((or (atom (second fun)) (= (list-length (second fun)) 1)) 
					(list '- (list '* (list 'ln d) d) d))
				(T 
					(if (equal (second (second fun)) d) 
						(list '+ (list '* (list 'ln (third (second fun))) d) (list '- (list '* (list 'ln d) d) d))
						(list '+ (list '* (list 'ln (second (second fun))) d) (list '- (list '* (list 'ln d) d) d)))
				)
			)
		)
		((string= (first fun) 'tan)
			(cond
				((or (atom (second fun)) (= (list-length (second fun)) 1))
					(list '- (list 'ln (list 'abs (list 'cos d)))))
				(T 
					(if (equal (second (second fun)) d) 
						(list '* (list '- (list '/ 1 (third (second fun)))) (list 'ln (list 'abs (list 'cos d))))
						(list '* (list '- (list '/ 1 (second (second fun)))) (list 'ln (list 'abs (list 'cos d)))))
				)
			)
		)
	)
)

(defun laplace (fun)
	(prefix_to_nfix (simplify (nfix_to_prefix fun) laplace_rules))
)
