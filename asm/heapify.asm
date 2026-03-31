HEAPIFY:
;   STACK
;   | RA    | -8
;   | n     | -7
;   | v     | -6
;   | i     | -5
;   | j     | -4
;   | k     | -3
;   | nv    | -2
    SWD     $2, $3, 0   ; RA
    SWD     $0, $3, 1   ; n
    SWD     $1, $3, 2   ; v
    ADI     $3, $3, 8
    LHI     $1, 0
    ADI     $1, $1, 1   ;; i = 1
    JMP     T23L4
T23L1:
    SWD     $1, $3, -5
T23L2:
    ADI     $2, $1, -1
    SHR     $0, $2
    LWD     $2, $3, -6
    SWD     $1, $3, -4  ;;; j
    SWD     $0, $3, -3  ;;; k
    ADD     $1, $2, $1
    LWD     $0, $1, 0
    LWD     $1, $3, -3
    SWD     $0, $3, -2  ;;; v[j] -> nv
    ADD     $1, $2, $1
    LWD     $0, $1, 0   ;;; v[k] -> pv
    LWD     $1, $3, -2
    SUB     $1, $0, $1
    BGZ     $1, T23L3   ;;; nv < pv -> break
    LWD     $1, $3, -4
    ADD     $1, $2, $1
    SWD     $0, $1, 0   ;;; v[j] <- pv
    LWD     $1, $3, -3
    LWD     $0, $3, -2
    ADD     $2, $2, $1
    SWD     $0, $2, 0   ;;; v[k] <- nv
    BGZ     $1, T23L2
T23L3:
    LWD     $1, $3, -5
    ADI     $1, $1, 1   ;; i++
T23L4:
    LWD     $0, $3, -7
    SUB     $0, $0, $1
    BGZ     $0, T23L1   ;; i < n
    LWD     $2, $3, -8
    ADI     $3, $3, -8
    JPR     $2
