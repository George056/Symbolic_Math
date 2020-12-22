;George Cook
;rules

;**********************************************************************************
;Simplification rules
;**********************************************************************************
(setq r1 '((+ m (- m)) 0))
(setq r2 '((+ 0 m) m))
(setq r3 '((+ m 0) m))
(setq r4 '((* m 0) 0))
(setq r5 '((* 0 m) 0))
(setq r6 '((+ (- m) m) 0))
(setq r7 '((- m m) 0))
(setq r8 '((+ m (- q)) (- m q)))
(setq r9 '((/ 0 m) 0))
(setq r10 '((/ (* m q) q) m))
(setq r11 '((- (- m)) m))
(setq r12 '((/ m m) 1))
(setq r13 '((* 1 m) m))
(setq r14 '((* m 1) m))
(setq r15 '((+ (* m q) (* m g)) (* m (+ q g))))
(setq r16 '((+ (* m q) (* g m)) (* m (+ q g))))
(setq r17 '((+ (* q m) (* m g)) (* m (+ q g))))
(setq r18 '((+ (* q m) (* g m)) (* m (+ q g))))
(setq r19 '((- 0 m) (- m)))
(setq r20 '((/ m (^ m q)) (/ 1 (^ m (- q 1)))))
(setq r21 '((/ (^ m g) (^ m q)) (/ 1 (^ m (- q g)))))
(setq r22 '((/ (^ o q) o) (^ o (- q 1))))
(setq r23 '((^ m (- q)) (/ 1 (^ m q))))
(setq r24 '((/ (/ m q) (/ g r)) (/ (* m r) (* q g))))
(setq r25 '((/ (* g m) (^ m q)) (/ g (^ m (- q 1)))))
(setq r26 '((/ (* o (^ m g)) (^ m q)) (/ o (^ m (- q g)))))
(setq r27 '((* (- 1) m) (- m)))
(setq r28 '((/ m m) 1))
(setq r29 '((* m (/ q g)) (/ (* m q) g)))
(setq r30 '((* m (/ q m)) q))
(setq r31 '((* (^ m q) (^ m g)) (^ m (+ q g))))
(setq r32 '((^ e (ln m)) m))
(setq r33 '((* (ln (r)) q) (ln (^ r q))))
(setq r34 '((^ (ln r) q) (ln (^ r q))))
(setq r35 '((* (ln r) q) (ln (^ r q))))
(setq r36 '((^ (ln (r)) q) (ln (^ r q))))
(setq simplification_rules (list r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r16 r17 r18 r19 r20 r21 r22 r23 r24 r25 r26 r27 r28 r29 r30 r31 r32 r33 r34 r35 r36))
;**********************************************************************************
;Laplace Rules
;**********************************************************************************
(setq l1 '((t) (/ 1 (^ s 2))))
(setq l2 '((^ t m) (/ (factorial m) (^ s (+ m 1)))))
(setq l3 '((^ e (* m t)) (/ 1 (s - m))))
(setq l4 '((sin (* m t)) (/ m (+ (^ s 2) (^ m 2)))))
(setq l4 '((cos (* m t)) (/ s (+ (^ s 2) (^ m 2)))))
(setq laplace_rules (list l2 l3 l4 l1))



