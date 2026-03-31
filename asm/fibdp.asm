FIBDP:
    SWD     $2, $3, 0
    SWD     $1, $3, 1
    SWD     $0, $3, 2
    ADI     $3, $3, 4
    ADI     $2, $0, -2
    ADD     $1, $1, $0
    LWD     $0, $1, 0
    BGZ     $0, DPEND
    LHI     $0, 0
    ADI     $0, $0, 1
    BLZ     $2, SETDP
    ADI     $0, $2, 1
    LWD     $1, $3, -3
    JAL     FIBDP
    SWD     $0, $3, -1
    LWD     $0, $3, -2
    LWD     $1, $3, -3
    ADI     $0, $0, -2
    JAL     FIBDP
    LWD     $1, $3, -1
    ADD     $0, $0, $1
SETDP:
    LWD     $2, $3, -2
    LWD     $1, $3, -3
    ADD     $1, $1, $2
    SWD     $0, $1, 0
DPEND:
    LWD     $2, $3, -4
    ADI     $3, $3, -4
    JPR     $2
