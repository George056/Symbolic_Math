
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

   ;************************************************************************
   ; isvar
   ;
   ; return true or false to indicate whether or not argument is a variable
   ;
   ; (isvar 'u) => non-nil
   ; (isvar 'a) => nil

   (defun isvar (x)
     (member x match_variables))
   
   ;************************************************************************
   ; applyone
   ;
   ; apply one substitution pair  (called for each pair by applysub)
   ;
   ; (applyone '(x . a) '(+ x x)) => (+ a a)

   (defun applyone (sub patt)
     (cond ((null patt) nil)
           ((atom patt) (if (eq patt (car sub)) (cdr sub) patt))
           (t (cons (applyone sub (car patt)) (applyone sub (cdr patt))))))

   ;************************************************************************
   ; applysub
   ;
   ; apply an entire substitution to a term (calls applyone to do the work)
   ;
   ; (applysub '((x . a)(y . b)) '(+ x y)) => (+ a b)
   ; (applysub '((x . a)) 'x) => a
   ; (applysub '(nil) '(+ x y)) => (+ x y)

   (defun applysub (subst patt)
       (if (equal subst '(nil)) patt
          (do* ((subs subst (cdr subs)) (sub (car subs) (car subs)))
            ((null subs) patt)
          (setq patt (applyone sub patt)))))
      
   ;************************************************************************
   ; combine
   ;
   ; combine two substitutions into one
   ; note: if either is the "do nothing" substitution, it has no effect
   ;
   ; (combine '((x . a)(y . b)) '((v . c)(w . d))) => ((x . a)(y . b)(v . c)(w . d))
   ; (combine '(nil) '((x . a))) => ((x . a))

   (defun combine (sub1 sub2)
       (cond ((equal sub1 '(nil)) sub2)
             ((equal sub2 '(nil)) sub1)
             (t (append sub1 sub2))))
   ;************************************************************************
   ; match
   ;
   ; find the substitution which makes pattern identical to term
   ; note:   nil means they cannot be made identical
   ;       (nil) means they are already identical
   ;       ((x.a)(y + b c)) means replace x with a and y with (+ b c)
   ;
   ; (match '(+ a b) '(+ x y)) => ((x . a)(y . b))
   ; (match '(+ a b) '(+ a b)) => (nil)
   ; (match '(+ a b) '(+ x x)) => nil
   ; 
   ; this functions calls match1 to give an initial substition of '(nil)
   ; match1 does all of the work

   (defun match(term patt)
      (match1 term patt '(nil)))
        
   ;************************************************************************
   ; match1
   ;
   ; implements the match function described above
   ;
   ; the initial call is as for match, but with an initial substituion of '(nil)
   ;
   ; the following cases are handled:
   ;  1. both term and pattern are nil - match has completed successfully
   ;  2. pattern is a variable - it can be replaced by term and added to subst
   ;  3. both are atoms - if equal, match is done, otherwise they cannot match
   ;  4. either is an atom - since not equal and no variable present, no match
   ;  5. they are both lists - match the cars, if ok, add resulting subst to
   ;                           the subst in progress and match the cdrs (after
   ;                           applying the car subst to the cdr of the pattern)

   (defun match1 (term patt subst)
     (cond ((and (null patt) (null term)) subst)
           ((isvar patt) (combine (list (cons patt term)) subst))
           ((and (atom patt) (atom term))
              (if (eq patt term) subst nil))
           ((or (atom term) (atom patt)) nil)
           (t (let* ((sub (match (car term) (car patt))))
                 (cond ((null sub) nil)
                       ((equal sub '(nil))
                              (match1 (cdr term) (cdr patt) subst))
                       (t (match1 (cdr term) 
                                  (applysub sub (cdr patt)) 
                                  (combine sub subst))))))))                                                 
