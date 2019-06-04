#lang racket

(require
  2htdp/image
  "colorcell.rkt")

(provide colorworld%)

(define colorworld%
  (class object%
    (init-field
     [row 1]
     [col 1])
    ;;; Using 2d list construction since matrix lib offers nothing useful here
    (define color-cells
      (for/list ([r (in-range row)])
        (for/list ([c (in-range col)])
          (new colorcell%))))
    
    (define/public (get-color-cells) color-cells)
    ;;; TODO find a better way to use fold or some kind of recursive accumulator here
    (define/public (draw scene)
      (define color-rows
        (for/list ([r color-cells])
          (foldr (λ (c sc) (send c draw sc)) scene r)))
      (foldr (λ (r sc)
               (above r sc)) scene color-rows))
    (super-new)))