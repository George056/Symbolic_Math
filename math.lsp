;George Cook
;Math functions and constants

;create constants for use in the program
(setq variables '(s t v w x y z))
(setq match_variables '(g m o q r))
(setq e (exp 1))
(setq inf 'inf)
(setq nan 'nan)
(setq illegal_symbols (append (list 'e 'inf 'nan) variables))
(setq unary_operators (list 'ln 'lg 'log10 'log 'exp 'sqrt 'abs 'factorial '-
						'sin 'cos 'tan 'sec 'csc 'cot 
						'asin 'acos 'atan 'asec 'acsc 'acot
						'sinh 'cosh 'tanh 'sech 'csch 'coth
						'asinh 'acosh 'atanh 'asech 'acsch 'acoth))
(setq binary_operators (list '+ '- '* '/ '^))
(setq operators (append binary_operators unary_operators))

(if (not (fboundp 'isvar))
(defun isvar (term)
	(member term variables)
)
)

;^ function -- from textbook pg. 145
(defun ^ (base exponent)
  (expt base exponent)
)

;ln
(defun ln (value)
  (log value)
)

;lg
(defun lg (value)
  (log value 2)
)

;log10
(defun log10 (value)
  (log value 10)
)

(if (not (fboundp 'sec))
  (defun sec (value)
    (/ 1 (cos value))
  )
)

(if (not (fboundp 'csc))
  (defun csc (value)
    (/ 1 (sin value))
  )
)

(if (not (fboundp 'cot))
  (defun cot (value)
    (/ 1 (tan value))
  )
)

(if (not (fboundp 'sinh))
  (defun sinh (value)
    (/ (- (^ e value) (^ e (- 0 value))) 2)
  )
)

(if (not (fboundp 'cosh))
  (defun cosh (value)
    (/ (+ (^ e value) (^ e (- 0 value))) 2)
  )
)

(if (not (fboundp 'tanh))
  (defun tanh (value)
    (/ (sinh value) (cosh value))
  )
)

(if (not (fboundp 'sech))
  (defun sech (value)
    (/ 1 (cosh value))
  )
)

(if (not (fboundp 'csch))
  (defun csch (value)
    (/ 1 (sinh value))
  )
)

(if (not (fboundp 'coth))
  (defun coth (value)
    (/ 1 (tanh value))
  )
)

(defun factorial (num)
	(cond
		((or (= num 1) (= num 0)) 1)
		(T (* num (factorial (- num 1))))
	)
)
