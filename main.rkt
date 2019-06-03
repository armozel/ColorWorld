#lang racket

(require
  2htdp/image
  "colorcell.rkt")

(define colorworld%
  (class object%
    (init-field
     [row 1]
     [col 1])
    (define color-cells (for/list ([i (in-range row)])
                          (for/list ([j (in-range col)])
                            (new colorcell%))))
    ;;; TODO Add draw logic here
    (define/public (draw scene)
      (void))
    (super-new)))