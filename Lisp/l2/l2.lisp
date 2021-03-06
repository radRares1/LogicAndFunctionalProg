
;L2:convert from type 2 to type 1
;(A (B) (C (D) (E))) -> (A 2 B 0 C 2 D 0 E 0) 



(defun convert(l)
   (cond
		((null l) nil)
		(T (cons (car l)  (cons (length(cdr l)) (append (convert (cadr l))(convert (caddr l))))))
   )
)


(print (convert '(A (B) (C (D) (E))))) 

;4.a funct that returns the sum of 2 vectors

(defun sum(a b)
  (if (null a)
    nil
    (cons (+ (car a) (car b)) (sum (cdr a) (cdr b)))
    )
)


(print (sum '(1 2 3) '(4 5 6)))

;4.b funct that  gets from a list all the atoms from any level
;b) Write a function to get from a given list the list of all atoms, on any
 ;level, but on the same order. Example:
; (((A B) C) (D E)) ==> (A B C D E)





(defun getAll (l)
    (cond
        ((null l) nil)
        ((listp (car l)) (append (getAll (car l)) (getAll (cdr l))))
        (t (cons (car l) (getAll (cdr l))))
    )
)

(print (getAll '(((A B) C) (D E))))


; c) Write a function that, with a list given as parameter, inverts only continuous
;  sequences of atoms. Example:
;  (a b c (d (e f) g h i)) ==> (c b a (d (f e) i h g))





(defun reverseConsecutive (l aux)
    (cond
        ((null l) (reverse aux))
        ((listp (car l)) (append (reverse aux) (cons (reverseConsecutive (car l) nil) (reverseConsecutive (cdr l) nil))))
        (T (reverseConsecutive (cdr l) (append aux (list (car l)))))
    )
)


(print (reverseConsecutive '(A B C (D (E F) G H I)) nil))

; d) Write a list to return the maximum value of the numerical atoms from a list, at superficial level.

(defun mmax (a b)
    (cond
        ((and (not (numberp a)) (not (numberp b))) nil)
        ((not (numberp a)) b)
        ((not (numberp b)) a)
        ((> a b) a)
        (t b)
    )
)

(defun maxList (l)
    (if (null (cdr l)) 
        (car l)
        (mmax (car l) (maxList (cdr l)))
    )
)

(print (maxList '(A 1 B 4 5 3 C F)))
    

