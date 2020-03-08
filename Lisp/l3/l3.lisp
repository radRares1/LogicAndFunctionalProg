
;4. Write a function that returns the product of numeric atoms in a list, at any level

;product(n)= n, if n is a number;
; 			 product from 1 to size(n) of product(Ni), if n is a list
;			 1, otherwise

(defun product(n)
  (cond
    ((numberp n) n)
    ((listp n) (apply #'*(mapcar #' product n)))
    (t 1)
    )
  )

(print (product '(2 3 (A B 4 1 ))))
(print (product '()))
(print (product '0))
(print (product 'A))