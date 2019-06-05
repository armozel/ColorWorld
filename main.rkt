#lang racket

(require
  2htdp/universe
  2htdp/image
  "colorworld.rkt")

(define TICK-RATE 1/10)

(define (make-world row col)
  (new colorworld% [row row] [col col] [max-expireby 30]))

(define init-world-state
  (make-world 10 10))

(define mt-sc (empty-scene 0 0))

(define (run)
  (big-bang init-world-state
    [name "Demo"]
    [state #f]
    (on-tick
     (λ (w) (send w update)) TICK-RATE)
    (to-draw
     (λ (w) (send w draw mt-sc)))))

(run)