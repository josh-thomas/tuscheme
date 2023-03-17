;;; JOSH THOMAS AND HELINA MESFIN;;;
;;; CS 105 HW 6 ;;;



;;(* **** Part B **** *)

;;;;
;;;


(val drop 
  (type-lambda ('a)
    (letrec
      [([drop-mono : (int (list 'a) -> (list 'a))]
            (lambda ([n : int] [xs : (list 'a)])
                (if ([@ null? 'a] xs)
                    [@ '() 'a]
                    (if ([@ = int] n 0)
                        xs
                        (drop-mono (- n 1) ([@ cdr 'a] xs))))))]
    drop-mono)))

(check-type drop (forall ['a] (int (list 'a) -> (list 'a))))
(check-expect ([@ drop int] 2 '(1 2 3 4)) '(3 4))
(check-expect ([@ drop int] 5 '()) [@ '() int])
(check-expect ([@ drop sym] 3 '(a b c d)) '(d))
(check-expect ([@ drop int] 0 '(2 4 6 8 10)) '(2 4 6 8 10))

;; (takewhile n xs) takes in a natural number n and a list xs 
;; and returns the first n elements of xs.

(val takewhile
  (type-lambda ('a)
    (letrec
      [([takewhile-mono : (int (list 'a) -> (list 'a))]
          (lambda ([n : int] [xs : (list 'a)])
              (if ([@ null? 'a] xs)
                  [@ '() 'a ]
                  (if ([@ = int] n 0)
                    [@ '() 'a]
                    ( [@ cons 'a] ([@ car 'a] xs) 
                      (takewhile-mono (- n 1) ([@ cdr 'a] xs)))
                    ))))]
    takewhile-mono)))

(check-type takewhile (forall ['a] (int (list 'a) -> (list 'a))))
(check-expect ([@ takewhile int] 4 '(1 2 3 4 5 6 7 8)) '(1 2 3 4))
(check-expect ([@ takewhile sym] 2 '()) [@ '() sym])