

;1. Write a function to check if an atom is
; member of a list (the list is non-liniar)


(defun hasAtom( x l)
  (cond
    ((null l) 0)
    ((and (equal l x) (atom l)) 1)
    ((atom l) 0)
    (t (apply #'+ (mapcar (lambda(l) (hasAtom x l)) l)))
    )
  )

;(print (hasAtom 5 '(9 (1 2 3) 7 (0))))

;2. Write a function that returns 
;the sum of numeric atoms in a list, at any level

(defun sum (l)
  (cond
  ((null l) 0)
  ((numberp l ) l)
  ((atom l) 0)
  (t (apply '+ (mapcar #'sum l)))
    )
  )

;(print (sum '(1 2 3 (A 5) (B 1))))

;3. Define a function to tests the membership of a node in a n-tree represented as (root
;list_of_nodes_subtree1 ... list_of_nodes_subtreen)
;Eg. tree is (a (b (c)) (d) (E (f))) and the node is "b" => true


(defun hasNode(x l)
  (cond
    ((null l) nil)
    ((and (equal l x) (atom l)) t)
    ((atom l) nil)
    (t (reduce (lambda (x y) (or x y)) (mapcar (lambda (l) (hasNode x l)) l)))
    )
  )

;(print (hasNode 'b '(a (b (c)) (d) (E (f))) ))

;4. Write a function that returns 
;the product of numeric atoms in a list, at any level.

(defun prod(l)
  (cond
  ((null l) nil)
  ((numberp l) l)
  ((atom l) 1)
  (t (apply '* (mapcar 'prod l)))
    )
  )

(print (prod '(1 2 3 (A B (5)))))

;5. Write a function that computes the sum of even numbers and the decrease the sum of odd numbers,
;at any level of a list.


(defun play(l)
  (cond
  ((null l) 0)
  ((and (numberp l) (= (mod l 2) 0)) l)
  ((and (numberp l) (= (mod l 2) 1)) (- l))
  ((atom l) 0)
  (t (apply '+ (mapcar 'play l)))
    )
  )


;(print (play '(1 2 (3 5) (A B))))

;6. Write a function that returns the maximum of numeric atoms in a list, at any level.


(defun maxNum(l)
  (cond
    ((null l) 0)
    ((numberp l) l)
    ((atom l) 0)
    (t (apply 'max (mapcar 'maxNum l)))
    )
  )


;(print (maxNum '(1 2 3 4 (A (B 5)))))

;7. Write a function that substitutes an element E with all elements of a list L1 at all levels of a given list
;L.

(defun rep(l e c)
  (cond 
    ((equal l e) c)
    ((atom l) l)
    (t (apply 'list (mapcar (lambda (L) (rep L e c)) l)))
    )
  )



;(print (rep '(9 (1 7) (9 (10 11))) 9 '(a b)))

;8. Write a function to determine the number of nodes on the level k from a n-tree represented as follows:
;(root list_nodes_subtree1 ... list_nodes_subtreen)
;Eg: tree is (a (b (c)) (d) (e (f))) and k=1 => 3 nodes


(defun cnt(l k n)
  (cond
	  ((and (= k n) (atom l)) 1)
	  ((atom l) 0)
	  (t (apply '+ (mapcar (lambda (L) (cnt L k (+ 1 n))) l)))
  )
)

;(print (cnt '(a (b (c)) (d) (e (f))) 1 -1))


;9. Write a function that removes all occurrences of an atom from any level of a list.

(defun removeOc(l e)
  (cond
    ((atom l) l)
    (t (mapcar (lambda (l) (removeOc l e)) (remove e l)))
    )
  )


;(print (removeOc (removeOc '((1) (2 3 1) (1 (2 3 (1)))) 1 ) nil))

;10.Define a function that replaces one node with another one in a n-tree represented as: root
;list_of_nodes_subtree1... list_of_nodes_subtreen)
;Eg: tree is (a (b (c)) (d) (e (f))) and node 'b' will be replace with node 'g' => tree (a (g (c)) (d) (e (f)))}


(defun replaceNode (l e e2)
  (cond
    ((null l) nil)
    ((equal e l) e2)
    ((atom l) l)
    (t (apply 'list (mapcar (lambda (L) (replaceNode L e e2)) l)))
    )
  )

;(print (replaceNode '(a (b (c)) (d (e) (f))) 'e 'x ))
                              

;11. Write a function to determine the depth of a list.

(defun dep(l)
  (cond
  ((atom l) 0)
  (t (+ 1 (apply 'max (mapcar 'dep l))))
    )
  )

;(print (dep '(a (b (c)) (d (e) (f)))))


;12. Write a function that substitutes an element through another one at all levels of a given list


(defun replaceEl(l e1 e2)
  (cond
    ((null l) nil)
    ((equal e1 l) e2)
    ((atom l) l)
    (t (apply 'list (mapcar (lambda (L) (replaceEl L e1 e2)) l)))
    )
  )

;(print  (replaceEl '(1 2 (4 4) 3 4) '4 '5))


;13 depth of the three


(defun depthTree(l)
  (cond
  ((atom l) 0)
  (t  (+ 1 (apply 'max (mapcar 'depthTree l))))
  )
  )

;(print (depthTree '(a (b (c)) (d) (e (f))) ))


;14 count atoms from all levels

(defun countAtom(l)
  (cond
    ((atom l) 1)
    (t ( apply '+ (mapcar 'countAtom l)))
    )
  )

;(print (countAtom '(a (b (c)) (d) (e (f))) ))

;15 Write a function that reverses a list 
;together with all its sublists elements, at any level.

(defun reverseAll(l)
  (cond
    ((atom l) l)
    (t  (mapcar 'reverseAll (reverse l)))
  )
 )

;(print (reverseAll '(1 2 (2 4) 3 4 (5 6))))


;16  Write a function that produces the linear list of all atoms of a given list, from all levels, and written in
;the same order. Eg.: (((A B) C) (D E)) --> (A B C D E)

(defun lin(l)
  (cond
  ((atom l) (list l))
  (t (apply 'append (mapcar 'lin l)))
    )
  )

;(print (lin '(((A B) C) (D E))))




;s5

(defun replaceLevel(l k lvl)
  (cond
  ((and (atom l) (= k lvl)) 0)
  ((atom l) l)
  (t (apply 'list( mapcar (lambda(l) (replaceLevel l k (+ 1 lvl))) l)))
    )
  )

;(print (replaceLevel '(a (1 (2 b)) (c (d))) 2 0))

;s1


(defun replaceOdd(l e lvl)
  (cond 
  ((and (atom l) (equal (mod lvl 2) 1)) e)
  ((atom l) l)
  (t ( apply 'list( mapcar (lambda(l) (replaceOdd l e (+ 1 lvl))) l)))
    )
  )

;(print (replaceOdd '(a(b(g))(c(d(e))(f))) 'h -1))

;s6

(defun removeThree(l)
  (cond 
  ((and (numberp l) (equal (mod l 3) 0)) nil)
  ((atom l) (list l))
  (t (list (apply #'append ( mapcar 'removeThree l))))
    )
  )


;(print (remove nil (removeThree '(1(2 A (3 A))(6)))))










