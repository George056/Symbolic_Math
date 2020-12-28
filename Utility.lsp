;George Cook
;Some helpful functions that do not belong in other locations

;**********************************************************************************
;@name: contains
;@author: George Cook
;@version: 1.0.0
;@description: This function works like member, but looks into sublists
;@param: lst, the list to be searched
;@param: target, the item you are looking for
;@return: Either T or NIL
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
;@name: myreplace
;@author: Dr. Baird
;@description: This replaces all instances of old with new in the provided list.
;@param: old, the value that is being matched to in the list
;@param: new, the value that replaces old in the list
;@param: lst, the list that is being modified
;@return: The modified list
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

(defun iseven (num)
	(cond
		((numberp num) (= (mod num 2) 0))
		(T nil)
	)
)