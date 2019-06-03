#lang racket

(require
  2htdp/image
  htdp/matrix
  "colorcell.rkt")

(provide colorworld%)

(define colorworld%
  (class object%
    (init-field
     [row 1]
     [col 1])
    ;;; Using matrix since code uses bst search which looks
    ;; to be faster on look up
    (define color-matrix
      (make-matrix
       col
       row
       (for/list ([i (in-range (* col row))])
         (new colorcell%))))
    (define/public (get-color-cells) color-cells)
    ;;; TODO Add draw logic here
    (define/public (draw scene)
      (void))
    (super-new)))

(define my-world (new colorworld%))
(define mt-sc (empty-scene 0 0))

(send my-world draw mt-sc)