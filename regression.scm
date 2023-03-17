;; step 5 lits

(check-type 3 int)
(check-type #t bool)
(check-type 'hello sym)

;; step 6 if
(check-type (if #t 3 2) int)
(check-type (if #t 'hi 'oh) sym)
(check-type (if #f #t #f) bool)
(check-type-error (if #f 8 'hi))

;;step7 var
(val x 10)
(val y #t)
(val z 's)
(val g 2)
(val h 4)

(check-type x int)
(check-type y bool)
(check-type z sym)

;; step 10
(check-type (+ 1 1) int)
(check-type (- 2 1) int)
(check-type-error (+ 2 'a))
(check-type-error (/ 'lol 'ha))

;; step 11
(check-type (let ([x 1] [y 3] [z 4]) (+ x y)) int)
(check-type (let ([x #f] [y #f] [z #t]) (if x y z)) bool)
(check-type-error (let ([x 'a] [y #f] [z #t]) (if x y z)))

;; step 13
(check-type (set x 1) int)
(check-type (set y #f) bool)
(check-type (set z 'a) sym)
(check-type-error (set z (+ 1 2)))

(check-type (while #f (+ 1 2)) unit)
(check-type (while #t (/ 10 5)) unit)
(check-type-error (while 'a (- 1 2)))

(check-type (begin (set g 3) (set h 3 ) (+ 1 2)) int)
(check-type-error (begin (set y 'hello)))