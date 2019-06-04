#lang racket

(provide colorcell%)
(require 2htdp/image)

(define (random-color)
  (make-color (add1 (random 255))
              (add1 (random 255))
              (add1 (random 255))))

(define colorcell%
  (class object%
    (init-field
     [tick 100]
     [size 20]
     [color (random-color)])
    (define expireby tick)
    (define current-color color)
    (define/public (update!)
      (cond [(= expireby 0)
             (set! current-color (random-color))
             (set! expireby tick)]
            [else
             (set! expireby (sub1 expireby))]))
    (define/public (draw scene)
      (beside (square size 'solid current-color) scene))
    (super-new)))